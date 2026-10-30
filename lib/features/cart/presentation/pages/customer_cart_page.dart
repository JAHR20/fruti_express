import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/widgets/animated_empty_state.dart';
import 'package:fruti_express_jahr_admin/core/widgets/confirm_dialog.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_state.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/widgets/cart_checkout_bar.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/widgets/cart_item_tile.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/cubits/customer_products_cubit.dart';

class CustomerCartPage extends StatelessWidget {
  const CustomerCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productsState = context.watch<CustomerProductsCubit>().state;
    final availableProducts = productsState.products;
    final isLoadingProducts = productsState.isLoading;

    final colorTheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mi Carrito',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_sweep, color: colorTheme.error,),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => ConfirmDialog(
                  title: 'Vaciar carrito',
                  message:
                      '¿Estás seguro de que deseas eliminar todos los productos del carrito?',
                  confirmText: 'Vaciar',
                  confirmColor: colorTheme.error, 
                  onConfirm: () {
                    context.read<CartCubit>().clearCart();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.isLoading && state.items.isEmpty) {
            return Center(
              child: CircularProgressIndicator(color:  colorTheme.secondaryContainer),
            );
          }

          if (state.errorMessage != null && state.items.isEmpty) {
            return Center(
              child: Text(
                state.errorMessage!,
                style: TextStyle(color: colorTheme.error),
              ),
            );
          }

          if (state.items.isEmpty) {
            return const AnimatedEmptyState(
              icon: Icon(Icons.shopping_cart_outlined),
              title: 'Carrito vacío',
              subtitle:
                  'Agrega productos al carrito para que aparezcan aquí.',
            );
          }

          final items = state.items;
          bool hasUnavailableProducts = false;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                child: Text(
                  '${items.length} items',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: colorTheme.primaryContainer,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];

                    final productMatches = availableProducts.where(
                      (p) => p.id == item.productId,
                    );
                    final product = productMatches.isNotEmpty
                        ? productMatches.first
                        : null;
                    final isAvailable = isLoadingProducts || product != null;

                    if (!isAvailable) {
                      hasUnavailableProducts = true;
                    }

                    return CartItemTile(
                      item: item,
                      product: product,
                      isAvailable: isAvailable,
                      isProcessing: state.processingProductId == item.productId,
                    );
                  },
                ),
              ),

              CartCheckoutBar(
                total: state.total,
                hasUnavailableProducts: hasUnavailableProducts,
              ),
            ],
          );
        },
      ),
    );
  }
}
