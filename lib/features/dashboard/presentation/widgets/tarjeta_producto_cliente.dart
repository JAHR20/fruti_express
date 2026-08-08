import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/formateador_unidades.dart';
import 'package:fruti_express_jahr_admin/core/utils/formato_moneda.dart';
import 'package:fruti_express_jahr_admin/features/carrito/domain/entities/carrito_item.dart';
import 'package:fruti_express_jahr_admin/features/carrito/presentation/cubits/carrito_cubit.dart';
import 'package:fruti_express_jahr_admin/features/carrito/presentation/cubits/carrito_state.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/widgets/SelectorCantidadDialog.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/enums/unidad_medida_producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/enums/unidad_medida_ui.dart';

class TarjetaProductoCliente extends StatelessWidget {
  final Producto producto;

  const TarjetaProductoCliente({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    final bool estaAgotado = producto.stock <= 0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // IMAGEN DEL PRODUCTO
                Expanded(
                  child: SizedBox(
                    width:
                        double.infinity, // Que ocupe todo el ancho disponible
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      child: Image.network(
                        producto.imagenUrl!,
                        fit: BoxFit
                            .cover, // 🌟 Corta los bordes feos y llena el espacio
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // 🛡️ Envolvemos todo en este Padding para que NADA se meta debajo del botón
                // Reemplaza la parte del texto en tu tarjeta por esto:
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    12,
                    12,
                    12,
                    16,
                  ), // Más aire alrededor
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        producto.nombre,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      // Unidad de medida sola
                      Text(
                        producto.unidadMedida.nombreUI,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      // Stock solo
                      if (!estaAgotado)
                        Text(
                          'Disp: ${producto.unidadMedida.formatear(producto.stock)}',
                          style: TextStyle(
                            color: Colors.green.shade700,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      const SizedBox(height: 8), // 🌟 ESPACIO ANTES DEL PRECIO
                      Text(
                        producto.precioActual.formatoMoneda,
                        style: const TextStyle(
                          color: Color(0xFFEF4444),
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // LETRERO DE "AGOTADO"
          if (estaAgotado)
            Positioned(
              top: 12,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: const Text(
                  'AGOTADO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

          // 🛒 BOTÓN DE AGREGAR AL CARRITO
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: estaAgotado
                    ? Colors.grey.shade300
                    : const Color(0xFFF9A826),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: estaAgotado ? Colors.grey.shade500 : Colors.white,
                ),
                onPressed: estaAgotado
                    ? null
                    : () async {
                        int cantidadFinal = 1;

                        if (producto.unidadMedida == UnidadMedida.gramo) {
                          final gramosElegidos = await showDialog<int>(
                            context: context,
                            builder: (context) => SelectorCantidadDialog(
                              nombreProducto: producto.nombre,
                              precioKilo: producto.precioActual,
                            ),
                          );

                          if (gramosElegidos == null || gramosElegidos <= 0) {
                            return;
                          }
                          cantidadFinal = gramosElegidos;
                        }

                        // Extraemos las cosas del context antes de los 'awaits' largos
                        final carritoCubit = context.read<CarritoCubit>();
                        final stateCarrito = carritoCubit.state;
                        final sucursalActiva = stateCarrito.maybeMap(
                          loaded: (s) => s.sucursalId ?? '',
                          orElse: () => '',
                        );

                        final nuevoItem = CarritoItem(
                          productoId: producto.id!,
                          nombre: producto.nombre,
                          imagenUrl: producto.imagenUrl ?? '',
                          precioUnitario: producto.precioActual,
                          cantidad: cantidadFinal,
                          unidadMedida: producto.unidadMedida,
                          sucursalId: sucursalActiva,
                        );

                        // 🌟 CORRECCIÓN MAESTRA: Esperamos la respuesta de la validación
                        final error = await carritoCubit.agregarProducto(
                          nuevoItem,
                        );

                        if (context.mounted) {
                          if (error != null) {
                            // 🔴 NO HAY STOCK: Mostramos el error
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(error),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else {
                            // 🟢 SÍ HAY STOCK: Mostramos éxito
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  producto.unidadMedida == UnidadMedida.gramo
                                      ? '${cantidadFinal}g de ${producto.nombre} agregados'
                                      : '${producto.nombre} agregado al carrito',
                                ),
                                duration: const Duration(seconds: 1),
                                backgroundColor: const Color(0xFF4DB6AC),
                              ),
                            );
                          }
                        }
                      },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
