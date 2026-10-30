import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruti_express_jahr_admin/core/widgets/animated_empty_state.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/cubits/customer_products_cubit.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/cubits/customer_products_state.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/widgets/product_card.dart';

class CategoryProductsPage extends StatelessWidget {
  final Category category;
  final String branchId; // 👈 Recibimos la sucursal fija desde la navegación

  const CategoryProductsPage({
    super.key,
    required this.category,
    required this.branchId,
  });

  @override
  Widget build(BuildContext context) {
    final colorSchema = Theme.of(context).colorScheme;

    // 💡 Helper de refresco 100% seguro y directo
    Future<void> handleRefresh() async {
      await context
          .read<CustomerProductsCubit>()
          .loadProductsByCategory(category.id, branchId);
    }

    return Scaffold(
      backgroundColor: colorSchema.surface,
      appBar: AppBar(
        title: Text(
          category.name,
          style: TextStyle(
            color: colorSchema.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<CustomerProductsCubit, CustomerProductsState>(
        builder: (context, state) {
          // 1. CARGA INICIAL
          if (state.isLoading && state.products.isEmpty) {
            return Center(
              child: CircularProgressIndicator(color: colorSchema.primary),
            );
          }

          // 2. ERROR (Scrolleable y con branchId garantizado)
          if (state.errorMessage != null && state.products.isEmpty) {
            return RefreshIndicator(
              color: colorSchema.primary,
              onRefresh: handleRefresh,
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(
                        state.errorMessage!,
                        style: TextStyle(color: colorSchema.error, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          // 3. ESTADO VACÍO (Scrolleable y con branchId garantizado)
          if (state.products.isEmpty) {
            return RefreshIndicator(
              color: colorSchema.primary,
              onRefresh: handleRefresh,
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: AnimatedEmptyState(
                      icon: const FaIcon(FontAwesomeIcons.boxOpen),
                      title: 'Categoría vacía',
                      subtitle: 'Aún no hay productos disponibles en\n${category.name}',
                    ),
                  ),
                ],
              ),
            );
          }

          // 4. GRID CON PRODUCTOS Y REFRESH
          return RefreshIndicator(
            color: colorSchema.primary,
            onRefresh: handleRefresh,
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.70,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return ProductCard(
                          product: state.products[index],
                          branchId: branchId, // Usamos la variable local segura
                          categoryName: category.name,
                        );
                      },
                      childCount: state.products.length,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}