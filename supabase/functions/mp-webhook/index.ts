import { createClient } from "npm:@supabase/supabase-js@2";

function json(body: Record<string, unknown>, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { "Content-Type": "application/json", "Cache-Control": "no-store" },
  });
}

async function hmacHex(secret: string, manifest: string): Promise<string> {
  const key = await crypto.subtle.importKey(
    "raw",
    new TextEncoder().encode(secret),
    { name: "HMAC", hash: "SHA-256" },
    false,
    ["sign"],
  );
  const sig = await crypto.subtle.sign(
    "HMAC",
    key,
    new TextEncoder().encode(manifest),
  );
  return Array.from(new Uint8Array(sig))
    .map((b) => b.toString(16).padStart(2, "0"))
    .join("");
}

function safeEqual(a: string, b: string): boolean {
  if (a.length !== b.length) return false;
  let diff = 0;
  for (let i = 0; i < a.length; i++) diff |= a.charCodeAt(i) ^ b.charCodeAt(i);
  return diff === 0;
}

async function validateSignature(
  xSignature: string,
  xRequestId: string,
  dataId: string,
  secret: string,
): Promise<{ valid: boolean; reason: string }> {
  const parts: Record<string, string> = {};
  for (const part of xSignature.split(",")) {
    const i = part.indexOf("=");
    if (i <= 0) continue;
    parts[part.slice(0, i).trim()] = part.slice(i + 1).trim();
  }

  const ts = parts.ts;
  const v1 = parts.v1?.toLowerCase();
  if (!ts || !v1) return { valid: false, reason: "malformed_signature" };
  if (!/^\d+$/.test(ts)) return { valid: false, reason: "invalid_timestamp" };
  if (!/^[a-f0-9]{64}$/.test(v1)) {
    return { valid: false, reason: "invalid_hash_format" };
  }

  // Según la documentación, el id alfanumérico va en minúsculas.
  const candidates = [...new Set([dataId.toLowerCase(), dataId])];
  for (const id of candidates) {
    const manifest = `id:${id};request-id:${xRequestId};ts:${ts};`;
    if (safeEqual(await hmacHex(secret, manifest), v1)) {
      return { valid: true, reason: "valid" };
    }
  }
  return { valid: false, reason: "signature_mismatch" };
}

Deno.serve(async (req: Request) => {
  if (req.method !== "POST") return json({ error: "Método no permitido." }, 405);

  try {
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    const mpToken = Deno.env.get("MERCADOPAGO_ACCESS_TOKEN");
    const webhookSecret = Deno.env.get("MERCADOPAGO_WEBHOOK_SECRET")?.trim();

    if (!supabaseUrl || !serviceKey || !mpToken || !webhookSecret) {
      console.error("Falta configurar una variable requerida.");
      return json({ error: "Configuración incompleta del servidor." }, 500);
    }

    // 1. Firma de la notificación.
    const xSignature = req.headers.get("x-signature");
    const xRequestId = req.headers.get("x-request-id");
    const dataId = new URL(req.url).searchParams.get("data.id");

    if (!xSignature || !xRequestId || !dataId) {
      console.error("Notificación incompleta.");
      return json({ error: "Notificación incompleta." }, 401);
    }

    const sig = await validateSignature(
      xSignature,
      xRequestId,
      dataId,
      webhookSecret,
    );
    if (!sig.valid) {
      console.error("Firma de Mercado Pago rechazada.", {
        reason: sig.reason,
        dataIdLength: dataId.length,
      });
      return json({ error: "Firma inválida." }, 401);
    }

    // 2. Cuerpo.
    const body = await req.json().catch(() => null);
    if (!body || typeof body !== "object" || Array.isArray(body)) {
      return json({ error: "Cuerpo inválido." }, 400);
    }
    if (
      body.data?.id != null &&
      String(body.data.id).toLowerCase() !== dataId.toLowerCase()
    ) {
      console.error("El ID del cuerpo no coincide con el firmado.");
      return json({ error: "ID inconsistente." }, 400);
    }
    if (body.type !== "order") return json({ received: true });

    // 3. No se confía en el cuerpo: se consulta la orden a Mercado Pago.
    const mpRes = await fetch(
      `https://api.mercadopago.com/v1/orders/${encodeURIComponent(dataId)}`,
      {
        headers: {
          Authorization: `Bearer ${mpToken}`,
          Accept: "application/json",
        },
        signal: AbortSignal.timeout(10000),
      },
    );

    if (mpRes.status === 400 || mpRes.status === 404) {
      console.warn("La orden no existe en Mercado Pago.");
      return json({ received: true });
    }
    if (!mpRes.ok) {
      console.error("Error consultando Orders API.", { status: mpRes.status });
      return json({ error: "No se pudo consultar la orden." }, 500);
    }

    const mpOrder = await mpRes.json();
    if (String(mpOrder.id).toLowerCase() !== dataId.toLowerCase()) {
      console.error("El ID de la orden no coincide.");
      return json({ error: "Orden inconsistente." }, 502);
    }

    // 4. Pedido interno por external_reference.
    const externalRef = mpOrder.external_reference;
    if (!externalRef) {
      console.error("La orden de MP no trae external_reference.");
      return json({ received: true });
    }

    const admin = createClient(supabaseUrl, serviceKey, {
      auth: { persistSession: false, autoRefreshToken: false },
    });

    const { data: order, error: lookupError } = await admin
      .from("orders")
      .select("id, total, status, mp_order_id")
      .eq("id", externalRef)
      .maybeSingle();

    if (lookupError) {
      console.error("Error buscando el pedido.", { message: lookupError.message });
      return json({ error: "No se pudo consultar el pedido." }, 500);
    }
    if (!order) {
      console.warn("No hay pedido interno para esta orden.");
      return json({ received: true });
    }

    const status = mpOrder.status as string | undefined;
    const statusDetail = mpOrder.status_detail as string | undefined;

    // 5a. Pago acreditado.
    if (status === "processed" && statusDetail === "accredited") {
      const paidCents = Math.round(
        Number(mpOrder.total_paid_amount ?? mpOrder.total_amount) * 100,
      );
      if (!Number.isSafeInteger(paidCents) || paidCents !== Number(order.total)) {
        console.error("El importe pagado no coincide.", {
          orderId: order.id,
          paidCents,
          expectedCents: order.total,
        });
        return json({ error: "El importe pagado no coincide." }, 409);
      }

      if (order.status === "pendingPayment") {
        await admin
          .from("orders")
          .update({ mp_order_id: mpOrder.id })
          .eq("id", order.id)
          .eq("status", "pendingPayment");

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
        console.log("Pedido confirmado por webhook.", { orderId: order.id });
      } else if (order.mp_order_id && order.mp_order_id !== mpOrder.id) {
        // Dos cobros distintos para el mismo pedido: requiere reembolso manual.
        console.error("POSIBLE DOBLE COBRO: revisar y reembolsar.", {
          orderId: order.id,
          registrada: order.mp_order_id,
          nueva: mpOrder.id,
        });
      } else if (order.status === "cancelled") {
        // Se cobró un pedido que ya estaba cancelado: requiere reembolso.
        console.error("COBRO SOBRE PEDIDO CANCELADO: reembolsar.", {
          orderId: order.id,
          mpOrderId: mpOrder.id,
        });
      } else {
        console.log("Notificación repetida; el pedido ya estaba procesado.", {
          orderId: order.id,
          orderStatus: order.status,
        });
      }
      return json({ received: true });
    }

    // 5b. Pago fallido, cancelado o vencido: solo si es el cobro registrado
    // en el pedido. Un rechazo anterior no debe cancelar el pedido.
    if (status === "failed" || status === "canceled" || status === "expired") {
      if (order.status === "pendingPayment" && order.mp_order_id === mpOrder.id) {
        const { error: releaseError } = await admin.rpc("release_unpaid_order", {
          p_order_id: order.id,
        });
        if (releaseError) {
          console.error("Error en release_unpaid_order.", {
            orderId: order.id,
            message: releaseError.message,
          });
          return json({ error: "No se pudo liberar el pedido." }, 500);
        }
        console.log("Pedido liberado por pago fallido.", {
          orderId: order.id,
          status,
        });
      } else {
        console.log("Aviso de fallo ignorado.", { orderId: order.id, status });
      }
      return json({ received: true });
    }

    console.log("Sin cambio de estado final.", {
      orderId: order.id,
      status: status ?? null,
      statusDetail: statusDetail ?? null,
    });
    return json({ received: true });
  } catch (error) {
    console.error(
      "Error inesperado en mp-webhook.",
      error instanceof Error ? error.message : "Error desconocido",
    );
    return json({ error: "Error interno procesando la notificación." }, 500);
  }
});