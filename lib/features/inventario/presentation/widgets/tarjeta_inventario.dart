import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/utils/formateador_unidades.dart';
import 'package:fruti_express_jahr_admin/core/utils/formato_moneda.dart'; 
import 'package:fruti_express_jahr_admin/features/inventario/domain/entities/inventario.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';

class TarjetaInventario extends StatelessWidget {
  final Inventario item;
  final Producto producto;
  final bool estaActualizando;
  final VoidCallback onSumar;
  final VoidCallback onRestar;

  const TarjetaInventario({
    super.key,
    required this.item,
    required this.producto,
    required this.estaActualizando,
    required this.onSumar,
    required this.onRestar,
  });

  @override
  Widget build(BuildContext context) {
    final critico = item.esStockCritico(producto);
    final colorTema = critico ? Colors.red : Colors.green.shade700;
    final colorFondoCifra = critico ? Colors.red.shade50 : Colors.green.shade50;
    final colorBordeCifra = critico ? Colors.red.shade200 : Colors.green.shade200;

    return Card(
      margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // 📸 Imagen del Producto
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 60,
                height: 60,
                color: Colors.grey.shade200,
                child: producto.imagenUrl != null && producto.imagenUrl!.isNotEmpty
                    ? Image.network(
                        producto.imagenUrl!.trim(),
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(Icons.broken_image, color: Colors.grey),
                      )
                    : const Icon(Icons.image, color: Colors.grey),
              ),
            ),
            const SizedBox(width: 12),

            // 📝 Información del Producto
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    producto.nombre,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),

                  // 🌟 Lógica visual de precios
                  Row(
                    children: [
                      // 1. Precio final a cobrar (Consumido directo del modelo sin .toInt())
                      Text(
                        item.precioFinal(producto).formatoMoneda,
                        style: TextStyle(
                          color: Colors.green.shade800,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // 2. Caso A: Si la sucursal tiene un remate propio
                      if (item.tieneRemateLocal) ...[
                        const SizedBox(width: 8),
                        Text(
                          producto.precioActual.formatoMoneda,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'Local',
                            style: TextStyle(color: Colors.orange, fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]
                      // 3. Caso B: Si hay una oferta global desde el catálogo
                      else if (item.tieneDescuentoGlobal(producto)) ...[
                        const SizedBox(width: 8),
                        Text(
                          producto.precioComparacion!.formatoMoneda,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'Oferta',
                            style: TextStyle(color: Colors.blue, fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // ⚙️ Controles de Stock (+ / -)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline, color: Colors.orange),
                  onPressed: estaActualizando ? null : onRestar,
                ),

                // 📦 Cifra central de Stock Disponible
                Container(
                  width: 60,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                    color: colorFondoCifra,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: colorBordeCifra),
                  ),
                  child: estaActualizando
                      ? SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2, color: colorTema),
                        )
                      : Text(
                          // 🌟 Usamos el formateador nativo del enum del producto
                          producto.unidadMedida.formatear(item.stockDisponible),
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: colorTema),
                        ),
                ),

                IconButton(
                  icon: const Icon(Icons.add_circle_outline, color: Colors.green),
                  onPressed: estaActualizando ? null : onSumar,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}