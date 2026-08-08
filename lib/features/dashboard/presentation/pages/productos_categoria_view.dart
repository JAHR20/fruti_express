import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/entities/categoria.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/widgets/tarjeta_producto_cliente.dart';
import 'package:fruti_express_jahr_admin/features/productos/presentation/cubits/productos_cubit.dart';
import 'package:fruti_express_jahr_admin/features/productos/presentation/cubits/productos_state.dart';


class ProductosCategoriaView extends StatelessWidget {
  final Categoria categoria;

  const ProductosCategoriaView({
    super.key,
    required this.categoria,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(categoria.nombre, style: const TextStyle(color: Colors.white)), // 🌟 Título dinámico
        backgroundColor: const Color(0xFF1E3A8A),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: BlocBuilder<ProductosCubit, ProductosState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator(color: Color(0xFF1E3A8A))),
            error: (message) => Center(child: Text(message, style: const TextStyle(color: Colors.red, fontSize: 16))),
            loaded: (productos, _, __) {
              if (productos.isEmpty) {
                return Center(
                  child: Text(
                    'Aún no hay productos en\n${categoria.nombre}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                  ),
                );
              }

              return GridView.builder(
                padding: const EdgeInsets.all(16.0),
                // 🌟 SIN shrinkWrap NI physics, aquí el Grid es libre de scrollear nativamente
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.70,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: productos.length,
                itemBuilder: (context, index) {
                  final producto = productos[index];
                  // 🌟 MAGIA X2: Reciclamos exactamente el mismo widget
                  return TarjetaProductoCliente(producto: producto);
                },
              );
            },
          );
        },
      ),
    );
  }
}