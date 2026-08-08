import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/utils/formato_moneda.dart'; // 🌟 Tu súper extensión
import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/enums/unidad_medida_ui.dart';

class TarjetaProducto extends StatelessWidget {
  final Producto producto;
  final bool esAdminOEncargado;
  final Function(bool) onEstadoCambiado;
  final VoidCallback onEditar;

  const TarjetaProducto({
    super.key,
    required this.producto,
    required this.esAdminOEncargado,
    required this.onEstadoCambiado,
    required this.onEditar,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: producto.isActive ? 1.0 : 0.5,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // 🖼️ Imagen del Producto con Badge
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: 70,
                      height: 70,
                      color: Colors.grey.shade200,
                      child: producto.imagenUrl != null && producto.imagenUrl!.isNotEmpty
                          ? Image.network(
                              producto.imagenUrl!,
                              fit: BoxFit.cover,
                            )
                          : const Icon(
                              Icons.image_not_supported,
                              color: Colors.grey,
                            ),
                    ),
                  ),
                  // 🌟 Llamamos directamente al getter de la entidad
                  if (producto.tieneDescuento)
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.red.shade500,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          // 🌟 Consumimos el getter del porcentaje
                          '-${producto.porcentajeDescuento}%',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 16),

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
                    const SizedBox(height: 4),

                    // 🌟 PRECIOS: Usando la mágica extensión .formatoMoneda
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      spacing: 6,
                      children: [
                        Text(
                          // 🌟 Magia pura: int.formatoMoneda
                          producto.precioActual.formatoMoneda,
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        if (producto.tieneDescuento)
                          Text(
                            // 🌟 Magia pura x2
                            producto.precioComparacion!.formatoMoneda,
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12,
                            ),
                          ),
                      ],
                    ),

                    // Unidad de medida
                    Text(
                      'Por ${producto.unidadMedida.nombreUI}',
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                    ),
                    
                    if (producto.descripcion != null && producto.descripcion!.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Text(
                        producto.descripcion!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 11,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              // ⚙️ Controles
              if (esAdminOEncargado)
                Column(
                  children: [
                    Switch(
                      value: producto.isActive,
                      activeThumbColor: Colors.green,
                      onChanged: onEstadoCambiado,
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit_outlined, color: Color(0xFF1E3A8A)),
                      onPressed: onEditar,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}