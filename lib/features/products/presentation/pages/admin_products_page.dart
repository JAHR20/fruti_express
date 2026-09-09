import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/cubits/category_cubit.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/cubits/category_state.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/cubits/product_cubit.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/cubits/product_state.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/widgets/product_search_bar.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/widgets/product_form_dialog.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/widgets/product_card.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';

class AdminProductsPage extends StatelessWidget {
  const AdminProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthCubit>().state;

    if (authState is! AuthAuthenticated) {
      return const SizedBox.shrink();
    }

    final currentUser = authState.profile; 

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          const ProductSearchBar(),

          Expanded(
            child: BlocConsumer<ProductCubit, ProductState>(
              listenWhen: (previous, current) =>
                  previous.errorMessage != current.errorMessage ||
                  previous.operationError != current.operationError ||
                  previous.operationSuccessful != current.operationSuccessful,

              listener: (context, state) {
                if (state.errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage!),
                      backgroundColor: Colors.red,
                    ),
                  );
                }

                if (state.operationError != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.operationError!),
                      backgroundColor: Colors.red,
                    ),
                  );
                }

                if (state.operationSuccessful) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Operación realizada correctamente.'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },

              builder: (context, state) {
                if (state.isLoading && state.products.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
                  );
                }

                if (state.errorMessage != null && state.products.isEmpty) {
                  return Center(
                    child: Text(
                      state.errorMessage!,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  );
                }

                if (state.products.isEmpty) {
                  return const Center(
                    child: Text(
                      'El catálogo está vacío.\n'
                      '¡Agrega tu primer producto!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];

                    return ProductCard(
                      product: product,
                      isAdminOrManager: currentUser.canManageCatalog, 
                      isUpdating: state.processingProductId == product.id, 

                      onStatusChanged: (newState) {
                        context.read<ProductCubit>().changeProductStatus(
                          currentUser: currentUser,
                          productId: product.id ?? '',
                          newState: newState,
                        );
                      },

                      onEdit: () {
                        final categoryState = context
                            .read<CategoryCubit>()
                            .state;

                        if (categoryState.isLoading ||
                            categoryState.errorMessage != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Cargando categorías...'),
                            ),
                          );
                          return;
                        }

                        _showProductForm(
                          context,
                          currentUser,
                          categoryState.categories,
                          product: product,
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
      floatingActionButton: currentUser.canManageCatalog
          ? BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, categoryState) {
                final categoriesReady =
                    !categoryState.isLoading &&
                    categoryState.errorMessage == null;

                if (!categoriesReady) {
                  return const SizedBox.shrink();
                }

                return FloatingActionButton(
                  backgroundColor: const Color(0xFF1E3A8A),
                  onPressed: () {
                    _showProductForm(
                      context,
                      currentUser,
                      categoryState.categories,
                    );
                  },
                  child: const Icon(Icons.add, color: Colors.white),
                );
              },
            )
          : null,
    );
  }

  void _showProductForm(
    BuildContext context,
    Profile currentUser,
    List<Category> categories, {
    Product? product,
  }) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return BlocProvider.value(
          value: context.read<ProductCubit>(),

          child: BlocConsumer<ProductCubit, ProductState>(
            listenWhen: (previous, current) =>
                previous.operationError != current.operationError ||
                previous.operationSuccessful != current.operationSuccessful,

            listener: (ctx, state) {
              if (state.operationError != null) {
                ScaffoldMessenger.of(ctx).showSnackBar(
                  SnackBar(
                    content: Text(state.operationError!),
                    backgroundColor: Colors.red,
                  ),
                );
              }

              if (state.operationSuccessful) {
                Navigator.pop(ctx);
              }
            },

            builder: (ctx, state) {
              return ProductFormDialog(
                availableCategories: categories,
                productToEdit: product,
                isSaving: state.isLoading,
                onSave: (name, description, categoryId, currentPrice, comparisonPrice, measurementUnit, imageFile) {
                  if (product == null) {
                    ctx.read<ProductCubit>().createProduct(
                      currentUser: currentUser,
                      name: name,
                      description: description,
                      categoryId: categoryId,
                      currentPrice: currentPrice,
                      comparisonPrice: comparisonPrice,
                      measurementUnit: measurementUnit,
                      imageFile: imageFile,
                    );
                  } else {
                    ctx.read<ProductCubit>().updateProduct(
                      currentUser: currentUser,
                      productId: product.id ?? '',
                      name: name,
                      description: description,
                      categoryId: categoryId,
                      currentPrice: currentPrice,
                      comparisonPrice: comparisonPrice,
                      measurementUnit: measurementUnit,
                      imageFile: imageFile,
                      imageUrl: product.imageUrl,
                      isActive: product.isActive,
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