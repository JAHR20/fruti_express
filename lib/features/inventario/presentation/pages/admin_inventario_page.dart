import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/inventario/presentation/cubits/inventario_cubit.dart';
import 'package:fruti_express_jahr_admin/features/inventario/presentation/cubits/inventario_state.dart';
import 'package:fruti_express_jahr_admin/features/inventario/presentation/widgets/dialogo_ajuste_stock.dart';
import 'package:fruti_express_jahr_admin/features/inventario/presentation/widgets/tarjeta_inventario.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/enums/unidad_medida_producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/presentation/cubits/productos_cubit.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/presentation/cubits/productos_state.dart';

// 🌟 Importa tu Cubit y State de Sucursales
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/sucursal_cubit.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/sucursal_state.dart';

class AdminInventarioPage extends StatefulWidget {
  const AdminInventarioPage({super.key});

  @override
  State<AdminInventarioPage> createState() => _AdminInventarioPageState();
}

class _AdminInventarioPageState extends State<AdminInventarioPage> {
  // 🌟 Variable para guardar qué sucursal seleccionó el Admin en el Dropdown
  String? _sucursalSeleccionadaId;

  void _mostrarDialogoAjuste(
    BuildContext context,
    String productoId,
    String sucursalId,
    bool esAumento,
    UnidadMedida unidad,
    int stockActual,
  ) {
    final usuarioActual =
        (context.read<AuthCubit>().state as AuthAuthenticated).perfil;
    final cubit = context.read<InventarioCubit>();

    showDialog(
      context: context,
      builder: (_) => DialogoAjusteStock(
        esAumento: esAumento,
        unidadMedida: unidad,
        stockActual: stockActual, // 🌟 NUEVO: Pasamos el stock actual
        onConfirmar: (cantidad) {
          cubit.ajustarStockManual(
            usuarioActual: usuarioActual,
            productoId: productoId,
            sucursalId: sucursalId,
            cantidad: cantidad,
            esAumento: esAumento,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final estadoProductos = context.watch<ProductosCubit>().state;
    final List<Producto> listaProductos = estadoProductos.maybeWhen(
      loaded: (productos, _, __) => productos,
      orElse: () => [],
    );

    final usuarioActual =
        (context.read<AuthCubit>().state as AuthAuthenticated).perfil;
    final esAdminGlobal =
        usuarioActual.sucursalId == null || usuarioActual.sucursalId!.isEmpty;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Control de Bodega',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          // 🌟 1. EL SELECTOR DE SUCURSALES (Solo visible para el Admin Global)
          if (esAdminGlobal)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              margin: const EdgeInsets.only(bottom: 8),
              // Sombra sutil para separarlo del resto de la lista
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: BlocBuilder<SucursalCubit, SucursalState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () =>
                        const Center(child: LinearProgressIndicator()),
                    loaded: (sucursales) {
                      if (sucursales.isEmpty) {
                        return const Text(
                          'No hay sucursales registradas.',
                          style: TextStyle(color: Colors.grey),
                        );
                      }
                      return DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Selecciona una sucursal',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        initialValue: _sucursalSeleccionadaId,
                        items: sucursales.map((sucursal) {
                          return DropdownMenuItem(
                            value: sucursal.id,
                            child: Text(sucursal.nombre),
                          );
                        }).toList(),
                        onChanged: (nuevoId) {
                          if (nuevoId != null) {
                            setState(() => _sucursalSeleccionadaId = nuevoId);
                            context.read<InventarioCubit>().cargarInventario(
                              nuevoId,
                            );
                          }
                        },
                      );
                    },
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),
            ),

          // 🌟 2. LA LISTA DEL INVENTARIO
          Expanded(
            child: BlocConsumer<InventarioCubit, InventarioState>(
              listener: (context, state) {
                state.maybeWhen(
                  error: (message) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                  orElse: () {},
                );
              },
              builder: (context, state) {
                // Usamos el when de freezed para ser exhaustivos
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => const Center(
                    child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
                  ),
                  error: (message) => Center(child: Text('Error: $message')),
                  loaded: (inventario, actualizandoId) {
                    // Ajusta estos parámetros según lo que tenga tu InventarioLoaded
                    if (inventario.isEmpty) {
                      return const Center(
                        child: Text('Aún no hay registros en esta sucursal.'),
                      );
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.only(top: 8, bottom: 80),
                      itemCount: inventario.length,
                      itemBuilder: (context, index) {
                        final item = inventario[index];
                        final indexProducto = listaProductos.indexWhere(
                          (p) => p.id == item.productoId,
                        );
                        if (indexProducto == -1) return const SizedBox.shrink();

                        final productoBase = listaProductos[indexProducto];

                        return TarjetaInventario(
                          item: item,
                          producto: productoBase,
                          estaActualizando: actualizandoId == item.productoId,
                          onSumar: () => _mostrarDialogoAjuste(
                            context,
                            item.productoId,
                            item.sucursalId,
                            true,
                            productoBase.unidadMedida,
                            item.stockDisponible, // 🌟 NUEVO: Pasamos el stock actual
                          ),
                          onRestar: () => _mostrarDialogoAjuste(
                            context,
                            item.productoId,
                            item.sucursalId,
                            false,
                            productoBase.unidadMedida,
                            item.stockDisponible, // 🌟 NUEVO: Pasamos el stock actual
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
