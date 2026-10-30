import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/widgets/animated_empty_state.dart';
import 'package:fruti_express_jahr_admin/core/widgets/app_search_bar.dart';
import 'package:fruti_express_jahr_admin/core/widgets/pill_tab_bar.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/cubits/category_cubit.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/cubits/category_state.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/admin/cubits/admin_products_cubit.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/admin/cubits/admin_products_state.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/admin/widgets/product_form_bottom_sheet.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/admin/widgets/product_card.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';

class AdminProductsPage extends StatefulWidget {
  const AdminProductsPage({super.key});

  @override
  State<AdminProductsPage> createState() => _AdminProductsPageState();
}

class _AdminProductsPageState extends State<AdminProductsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _bottomSheetController;

  String? _selectedCategoryId;

  @override
  void initState() {
    super.initState();
    _bottomSheetController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    _bottomSheetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final authState = context.read<AuthCubit>().state;

    if (authState is! AuthAuthenticated) {
      return const SizedBox.shrink();
    }

    final currentUser = authState.user;

    // Helper seguro para refrescar datos (evita el warning de BuildContext tras await)
    Future<void> handleRefresh() async {
      final productsCubit = context.read<AdminProductsCubit>();
      await productsCubit.loadAllProducts();
    }

    return Scaffold(
      backgroundColor: colors.surface,
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, categoryState) {
          final categories = categoryState.categories;
          final int tabsLength = categories.length + 1;

          return DefaultTabController(
            length: tabsLength,
            child: Column(
              children: [
                if (categories.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 4.0),
                    child: PillTabBar(
                      tabs: [
                        const Tab(text: 'Todos'),
                        ...categories.map((c) => Tab(text: c.name)),
                      ],
                      onTap: (index) {
                        setState(() {
                          if (index == 0) {
                            _selectedCategoryId = null;
                          } else {
                            _selectedCategoryId = categories[index - 1].id;
                          }
                        });
                      },
                    ),
                  ),

                AppSearchBar(
                  hintText: 'Buscar producto por nombre...',
                  onChanged: (query) {
                    if (query.trim().isNotEmpty) {
                      context.read<AdminProductsCubit>().filterProductsByName(
                        query,
                      );
                    } else {
                      context.read<AdminProductsCubit>().loadAllProducts();
                    }
                  },
                ),

                Expanded(
                  child: BlocConsumer<AdminProductsCubit, AdminProductsState>(
                    listenWhen: (previous, current) =>
                        previous.errorMessage != current.errorMessage ||
                        previous.operationError != current.operationError ||
                        previous.operationSuccessful !=
                            current.operationSuccessful,
                    listener: (context, state) {
                      if (state.errorMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              state.errorMessage!,
                              style: TextStyle(color: colors.onError),
                            ),
                            backgroundColor: colors.error,
                          ),
                        );
                      }
                      if (state.operationError != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              state.operationError!,
                              style: TextStyle(color: colors.onError),
                            ),
                            backgroundColor: colors.error,
                          ),
                        );
                      }
                      if (state.operationSuccessful) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Operación realizada correctamente.',
                              style: TextStyle(color: colors.onPrimary),
                            ),
                            backgroundColor: colors.primary,
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      // 1. CARGA INICIAL
                      if (state.isLoading && state.products.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      // 2. ERROR GLOBAL (Ahora scrolleable)
                      if (state.errorMessage != null &&
                          state.products.isEmpty) {
                        return RefreshIndicator(
                          color: colors.primary,
                          onRefresh: handleRefresh,
                          child: CustomScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            slivers: [
                              SliverFillRemaining(
                                hasScrollBody: false,
                                child: Center(
                                  child: Text(
                                    state.errorMessage!,
                                    style: TextStyle(
                                      color: colors.error,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      final filteredProducts = _selectedCategoryId == null
                          ? state.products
                          : state.products
                                .where(
                                  (p) => p.categoryId == _selectedCategoryId,
                                )
                                .toList();

                      // 3. CATÁLOGO VACÍO (Ahora scrolleable con RefreshIndicator)
                      if (state.products.isEmpty) {
                        return RefreshIndicator(
                          color: colors.primary,
                          onRefresh: handleRefresh,
                          child: const CustomScrollView(
                            physics: AlwaysScrollableScrollPhysics(),
                            slivers: [
                              SliverFillRemaining(
                                hasScrollBody: false,
                                child: AnimatedEmptyState(
                                  icon: Icon(
                                    Icons.production_quantity_limits_rounded,
                                  ),
                                  title: 'Catalogo vacío',
                                  subtitle:
                                      'Agrega tu primer producto para que los clientes puedan verlos',
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      // 4. SIN RESULTADOS POR FILTRO (Ahora scrolleable)
                      if (filteredProducts.isEmpty) {
                        return RefreshIndicator(
                          color: colors.primary,
                          onRefresh: handleRefresh,
                          child: const CustomScrollView(
                            physics: AlwaysScrollableScrollPhysics(),
                            slivers: [
                              SliverFillRemaining(
                                hasScrollBody: false,
                                child: AnimatedEmptyState(
                                  icon: Icon(Icons.filter_list_off),
                                  title: 'Sin resultados',
                                  subtitle:
                                      'No hay productos que coincidan\ncon este filtro.',
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      // 5. LISTA CON DATOS
                      return RefreshIndicator(
                        color: colors.primary,
                        onRefresh: handleRefresh,
                        child: CustomScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          slivers: [
                            SliverPadding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              sliver: SliverList.builder(
                                itemCount: filteredProducts.length,
                                itemBuilder: (context, index) {
                                  final product = filteredProducts[index];

                                  return ProductCard(
                                    product: product,
                                    isAdminOrManager:
                                        currentUser.canManageCatalog,
                                    isUpdating:
                                        state.processingProductId == product.id,
                                    onStatusChanged: (newState) {
                                      context
                                          .read<AdminProductsCubit>()
                                          .changeProductStatus(
                                            currentUser: currentUser,
                                            productId: product.id ?? '',
                                            newState: newState,
                                          );
                                    },
                                    onEdit: () {
                                      if (categoryState.isLoading ||
                                          categoryState.errorMessage != null) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Cargando categorías...',
                                            ),
                                          ),
                                        );
                                        return;
                                      }
                                      _showProductForm(
                                        context,
                                        currentUser,
                                        categories,
                                        product: product,
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: currentUser.canManageCatalog
          ? BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, categoryState) {
                final categoriesReady =
                    !categoryState.isLoading &&
                    categoryState.errorMessage == null;

                if (!categoriesReady) return const SizedBox.shrink();

                return FloatingActionButton.extended(
                  backgroundColor: colors.primary,
                  foregroundColor: colors.onPrimary,
                  icon: const Icon(Icons.add),
                  label: const Text('Añadir Producto'),
                  onPressed: () {
                    _showProductForm(
                      context,
                      currentUser,
                      categoryState.categories,
                    );
                  },
                );
              },
            )
          : null,
    );
  }

  void _showProductForm(
    BuildContext context,
    AppUser currentUser,
    List<Category> categories, {
    Product? product,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      transitionAnimationController: _bottomSheetController,
      backgroundColor: Colors.transparent,
      builder: (dialogContext) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(dialogContext).viewInsets.bottom,
          ),
          child: BlocProvider.value(
            value: context.read<AdminProductsCubit>(),
            child: BlocConsumer<AdminProductsCubit, AdminProductsState>(
              listenWhen: (previous, current) =>
                  previous.operationError != current.operationError ||
                  previous.operationSuccessful != current.operationSuccessful,
              listener: (ctx, state) {
                if (state.operationError != null) {
                  final localColors = Theme.of(ctx).colorScheme;
                  ScaffoldMessenger.of(ctx).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.operationError!,
                        style: TextStyle(color: localColors.onError),
                      ),
                      backgroundColor: localColors.error,
                    ),
                  );
                }
                if (state.operationSuccessful) {
                  Navigator.pop(ctx);
                }
              },
              builder: (ctx, state) {
                return ProductFormBottomSheet(
                  availableCategories: categories,
                  productToEdit: product,
                  isSaving: state.isLoading,
                  onSave:
                      (
                        name,
                        description,
                        categoryId,
                        currentPrice,
                        comparisonPrice,
                        measurementUnit,
                        imageFile,
                      ) {
                        if (product == null) {
                          ctx.read<AdminProductsCubit>().createProduct(
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
                          ctx.read<AdminProductsCubit>().updateProduct(
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
          ),
        );
      },
    );
  }
}
