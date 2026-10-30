import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/cubits/category_cubit.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/cubits/customer_products_cubit.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/cubits/customer_products_state.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/widgets/product_card.dart'; // TarjetaProductoCliente -> CustomerProductCard

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

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
        BlocBuilder<CustomerProductsCubit, CustomerProductsState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (state.errorMessage != null) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    state.errorMessage!,
                    style: TextStyle(color: Theme.of(context).colorScheme.error),
                  ),
                ),
              );
            }

            if (state.products.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Text('No hay productos disponibles'),
                ),
              );
            }

            return GridView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.70,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                final categoriesState = context.read<CategoryCubit>().state;

                final matchedCategory = categoriesState.categories
                    .where((cat) => cat.id == product.categoryId)
                    .firstOrNull;

                final resolvedCategoryName =
                    matchedCategory?.name ?? 'Frutas y Verduras';

                return ProductCard(
                  product: product,
                  branchId: state.branchId,
                  categoryName: resolvedCategoryName,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
