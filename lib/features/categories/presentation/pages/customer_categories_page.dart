import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      authenticated: (state) => state.profile, 
      orElse: () => null,
    );

    if (currentProfile != null) {
      await context.read<CategoryCubit>().loadCategories(currentProfile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Categorías',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        elevation: 0,
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
            );
          }

          if (state.errorMessage != null) {
            return Center(
              child: Text(
                state.errorMessage!,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          }

          if (state.categories.isEmpty) { 
            return RefreshIndicator(
              color: const Color(0xFFF9A826),
              onRefresh: () => _refresh(context),
              child: ListView(
                children: const [
                  SizedBox(height: 100),
                  Center(
                    child: Text(
                      'No hay categorías disponibles por el momento.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            color: const Color(0xFFF9A826),
            backgroundColor: Colors.white,
            onRefresh: () => _refresh(context),
            child: AdaptiveCategories(
              categories: state.categories,
              onTap: (category) {
                final cartState = context.read<CartCubit>().state; 
                final activeBranch = cartState.branchId; 

                if (activeBranch != null) {
                  context.pushNamed(
                    ProductCategoryRoutes.name,
                    extra: {
                      'category': category, 
                      'branchId': activeBranch, 
                    },
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}