import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/widgets/tarjeta_producto_cliente.dart';
import 'package:fruti_express_jahr_admin/features/productos/presentation/cubits/productos_cubit.dart';
import 'package:fruti_express_jahr_admin/features/productos/presentation/cubits/productos_state.dart';


class CuadriculaProductos extends StatelessWidget {
  const CuadriculaProductos({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            'Productos Destacados',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        BlocBuilder<ProductosCubit, ProductosState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: Padding(padding: EdgeInsets.all(32.0), child: CircularProgressIndicator())),
              loading: () => const Center(child: Padding(padding: EdgeInsets.all(32.0), child: CircularProgressIndicator())),
              error: (message) => Center(child: Padding(padding: const EdgeInsets.all(32.0), child: Text(message, style: const TextStyle(color: Colors.red)))),
              loaded: (productos, _, __) {
                if (productos.isEmpty) {
                  return const Center(child: Padding(padding: EdgeInsets.all(32.0), child: Text('No hay productos disponibles')));
                }

                return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  shrinkWrap: true, // 🌟 Necesario aquí porque está en el Inicio
                  physics: const NeverScrollableScrollPhysics(), // 🌟 Necesario aquí
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.70,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: productos.length,
                  itemBuilder: (context, index) {
                    final producto = productos[index];
                    // 🌟 MAGIA: Llamamos a tu widget reutilizable
                    return TarjetaProductoCliente(producto: producto);
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }
}