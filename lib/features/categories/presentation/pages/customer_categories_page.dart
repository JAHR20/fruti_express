import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/widgets/animated_empty_state.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart'; // CarritoCubit -> CartCubit
import 'package:fruti_express_jahr_admin/features/categories/presentation/cubits/category_cubit.dart'; // CategoriaCubit -> CategoryCubit
import 'package:fruti_express_jahr_admin/features/categories/presentation/cubits/category_state.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/widgets/adaptive_categories.dart'; // CategoriasAdaptativas -> AdaptiveCategories
import 'package:fruti_express_jahr_admin/features/products/presentation/router/product_category_routes.dart';
import 'package:go_router/go_router.dart';

class CustomerCategoriesPage extends StatelessWidget {
  const CustomerCategoriesPage({super.key});

  Future<void> _refresh(BuildContext context) async {
    final authState = context.read<AuthCubit>().state;

    final currentProfile = authState.maybeMap(
      authenticated: (state) => state.user,
      orElse: () => null,
    );

    if (currentProfile != null) {
      await context.read<CategoryCubit>().loadCategories(currentProfile);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categorías',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          // 1. CARGA INICIAL (Solo si no hay datos previos)
          if (state.isLoading && state.categories.isEmpty) {
            return Center(
              child: CircularProgressIndicator(color: colorTheme.secondary),
            );
          }

          // Variable para guardar el widget que se va a mostrar
          Widget content;

          // 2. ESTADO DE ERROR GLOBAL
          if (state.errorMessage != null && state.categories.isEmpty) {
            content = CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Text(
                      state.errorMessage!,
                      style: TextStyle(color: colorTheme.error, fontSize: 16),
                    ),
                  ),
                ),
              ],
            );
          }
          // 3. ESTADO VACÍO
          else if (state.categories.isEmpty) {
            content = const CustomScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: AnimatedEmptyState(
                    icon: Icon(Icons.category_outlined),
                    title: 'No hay categorías',
                    subtitle:
                        'Aún no hay categorías disponibles en el sistema.',
                  ),
                ),
              ],
            );
          }
          // 4. ESTADO CON DATOS
          else {
            content = AdaptiveCategories(
              categories: state.categories,
              onTap: (category) {
                final cartState = context.read<CartCubit>().state;
                final activeBranch = cartState.branchId;

                if (activeBranch != null) {
                  context.pushNamed(
                    ProductCategoryRoutes.name,
                    extra: {'category': category, 'branchId': activeBranch},
                  );
                }
              },
            );
          }

          // Envolvemos el contenido final en el RefreshIndicator
          return RefreshIndicator(
            color: colorTheme.secondary,
            backgroundColor: colorTheme.surface,
            onRefresh: () => _refresh(context),
            child: content,
          );
        },
      ),
    );
  }
}
