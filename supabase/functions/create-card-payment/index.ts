import { createClient } from "npm:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers":
    "authorization, x-client-info, apikey, content-type",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
};

function json(body: Record<string, unknown>, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

const REJECTION_MESSAGES: Record<string, string> = {
  card_insufficient_amount: "La tarjeta no tiene fondos suficientes.",
  insufficient_amount: "La tarjeta no tiene fondos suficientes.",
  rejected_by_issuer: "Tu banco rechazó el pago. Intenta con otra tarjeta.",
  card_disabled: "La tarjeta está deshabilitada.",
  high_risk: "El pago fue rechazado por seguridad. Intenta con otra tarjeta.",
  invalid_installments:
    "Las mensualidades elegidas no son válidas para esta tarjeta.",
  bad_filled_card_data: "Revisa los datos de la tarjeta.",
  amount_limit_exceeded: "El monto supera el límite de la tarjeta.",
};

async function sha256Hex(text: string): Promise<string> {
  const data = new TextEncoder().encode(text);
  const hash = await crypto.subtle.digest("SHA-256", data);
  return Array.from(new Uint8Array(hash))
    .map((b) => b.toString(16).padStart(2, "0"))
    .join("");
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }
  if (req.method !== "POST") {
    return json({ error: "Método no permitido." }, 405);
  }

  try {
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const anonKey = Deno.env.get("SUPABASE_ANON_KEY") ??
      Deno.env.get("SUPABASE_PUBLISHABLE_KEY");
    const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    const mpToken = Deno.env.get("MERCADOPAGO_ACCESS_TOKEN");

    if (!supabaseUrl || !anonKey || !serviceKey || !mpToken) {
      console.error("Falta configurar una variable de entorno requerida.");
      return json({ error: "La pasarela de pagos no está configurada." }, 500);
    }

    // 1. Sesión del usuario.
    const authorization = req.headers.get("Authorization");
    if (!authorization?.startsWith("Bearer ")) {
      return json({ error: "Sesión no válida." }, 401);
    }

    const opts = { auth: { persistSession: false, autoRefreshToken: false } };
    const supabase = createClient(supabaseUrl, anonKey, {
      ...opts,
      global: { headers: { Authorization: authorization } },
    });
    const admin = createClient(supabaseUrl, serviceKey, opts);

    const { data: { user }, error: authError } = await supabase.auth.getUser(
      authorization.slice("Bearer ".length),
    );
    if (authError || !user) return json({ error: "Sesión no válida." }, 401);

    // 2. Entrada.
    const body = await req.json().catch(() => null);
    const orderId = body?.order_id;
    const token = body?.token;
    const paymentMethodId = body?.payment_method_id;
    const paymentTypeId = body?.payment_type_id;
    const installments = Number(body?.installments ?? 1);

    if (typeof orderId !== "string" || !orderId.trim()) {
      return json({ error: "order_id es obligatorio." }, 400);
    }
    if (typeof token !== "string" || !token.trim()) {
      return json({ error: "Falta el token de la tarjeta." }, 400);
    }
    if (typeof paymentMethodId !== "string" || !paymentMethodId.trim()) {
      return json({ error: "Falta la marca de la tarjeta." }, 400);
    }
    if (paymentTypeId !== "credit_card" && paymentTypeId !== "debit_card") {
      return json({ error: "Tipo de tarjeta no válido." }, 400);
    }
    if (!Number.isInteger(installments) || installments < 1) {
      return json({ error: "Mensualidades no válidas." }, 400);
    }

    // 3. Pedido del usuario (el monto lo decide el servidor).
    const { data: order, error: orderError } = await supabase
      .from("orders")
      .select(
        "id, total, status, payment_method, payment_expires_at, mp_order_id",
      )
      .eq("id", orderId)
      .eq("customer_id", user.id)
      .maybeSingle();

    if (orderError) {
      console.error("Error consultando el pedido:", orderError.message);
      return json({ error: "No se pudo consultar el pedido." }, 500);
    }
    if (!order) return json({ error: "Pedido no encontrado." }, 404);

    if (order.status !== "pendingPayment") {
      return json({ error: "El pedido no está pendiente de pago." }, 409);
    }
    if (order.payment_method !== "mercadoPago") {
      return json({ error: "El pedido no es de pago en línea." }, 409);
    }
    if (
      order.payment_expires_at &&
      new Date(order.payment_expires_at) <= new Date()
    ) {
      return json({ error: "El tiempo para pagar este pedido venció." }, 409);
    }

    // Si ya hay un cobro en curso, no se permite otro: evita el doble cobro.
    if (order.mp_order_id) {
      let previousStatus: string | null = null;
      try {
        const prevRes = await fetch(
          `https://api.mercadopago.com/v1/orders/${
            encodeURIComponent(order.mp_order_id)
          }`,
          {
            headers: {
              Authorization: `Bearer ${mpToken}`,
              Accept: "application/json",
            },
            signal: AbortSignal.timeout(10000),
          },
        );
        if (prevRes.ok) previousStatus = (await prevRes.json())?.status ?? null;
      } catch {
        // Sin respuesta: se asume que sigue en curso.
      }

      const finishedWithoutPayment = previousStatus === "failed" ||
        previousStatus === "canceled" || previousStatus === "expired";

      if (!finishedWithoutPayment) {
        return json({
          result: "pending",
          order_id: order.id,
          message: "Ya hay un pago en proceso para este pedido.",
        });
      }

      // El intento anterior terminó sin cobrarse: se libera para reintentar.
      await admin
        .from("orders")
        .update({ mp_order_id: null })
        .eq("id", order.id)
        .eq("status", "pendingPayment");
    }

    const totalInCents = Number(order.total);
    if (!Number.isSafeInteger(totalInCents) || totalInCents <= 0) {
      return json({ error: "El total del pedido no es válido." }, 400);
    }
    const formattedTotal = (totalInCents / 100).toFixed(2);

    const payerEmail = Deno.env.get("MERCADOPAGO_TEST_PAYER_EMAIL") ??
      user.email;
    if (!payerEmail) {
      return json({ error: "Tu cuenta no tiene un correo asociado." }, 400);
    }

    // 4. Crear y procesar la orden en Mercado Pago (modo automático).
    // No se envía expiration_time: no aplica en modo automático.
    const payload = {
      type: "online",
      processing_mode: "automatic",
      total_amount: formattedTotal,
      external_reference: order.id,
      payer: { email: payerEmail },
      transactions: {
        payments: [
          {
            amount: formattedTotal,
            payment_method: {
              id: paymentMethodId,
              type: paymentTypeId,
              token,
              installments,
            },
          },
        ],
      },
    };

    // Mismo pedido + mismo token = misma operación, así un reintento
    // por falla de red no cobra dos veces.
    const idempotencyKey = (await sha256Hex(`${order.id}:${token}`)).slice(
      0,
      32,
    );

    let mpRes: Response;
    try {
      mpRes = await fetch("https://api.mercadopago.com/v1/orders", {
        method: "POST",
        headers: {
          Authorization: `Bearer ${mpToken}`,
          "Content-Type": "application/json",
          "X-Idempotency-Key": idempotencyKey,
        },
        body: JSON.stringify(payload),
        signal: AbortSignal.timeout(25000),
      });
    } catch (error) {
      console.error("Sin respuesta de Mercado Pago.", {
        orderId: order.id,
        message: error instanceof Error ? error.message : "desconocido",
      });
      return json({
        error:
          "No pudimos confirmar el pago. Antes de intentar de nuevo, revisa tu pedido en unos minutos.",
      }, 504);
    }

    const mpText = await mpRes.text();
    let mp: any = null;
    try {
      mp = JSON.parse(mpText);
    } catch {
      // respuesta que no es JSON
    }

        if (!mpRes.ok) {
      const errorsText = JSON.stringify(mp?.errors ?? []);

      // Los rechazos de la tarjeta llegan como 402 con code "failed".
      const isCardRejection = mpRes.status === 402 ||
        (Array.isArray(mp?.errors) &&
          mp.errors.some((e: any) => e?.code === "failed"));

      if (isCardRejection) {
        console.log("Pago rechazado por Mercado Pago.", {
          orderId: order.id,
          errors: errorsText,
        });
        const knownKey = Object.keys(REJECTION_MESSAGES).find((k) =>
          errorsText.includes(k)
        );
        return json({
          result: "rejected",
          order_id: order.id,
          message: (knownKey && REJECTION_MESSAGES[knownKey]) ??
            "El pago fue rechazado. Revisa los datos de tu tarjeta o intenta con otra.",
        });
      }

      // No se registra el cuerpo completo: puede incluir el token.
      console.error("Mercado Pago rechazó la solicitud.", {
        status: mpRes.status,
        errors: errorsText,
        message: mp?.message ?? null,
      });
      return json({
        error:
          "No se pudo procesar el pago. Revisa los datos de tu tarjeta e inténtalo de nuevo.",
      }, mpRes.status >= 500 ? 502 : 422);
    }

    if (typeof mp?.id !== "string") {
      console.error("Respuesta incompleta de Orders API.");
      return json({ error: "La respuesta de la pasarela no es válida." }, 502);
    }

    if (
      mp.external_reference != null &&
      String(mp.external_reference) !== order.id
    ) {
      console.error("La referencia externa no coincide.", {
        orderId: order.id,
      });
      return json({ error: "Respuesta inconsistente." }, 409);
    }

    // Guarda el id de la orden de MP. Solo se llama cuando el pago se aprueba
    // o queda pendiente; en un rechazo no, para permitir otro intento.
    const saveMpOrderId = async () => {
      const { error } = await admin
        .from("orders")
        .update({ mp_order_id: mp.id })
        .eq("id", order.id)
        .eq("status", "pendingPayment");
      if (error) {
        console.error("No se pudo guardar mp_order_id.", {
          orderId: order.id,
          message: error.message,
        });
      }
    };

    const payment = mp.transactions?.payments?.[0];
    const status = mp.status as string | undefined;
    const detail = (payment?.status_detail ?? mp.status_detail) as
      | string
      | undefined;

    // 5a. Aprobado y acreditado.
    if (status === "processed" && mp.status_detail === "accredited") {
      await saveMpOrderId();

      const paidCents = Math.round(
        Number(mp.total_paid_amount ?? mp.total_amount) * 100,
      );
      if (!Number.isSafeInteger(paidCents) || paidCents !== totalInCents) {
        console.error("El importe pagado no coincide.", {
          orderId: order.id,
          paidCents,
          expectedCents: totalInCents,
        });
        return json({
          error:
            "El importe cobrado no coincide con el pedido. Contacta a soporte.",
        }, 409);
      }

      const { error: paidError } = await admin.rpc("mark_order_paid", {
        p_order_id: order.id,
      });
      if (paidError) {
        console.error("Error en mark_order_paid.", {
          orderId: order.id,
          message: paidError.message,
        });
        return json({
          error:
            "Tu pago se aprobó, pero no pudimos confirmar el pedido. No vuelvas a pagar y contacta a soporte.",
        }, 500);
      }

      return json({ result: "approved", order_id: order.id });
    }

    // 5b. Rechazado: el pedido sigue pendiente para reintentar con otra tarjeta.
    if (status === "failed" || status === "canceled") {
      console.log("Pago rechazado.", { orderId: order.id, detail });
      return json({
        result: "rejected",
        order_id: order.id,
        message: REJECTION_MESSAGES[detail ?? ""] ??
          "El pago no se pudo completar. Intenta con otra tarjeta.",
      });
    }

    // 5c. Cualquier otro estado (processing, action_required...): pendiente.
    await saveMpOrderId();
    console.log("Pago pendiente.", { orderId: order.id, status, detail });
    return json({ result: "pending", order_id: order.id });
  } catch (error) {
    console.error(
      "Error en create-card-payment.",
      error instanceof Error ? error.message : "Error desconocido",
    );
    return json({ error: "Ocurrió un error al procesar el pago." }, 500);
  }
});