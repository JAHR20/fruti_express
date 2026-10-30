import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/router/cart_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart'; // carrito -> cart
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_state.dart';

class CartFab extends StatelessWidget {
  const CartFab({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final itemCount = state.itemCount;

        return Badge(
          isLabelVisible: itemCount > 0,
          label: Text('$itemCount'),
          offset: const Offset(5, -5),
          child: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: colorTheme.secondary,
            foregroundColor: colorTheme.surface,
            onPressed: () {
              context.pushNamed(CartRoutes.name);
            },
            child: const Icon(Icons.shopping_cart, size: 28),
          ),
        );
      },
    );
  }
}
