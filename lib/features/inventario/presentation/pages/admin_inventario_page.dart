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
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/sucursal_cubit.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/sucursal_state.dart';

class AdminInventarioPage extends StatefulWidget {
  const AdminInventarioPage({super.key});

  @override
  State<AdminInventarioPage> createState() => _AdminInventarioPageState();
}

class _AdminInventarioPageState extends State<AdminInventarioPage> {
  String? _sucursalSeleccionadaId;

  void _mostrarDialogoAjuste(
    BuildContext context,
    String productoId,
    String sucursalId,
    bool esAumento,
    UnidadMedida unidad,
    int stockActual,
  ) {
    final authState = context.read<AuthCubit>().state;

    if (authState is! AuthAuthenticated) return;

    final usuarioActual = authState.perfil;
    final inventarioCubit = context.read<InventarioCubit>();

    showDialog(
      context: context,
      builder: (_) => DialogoAjusteStock(
        esAumento: esAumento,
        unidadMedida: unidad,
        stockActual: stockActual,
        onConfirmar: (cantidad) {
          inventarioCubit.ajustarStockManual(
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
    final authState = context.watch<AuthCubit>().state;

    if (authState is! AuthAuthenticated) {
      return const Scaffold(
        body: Center(child: Text('No hay una sesión activa.')),
      );
    }

    final usuarioActual = authState.perfil;

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
          if (esAdminGlobal)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              margin: const EdgeInsets.only(bottom: 8),
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
                  if (state.isLoading && state.sucursales.isEmpty) {
                    return const LinearProgressIndicator();
                  }

                  final sucursales = state.sucursales;

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
                      return DropdownMenuItem<String>(
                        value: sucursal.id,
                        child: Text(sucursal.nombre),
                      );
                    }).toList(),

                    onChanged: (nuevoId) {
                      if (nuevoId == null) return;

                      setState(() {
                        _sucursalSeleccionadaId = nuevoId;
                      });

                      context.read<InventarioCubit>().cargarInventario(nuevoId);
                    },
                  );
                },
              ),
            ),

          Expanded(
            child: BlocConsumer<InventarioCubit, InventarioState>(
              listenWhen: (previous, current) =>
                  previous.errorMessage != current.errorMessage ||
                  previous.operacionError != current.operacionError ||
                  previous.operacionExitosa != current.operacionExitosa,

              listener: (context, state) {
                if (state.errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage!),
                      backgroundColor: Colors.red,
                    ),
                  );
                }

                if (state.operacionError != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.operacionError!),
                      backgroundColor: Colors.red,
                    ),
                  );

                  context.read<InventarioCubit>().limpiarErrorOperacion();
                }

                if (state.operacionExitosa) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Stock actualizado correctamente.'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },

              builder: (context, state) {
                if (state.isLoading && state.inventario.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
                  );
                }

                if (state.errorMessage != null && state.inventario.isEmpty) {
                  return Center(child: Text('Error: ${state.errorMessage}'));
                }

                if (state.sucursalId == null) {
                  return const Center(
                    child: Text(
                      'Selecciona una sucursal para consultar su inventario.',
                    ),
                  );
                }

                if (state.inventario.isEmpty) {
                  return const Center(
                    child: Text(
                      'Aún no hay registros de inventario en esta sucursal.',
                    ),
                  );
                }

                final productosState = context.watch<ProductosCubit>().state;

                final listaProductos = productosState.productos;

                return Stack(
                  children: [
                    ListView.builder(
                      padding: const EdgeInsets.only(top: 8, bottom: 80),
                      itemCount: state.inventario.length,
                      itemBuilder: (context, index) {
                        final item = state.inventario[index];

                        final indexProducto = listaProductos.indexWhere(
                          (producto) => producto.id == item.productoId,
                        );

                        if (indexProducto == -1) {
                          return const SizedBox.shrink();
                        }

                        final producto = listaProductos[indexProducto];

                        final estaActualizando =
                            state.productoProcesandoId == item.productoId;

                        return TarjetaInventario(
                          item: item,
                          producto: producto,
                          estaActualizando: estaActualizando,

                          onSumar: () {
                            _mostrarDialogoAjuste(
                              context,
                              item.productoId,
                              item.sucursalId,
                              true,
                              producto.unidadMedida,
                              item.stockDisponible,
                            );
                          },

                          onRestar: () {
                            _mostrarDialogoAjuste(
                              context,
                              item.productoId,
                              item.sucursalId,
                              false,
                              producto.unidadMedida,
                              item.stockDisponible,
                            );
                          },
                        );
                      },
                    ),

                    if (state.isLoading)
                      const Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: LinearProgressIndicator(),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
