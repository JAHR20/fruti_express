import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/entities/categoria.dart';
import 'package:fruti_express_jahr_admin/features/categorias/presentation/cubits/categoria_cubit.dart';
import 'package:fruti_express_jahr_admin/features/categorias/presentation/cubits/categoria_state.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/presentation/cubits/productos_cubit.dart';
import 'package:fruti_express_jahr_admin/features/productos/presentation/cubits/productos_state.dart';
import 'package:fruti_express_jahr_admin/features/productos/presentation/widgets/buscador_productos.dart';
import 'package:fruti_express_jahr_admin/features/productos/presentation/widgets/dialogo_formulario_producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/presentation/widgets/tarjeta_producto.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';

class AdminProductosPage extends StatelessWidget {
  const AdminProductosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthCubit>().state;

    if (authState is! AuthAuthenticated) {
      return const SizedBox.shrink();
    }

    final usuarioActual = authState.perfil;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,

      body: Column(
        children: [
          const BuscadorProductos(),

          Expanded(
            child: BlocConsumer<ProductosCubit, ProductosState>(
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
                }

                if (state.operacionExitosa) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Operación realizada correctamente.'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },

              builder: (context, state) {
                if (state.isLoading && state.productos.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
                  );
                }

                if (state.errorMessage != null && state.productos.isEmpty) {
                  return Center(
                    child: Text(
                      state.errorMessage!,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  );
                }

                if (state.productos.isEmpty) {
                  return const Center(
                    child: Text(
                      'El catálogo está vacío.\n'
                      '¡Agrega tu primer producto!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: state.productos.length,
                  itemBuilder: (context, index) {
                    final producto = state.productos[index];

                    return TarjetaProducto(
                      producto: producto,

                      esAdminOEncargado: usuarioActual.puedeGestionarCatalogo,

                      estaActualizando:
                          state.productoProcesandoId == producto.id,

                      onEstadoCambiado: (nuevoEstado) {
                        context.read<ProductosCubit>().cambiarEstadoProducto(
                          usuarioActual: usuarioActual,
                          productoId: producto.id ?? '',
                          nuevoEstado: nuevoEstado,
                        );
                      },

                      onEditar: () {
                        final categoriaState = context
                            .read<CategoriaCubit>()
                            .state;

                        if (categoriaState.isLoading ||
                            categoriaState.errorMessage != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Cargando categorías...'),
                            ),
                          );
                          return;
                        }

                        _mostrarFormularioProducto(
                          context,
                          usuarioActual,
                          categoriaState.categorias,
                          producto: producto,
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
      floatingActionButton: usuarioActual.puedeGestionarCatalogo
          ? BlocBuilder<CategoriaCubit, CategoriaState>(
              builder: (context, categoriaState) {
                final categoriasListas =
                    !categoriaState.isLoading &&
                    categoriaState.errorMessage == null;

                if (!categoriasListas) {
                  return const SizedBox.shrink();
                }

                return FloatingActionButton(
                  backgroundColor: const Color(0xFF1E3A8A),
                  onPressed: () {
                    _mostrarFormularioProducto(
                      context,
                      usuarioActual,
                      categoriaState.categorias,
                    );
                  },
                  child: const Icon(Icons.add, color: Colors.white),
                );
              },
            )
          : null,
    );
  }

  void _mostrarFormularioProducto(
    BuildContext context,
    Perfil usuarioActual,
    List<Categoria> categorias, {
    Producto? producto,
  }) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return BlocProvider.value(
          value: context.read<ProductosCubit>(),

          child: BlocConsumer<ProductosCubit, ProductosState>(
            listenWhen: (previous, current) =>
                previous.operacionError != current.operacionError ||
                previous.operacionExitosa != current.operacionExitosa,

            listener: (ctx, state) {
              if (state.operacionError != null) {
                ScaffoldMessenger.of(ctx).showSnackBar(
                  SnackBar(
                    content: Text(state.operacionError!),
                    backgroundColor: Colors.red,
                  ),
                );
              }

              if (state.operacionExitosa) {
                Navigator.pop(ctx);
              }
            },

            builder: (ctx, state) {
              return DialogoFormularioProducto(
                categoriasDisponibles: categorias,

                productoAEditar: producto,

                guardando: state.isLoading,

                onGuardar:
                    (nombre, desc, catId, precio, precioComp, unidad, img) {
                      if (producto == null) {
                        ctx.read<ProductosCubit>().crearProducto(
                          usuarioActual: usuarioActual,
                          nombre: nombre,
                          descripcion: desc,
                          categoriaId: catId,
                          precioActual: precio,
                          precioComparacion: precioComp,
                          unidadMedida: unidad,
                          imagenArchivo: img,
                        );
                      } else {
                        ctx.read<ProductosCubit>().actualizarProducto(
                          usuarioActual: usuarioActual,
                          productoId: producto.id ?? '',
                          nombre: nombre,
                          descripcion: desc,
                          categoriaId: catId,
                          precioActual: precio,
                          precioComparacion: precioComp,
                          unidadMedida: unidad,
                          imagenArchivo: img,
                          imagenUrl: producto.imagenUrl,
                          isActive: producto.isActive,
                        );
                      }
                    },
              );
            },
          ),
        );
      },
    );
  }
}
