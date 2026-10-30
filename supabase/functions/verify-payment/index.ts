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
      return json({ error: "Configuración incompleta." }, 500);
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
    if (typeof orderId !== "string" || !orderId.trim()) {
      return json({ error: "order_id es obligatorio." }, 400);
    }

    // 3. Solo pedidos del propio usuario.
    const { data: order, error: orderError } = await supabase
      .from("orders")
      .select("id, total, status, payment_method, mp_order_id")
      .eq("id", orderId)
      .eq("customer_id", user.id)
      .maybeSingle();

    if (orderError) {
      console.error("Error consultando el pedido:", orderError.message);
      return json({ error: "No se pudo consultar el pedido." }, 500);
    }
    if (!order) return json({ error: "Pedido no encontrado." }, 404);

    // Ya resuelto, o todavía sin cobro iniciado: solo informar el estado.
    if (order.status !== "pendingPayment" || !order.mp_order_id) {
      return json({ status: order.status });
    }

    // 4. Consulta autenticada directa a Mercado Pago.
    const mpRes = await fetch(
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

    if (!mpRes.ok) {
      console.error("Error consultando Orders API.", { status: mpRes.status });
      return json({ error: "No se pudo consultar el pago." }, 502);
    }

    const mp = await mpRes.json();

    if (
      String(mp.id) !== order.mp_order_id ||
      String(mp.external_reference) !== order.id
    ) {
      console.error("La orden de MP no corresponde al pedido.", {
        orderId: order.id,
      });
      return json({ error: "Orden inconsistente." }, 409);
    }

    // 5. Solo confirma un pago acreditado con el importe correcto.
    if (mp.status === "processed" && mp.status_detail === "accredited") {
      const paidCents = Math.round(
        Number(mp.total_paid_amount ?? mp.total_amount) * 100,
      );
      const expectedCents = Number(order.total);

      if (
        !Number.isSafeInteger(paidCents) ||
        paidCents <= 0 ||
        paidCents !== expectedCents
      ) {
        console.error("El importe pagado no coincide.", {
          orderId: order.id,
          paidCents,
          expectedCents,
        });
        return json({ error: "El importe no coincide." }, 409);
      }

      const { error: paidError } = await admin.rpc("mark_order_paid", {
        p_order_id: order.id,
      });
      if (paidError) {
        console.error("Error en mark_order_paid.", {
          orderId: order.id,
          message: paidError.message,
        });
        return json({ error: "No se pudo confirmar el pedido." }, 500);
      }

      console.log("Pedido confirmado por verificación.", {
        orderId: order.id,
      });
    }

    // 6. Devolver el estado real del pedido.
    const { data: fresh } = await admin
      .from("orders")
      .select("status")
      .eq("id", order.id)
      .maybeSingle();

    return json({ status: fresh?.status ?? order.status });
  } catch (error) {
    console.error(
      "Error en verify-payment.",
      error instanceof Error ? error.message : "Error desconocido",
    );
    return json({ error: "Error verificando el pago." }, 500);
  }
});