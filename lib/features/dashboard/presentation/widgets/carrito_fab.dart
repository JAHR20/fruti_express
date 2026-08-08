import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/config/router/admin_router.dart';
import 'package:go_router/go_router.dart'; // 🌟 Importante para la navegación
import 'package:fruti_express_jahr_admin/features/carrito/presentation/cubits/carrito_cubit.dart';
import 'package:fruti_express_jahr_admin/features/carrito/presentation/cubits/carrito_state.dart';

class CarritoFab extends StatelessWidget {
  const CarritoFab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarritoCubit, CarritoState>(
      builder: (context, state) {
        
        // 🌟 Magia pura: Leemos la cantidad directamente del estado Freezed
        final cantidadArticulos = state.cantidadArticulos;

        return Badge(
          isLabelVisible: cantidadArticulos > 0,
          label: Text('$cantidadArticulos'),
          offset: const Offset(5, -5),
          child: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: const Color(0xFFF9A826),
            foregroundColor: Colors.white,
            onPressed: () {
              context.push(AppRouter.carrito);
            },
            child: const Icon(Icons.shopping_cart, size: 28),
          ),
        );
      },
    );
  }
}