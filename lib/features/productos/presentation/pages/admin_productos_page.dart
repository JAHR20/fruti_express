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
    final authState = context.read<AuthCubit>().state as AuthAuthenticated;
    final usuarioActual = authState.perfil;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          const BuscadorProductos(),

          Expanded(
            child: BlocBuilder<ProductosCubit, ProductosState>(
              builder: (context, state) {
                // 🌟 Pattern Matching exhaustivo con 'when'
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => const Center(
                    child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
                  ),
                  error: (message) => Center(
                    child: Text(
                      message,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ),
                  loaded: (productos, productoDetalle, categoriaIdActual) {
                    if (productos.isEmpty) {
                      return const Center(
                        child: Text(
                          'El catálogo está vacío.\n¡Agrega tu primer producto!',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: productos.length,
                      itemBuilder: (context, index) {
                        final producto = productos[index];

                        return TarjetaProducto(
                          producto: producto,
                          esAdminOEncargado:
                              usuarioActual.puedeGestionarCatalogo,
                          onEstadoCambiado: (nuevoEstado) {
                            context
                                .read<ProductosCubit>()
                                .cambiarEstadoProducto(
                                  usuarioActual: usuarioActual,
                                  productoId: producto.id ?? '',
                                  nuevoEstado: nuevoEstado,
                                );
                          },
                          onEditar: () {
                            // 🌟 Usamos maybeWhen para obtener las categorías si están cargadas
                            final catState = context
                                .read<CategoriaCubit>()
                                .state;
                            catState.maybeWhen(
                              loaded: (categorias) =>
                                  _mostrarFormularioProducto(
                                    context,
                                    usuarioActual,
                                    categorias,
                                    producto: producto,
                                  ),
                              orElse: () =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Cargando categorías...'),
                                    ),
                                  ),
                            );
                          },
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
              builder: (context, catState) {
                // 🌟 Aquí también usamos maybeWhen
                return catState.maybeWhen(
                  loaded: (categorias) => FloatingActionButton(
                    backgroundColor: const Color(0xFF1E3A8A),
                    onPressed: () => _mostrarFormularioProducto(
                      context,
                      usuarioActual,
                      categorias,
                    ),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                  orElse: () => const SizedBox.shrink(),
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
            listener: (ctx, state) {
              state.maybeWhen(
                loaded: (_,_,_) => Navigator.pop(ctx),
                error: (msg) => ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(msg))),
                orElse: () {},
              );
            },
            builder: (ctx, state) {
              return DialogoFormularioProducto(
                categoriasDisponibles: categorias,
                productoAEditar: producto,
                guardando: state.maybeWhen(loading: () => true, orElse: () => false),
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
                          productoId: producto.id ?? "",
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
