import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/config/router/admin_router.dart';
import 'package:fruti_express_jahr_admin/core/utils/formato_moneda.dart';
import 'package:fruti_express_jahr_admin/features/carrito/presentation/cubits/carrito_cubit.dart';
import 'package:fruti_express_jahr_admin/features/carrito/presentation/cubits/carrito_state.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/widgets/SelectorCantidadDialog.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/enums/unidad_medida_producto.dart';

// 🌟 1. IMPORTAMOS EL CUBIT DE PRODUCTOS PARA CRUZAR LOS DATOS
import 'package:fruti_express_jahr_admin/features/productos/presentation/cubits/productos_cubit.dart';
import 'package:fruti_express_jahr_admin/features/productos/presentation/cubits/productos_state.dart';
import 'package:go_router/go_router.dart';

class CarritoClientePage extends StatelessWidget {
  const CarritoClientePage({super.key});

  String _formatearPeso(int gramos) {
    if (gramos >= 1000) {
      double kilos = gramos / 1000;
      String kilosStr = kilos
          .toStringAsFixed(3)
          .replaceAll(RegExp(r'0*$'), '')
          .replaceAll(RegExp(r'\.$'), '');
      return '$kilosStr Kg';
    }
    return '${gramos}g';
  }

  @override
  Widget build(BuildContext context) {
    // 🌟 2. ESCUCHAMOS EL CATÁLOGO DE LA SUCURSAL ACTUAL
    final productosState = context.watch<ProductosCubit>().state;
    
    // Obtenemos la lista de productos disponibles actualmente en memoria
    final productosDisponibles = productosState.maybeMap(
      loaded: (s) => s.productos,
      orElse: () => [], 
    );
    
    // Bandera para no asustar al usuario mostrando "agotado" mientras carga la nueva sucursal
    final cargandoProductos = productosState.maybeMap(
      loading: (_) => true,
      orElse: () => false,
    );

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Mi Carrito',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: () {
              context.read<CarritoCubit>().vaciarCarrito();
            },
          ),
        ],
      ),
      body: BlocBuilder<CarritoCubit, CarritoState>(
        builder: (context, state) {
          return state.maybeMap(
            loading: (_) => const Center(
              child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
            ),
            error: (err) => Center(
              child: Text(err.mensaje, style: const TextStyle(color: Colors.red)),
            ),
            loaded: (currentState) {
              final items = currentState.items;
              
              if (items.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey.shade300),
                      const SizedBox(height: 16),
                      const Text(
                        'Tu carrito está vacío',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
                      ),
                      const SizedBox(height: 8),
                      Text('¡Agrega algunas frutas o verduras frescas!', style: TextStyle(color: Colors.grey.shade600)),
                    ],
                  ),
                );
              }

              // 🌟 3. CALCULAMOS SI HAY ALGÚN PRODUCTO CON CONFLICTO
              bool hayProductosNoDisponibles = false;

              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: items.length,
                      separatorBuilder: (context, index) => const Divider(height: 32),
                      itemBuilder: (context, index) {
                        final item = items[index];
                        final esGramo = item.unidadMedida == UnidadMedida.gramo;

                        // 🌟 4. VALIDACIÓN INDIVIDUAL POR PRODUCTO
                        // Verificamos si este ID específico existe en la nueva sucursal
                        final estaDisponible = cargandoProductos || productosDisponibles.any((p) => p.id == item.productoId);
                        
                        if (!estaDisponible) {
                          hayProductosNoDisponibles = true; // Bloqueará el botón de pago
                        }

                        // 🌟 5. APLICAMOS OPACIDAD SI ESTÁ AGOTADO
                        return Opacity(
                          opacity: estaDisponible ? 1.0 : 0.4,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: !estaDisponible ? Colors.red.shade200 : Colors.grey.shade200),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: item.imagenUrl != null && item.imagenUrl!.isNotEmpty
                                      ? Image.network(item.imagenUrl!, fit: BoxFit.cover)
                                      : const Icon(Icons.image, color: Colors.grey),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.nombre,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        decoration: !estaDisponible ? TextDecoration.lineThrough : null, // Tachamos el texto si no hay
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      FormatoMoneda.formatear(item.subtotal),
                                      style: const TextStyle(color: Color(0xFFEF4444), fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 8),

                                    // 🌟 6. ALTERNAMOS ENTRE CONTROLES DE CANTIDAD O ETIQUETA DE ERROR
                                    if (estaDisponible)
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              final resta = esGramo ? 1000 : 1;
                                              context.read<CarritoCubit>().actualizarCantidad(item.productoId, item.cantidad - resta);
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(4),
                                              decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(4)),
                                              child: const Icon(Icons.remove, size: 20),
                                            ),
                                          ),
                                          InkWell(
                                            borderRadius: BorderRadius.circular(8),
                                            onTap: () async {
                                              if (esGramo) {
                                                final nuevosGramos = await showDialog<int>(
                                                  context: context,
                                                  builder: (context) => SelectorCantidadDialog(
                                                    nombreProducto: item.nombre,
                                                    precioKilo: item.precioUnitario,
                                                  ),
                                                );
                                                if (nuevosGramos != null && nuevosGramos > 0 && context.mounted) {
                                                  context.read<CarritoCubit>().actualizarCantidad(item.productoId, nuevosGramos);
                                                }
                                              }
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.symmetric(horizontal: 12.0),
                                              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(color: Colors.grey.shade300),
                                                borderRadius: BorderRadius.circular(8),
                                                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 2, offset: const Offset(0, 1))],
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    esGramo ? _formatearPeso(item.cantidad) : '${item.cantidad}',
                                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
                                                  ),
                                                  if (esGramo) ...[
                                                    const SizedBox(width: 4),
                                                    Icon(Icons.edit_outlined, size: 14, color: Colors.grey.shade500),
                                                  ],
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              final suma = esGramo ? 1000 : 1;
                                              context.read<CarritoCubit>().actualizarCantidad(item.productoId, item.cantidad + suma);
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(4),
                                              decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(4)),
                                              child: const Icon(Icons.add, size: 20),
                                            ),
                                          ),
                                        ],
                                      )
                                    else
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: Colors.red.shade50,
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: Text(
                                          'No disponible en esta sucursal',
                                          style: TextStyle(
                                            color: Colors.red.shade700,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              // El botón de basura siempre se queda para que puedan quitarlo
                              IconButton(
                                icon: const Icon(Icons.delete_outline, color: Colors.red),
                                onPressed: () {
                                  context.read<CarritoCubit>().eliminarProducto(item.productoId);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  // 💳 BARRA INFERIOR DE PAGO
                  Container(
                    padding: const EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -5)),
                      ],
                    ),
                    child: SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Total a pagar:', style: TextStyle(fontSize: 16, color: Colors.grey)),
                              Text(
                                FormatoMoneda.formatear(state.total),
                                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E3A8A)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          
                          // 🌟 7. AVISO SI HAY PRODUCTOS BLOQUEADOS
                          if (hayProductosNoDisponibles)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Row(
                                children: [
                                  Icon(Icons.warning_amber_rounded, size: 20, color: Colors.orange.shade700),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      'Elimina los productos no disponibles para continuar.',
                                      style: TextStyle(color: Colors.orange.shade700, fontSize: 13, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFF9A826),
                                disabledBackgroundColor: Colors.grey.shade300,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              // 🌟 8. BLOQUEAMOS EL BOTÓN SI HAY CONFLICTOS
                              onPressed: hayProductosNoDisponibles 
                                ? null 
                                : () => context.push(AppRouter.checkoutCliente),
                              child: Text(
                                'Realizar Pedido',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: hayProductosNoDisponibles ? Colors.grey.shade500 : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}