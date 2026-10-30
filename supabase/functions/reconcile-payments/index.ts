import { createClient } from "npm:@supabase/supabase-js@2";

function json(body: Record<string, unknown>, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { "Content-Type": "application/json", "Cache-Control": "no-store" },
  });
}

function safeEqual(a: string, b: string): boolean {
  if (a.length !== b.length) return false;
  let diff = 0;
  for (let i = 0; i < a.length; i++) diff |= a.charCodeAt(i) ^ b.charCodeAt(i);
  return diff === 0;
}

const BATCH_SIZE = 25;

Deno.serve(async (req: Request) => {
  if (req.method !== "POST") return json({ error: "Método no permitido." }, 405);

  try {
    // 1. Solo el cron (con el secreto compartido) puede ejecutarla.
    const expected = Deno.env.get("RECONCILE_SECRET");
    const provided = req.headers.get("x-reconcile-secret");
    if (!expected || !provided || !safeEqual(provided, expected)) {
      return json({ error: "No autorizado." }, 401);
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    const mpToken = Deno.env.get("MERCADOPAGO_ACCESS_TOKEN");
    if (!supabaseUrl || !serviceKey || !mpToken) {
      console.error("Falta configurar una variable requerida.");
      return json({ error: "Configuración incompleta del servidor." }, 500);
    }

    const admin = createClient(supabaseUrl, serviceKey, {
      auth: { persistSession: false, autoRefreshToken: false },
    });

    // 2. Pedidos con cobro iniciado que siguen sin resolverse
    // (se esperan 2 minutos para no pisar al cobro o al webhook en curso).
    const cutoff = new Date(Date.now() - 2 * 60 * 1000).toISOString();
    const { data: orders, error: listError } = await admin
      .from("orders")
      .select("id, total, status, mp_order_id")
      .eq("status", "pendingPayment")
      .eq("payment_method", "mercadoPago")
      .not("mp_order_id", "is", null)
      .lt("updated_at", cutoff)
      .order("created_at", { ascending: true })
      .limit(BATCH_SIZE);

    if (listError) {
      console.error("Error listando pedidos.", { message: listError.message });
      return json({ error: "No se pudieron listar los pedidos." }, 500);
    }

    const summary = {
      revisados: 0,
      confirmados: 0,
      liberados: 0,
      siguenPendientes: 0,
      errores: 0,
    };

    // 3. Se pregunta a Mercado Pago por cada uno.
    for (const order of orders ?? []) {
      summary.revisados++;
      try {
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
          console.error("Error consultando Orders API.", {
            orderId: order.id,
            status: mpRes.status,
          });
          summary.errores++;
          continue;
        }

        const mp = await mpRes.json();

        if (
          String(mp.id).toLowerCase() !== String(order.mp_order_id).toLowerCase() ||
          String(mp.external_reference) !== order.id
        ) {
          console.error("La orden de MP no corresponde al pedido.", {
            orderId: order.id,
          });
          summary.errores++;
          continue;
        }

        // 3a. Pago acreditado.
        if (mp.status === "processed" && mp.status_detail === "accredited") {
          const paidCents = Math.round(
            Number(mp.total_paid_amount ?? mp.total_amount) * 100,
          );
          if (!Number.isSafeInteger(paidCents) || paidCents !== Number(order.total)) {
            console.error("El importe pagado no coincide.", {
              orderId: order.id,
              paidCents,
              expectedCents: order.total,
            });
            summary.errores++;
            continue;
          }

          const { error: paidError } = await admin.rpc("mark_order_paid", {
            p_order_id: order.id,
          });
          if (paidError) {
            console.error("Error en mark_order_paid.", {
              orderId: order.id,
              message: paidError.message,
            });
            summary.errores++;
          } else {
            console.log("Pedido confirmado por conciliación.", {
              orderId: order.id,
            });
            summary.confirmados++;
          }
          continue;
        }

        // 3b. Pago fallido, cancelado o vencido: se libera el pedido.
        if (
          mp.status === "failed" || mp.status === "canceled" ||
          mp.status === "expired"
        ) {
          const { error: releaseError } = await admin.rpc(
            "release_unpaid_order",
            { p_order_id: order.id },
          );
          if (releaseError) {
            console.error("Error en release_unpaid_order.", {
              orderId: order.id,
              message: releaseError.message,
            });
            summary.errores++;
          } else {
            console.log("Pedido liberado por conciliación.", {
              orderId: order.id,
              status: mp.status,
            });
            summary.liberados++;
          }
          continue;
        }

        // 3c. Sigue en proceso: no se toca.
        summary.siguenPendientes++;
      } catch (error) {
        console.error("Error conciliando un pedido.", {
          orderId: order.id,
          message: error instanceof Error ? error.message : "desconocido",
        });
        summary.errores++;
      }
    }

    console.log("Conciliación terminada.", summary);
    return json({ ok: true, ...summary });
  } catch (error) {
    console.error(
      "Error en reconcile-payments.",
      error instanceof Error ? error.message : "Error desconocido",
    );
    return json({ error: "Error interno." }, 500);
  }
});