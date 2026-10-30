import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/router/product_routes.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/utils/measurement_unit_extension.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/core/utils/unit_formatter.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart';
import 'package:fruti_express_jahr_admin/features/cart/domain/entities/cart_item.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/widgets/quantity_selector_dialog.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final String branchId;
  final String? categoryName;

  const ProductCard({
    super.key,
    required this.product,
    required this.branchId,
    this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bool isOutOfStock = product.stock <= 0;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withValues(alpha: 0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                context.pushNamed(
                  ProductRoutes.detailsName,
                  extra: {
                    'product': product,
                    'branchId': branchId,
                    'categoryName': categoryName,
                  },
                );
              },
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            child: Image.network(
                              product.imageUrl ?? '',
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Icon(
                                Icons.broken_image,
                                color: colorScheme.outline,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: colorScheme.onSurface,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              product.measurementUnit.displayName,
                              style: TextStyle(
                                color: colorScheme.onSurfaceVariant,
                                fontSize: 12,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            if (!isOutOfStock)
                              Text(
                                'Disp: ${product.measurementUnit.format(product.stock)}',
                                style: TextStyle(
                                  // Mantenemos verde como color semántico universal para disponibilidad
                                  color: Colors.green.shade700,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            const SizedBox(height: 8),
                            Text(
                              CurrencyFormatter.format(
                                product.currentPrice.toInt(),
                              ),
                              style: TextStyle(
                                color: colorScheme.primary, // Unificado con el DetailBottomBar
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
      
                  if (isOutOfStock)
                    Positioned(
                      top: 12,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.error,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          'AGOTADO',
                          style: TextStyle(
                            color: colorScheme.onError,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: isOutOfStock
                            ? colorScheme.surfaceContainerHighest
                            : colorScheme.primary,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: isOutOfStock
                              ? colorScheme.onSurfaceVariant
                              : colorScheme.onPrimary,
                        ),
                        onPressed: isOutOfStock
                            ? null
                            : () async {
                                int finalQuantity = 1;
      
                                if (product.measurementUnit ==
                                    MeasurementUnit.gram) {
                                  final chosenGrams = await showDialog<int>(
                                    context: context,
                                    builder: (context) => QuantitySelectorDialog(
                                      productName: product.name,
                                      pricePerKilo: product.currentPrice,
                                    ),
                                  );
      
                                  if (chosenGrams == null || chosenGrams <= 0) {
                                    return;
                                  }
                                  finalQuantity = chosenGrams;
                                }
      
                                if (!context.mounted) return;
                                final cartCubit = context.read<CartCubit>();
                                final cartState = cartCubit.state;
                                final activeBranch =
                                    cartState.branchId!.isNotEmpty
                                    ? cartState.branchId
                                    : branchId;
      
                                if (activeBranch == null ||
                                    activeBranch.isEmpty) {
                                  return;
                                }
      
                                final newItem = CartItem(
                                  productId: product.id!,
                                  name: product.name,
                                  imageUrl: product.imageUrl ?? '',
                                  unitPrice: product.currentPrice,
                                  quantity: finalQuantity,
                                  measurementUnit: product.measurementUnit,
                                  branchId: activeBranch,
                                );
      
                                final error = await cartCubit.addItem(newItem);
      
                                if (context.mounted) {
                                  if (error != null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          error,
                                          style: TextStyle(color: colorScheme.onError),
                                        ),
                                        backgroundColor: colorScheme.error,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          product.measurementUnit ==
                                                  MeasurementUnit.gram
                                              ? '${finalQuantity}g de ${product.name} agregados'
                                              : '${product.name} agregado al carrito',
                                          style: const TextStyle(color: Colors.white),
                                        ),
                                        duration: const Duration(seconds: 1),
                                        // Verde semántico para éxito
                                        backgroundColor: Colors.green.shade700, 
                                      ),
                                    );
                                  }
                                }
                              },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}