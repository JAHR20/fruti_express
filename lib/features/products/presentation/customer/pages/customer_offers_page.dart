// lib/features/products/presentation/customer/pages/customer_offers_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruti_express_jahr_admin/core/widgets/animated_empty_state.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/cubits/customer_products_cubit.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/cubits/customer_products_state.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/widgets/product_card.dart';

/// Productos en oferta de la sucursal activa. Si se abrió desde un banner con
/// categoría, muestra las ofertas de esa categoría y sus subcategorías; la
/// categoría actual vive en el cubit (`offersCategoryId`).
class CustomerOffersPage extends StatelessWidget {
  final String branchId;

  const CustomerOffersPage({super.key, required this.branchId});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    Future<void> handleRefresh() {
      final cubit = context.read<CustomerProductsCubit>();
      return cubit.loadOffers(
        branchId,
        categoryId: cubit.state.offersCategoryId,
      );
    }

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        title: Text(
          'Ofertas',
          style: TextStyle(
            color: colors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<CustomerProductsCubit, CustomerProductsState>(
        builder: (context, state) {
          // 1. CARGA INICIAL
          if (state.isLoading && state.products.isEmpty) {
            return Center(
              child: CircularProgressIndicator(color: colors.primary),
            );
          }

          // 2. ERROR
          if (state.errorMessage != null && state.products.isEmpty) {
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
                        style: TextStyle(color: colors.error, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          final hasCategoryFilter =
              state.offersCategoryId != null && !state.offersCategoryUnavailable;

          return RefreshIndicator(
            color: colors.primary,
            onRefresh: handleRefresh,
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                // La categoría del banner ya no existe: se muestran todas las ofertas.
                if (state.offersCategoryUnavailable)
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: colors.secondaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Esa categoría ya no está disponible. '
                        'Te mostramos todas las ofertas.',
                        style: TextStyle(color: colors.onSecondaryContainer),
                      ),
                    ),
                  ),

                // 3. SIN OFERTAS
                if (state.products.isEmpty) ...[
                  if (hasCategoryFilter)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Center(
                          child: TextButton.icon(
                            onPressed: () => context
                                .read<CustomerProductsCubit>()
                                .loadOffers(branchId),
                            icon: const Icon(Icons.local_offer_outlined),
                            label: const Text('Ver todas las ofertas'),
                          ),
                        ),
                      ),
                    ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: AnimatedEmptyState(
                      icon: const FaIcon(FontAwesomeIcons.tags),
                      title: 'Sin ofertas por ahora',
                      subtitle: hasCategoryFilter
                          ? 'Aún no hay productos en oferta\nen esta categoría'
                          : 'Vuelve pronto: aquí verás\nlos productos en oferta',
                    ),
                  ),
                ]
                // 4. GRID
                else
                  SliverPadding(
                    padding: const EdgeInsets.all(16.0),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.70,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return ProductCard(
                            product: state.products[index],
                            branchId: branchId,
                            categoryName: 'Ofertas',
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