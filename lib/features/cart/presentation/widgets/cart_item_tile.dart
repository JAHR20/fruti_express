import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart';
import 'package:fruti_express_jahr_admin/core/utils/unit_formatter.dart';
import 'package:fruti_express_jahr_admin/features/cart/domain/entities/cart_item.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/widgets/quantity_selector_dialog.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;
  final Product? product;
  final bool isAvailable;
  final bool isProcessing;

  const CartItemTile({
    super.key,
    required this.item,
    required this.product,
    required this.isAvailable,
    required this.isProcessing,
  });

  String _formatWeight(int grams) {
    if (grams >= 1000) {
      double kilos = grams / 1000;
      String kilosStr = kilos.toStringAsFixed(3).replaceAll(RegExp(r'0*$'), '').replaceAll(RegExp(r'\.$'), '');
      return '$kilosStr Kg';
    }
    return '${grams}g';
  }

  void _updateQuantityIfStockAllows(BuildContext context, int newQuantity) {
    if (product == null) return;
    if (newQuantity > product!.stock) {
      final stockFormateado = product!.measurementUnit.format(product!.stock);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text('Stock insuficiente. Solo quedan $stockFormateado'),
            backgroundColor: Theme.of(context).colorScheme.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      return;
    }
    context.read<CartCubit>().updateQuantity(item.productId, newQuantity);
  }

  @override
  Widget build(BuildContext context) {
    final isGram = item.measurementUnit == MeasurementUnit.gram;
    final colorTheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorTheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorTheme.outlineVariant, width: 1.5),
      ),
      child: Opacity(
        opacity: isAvailable ? 1.0 : 0.4,
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Imagen
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: colorTheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: item.imageUrl != null && item.imageUrl!.isNotEmpty
                        ? Image.network(item.imageUrl!, fit: BoxFit.cover)
                        : Icon(Icons.image, color: colorTheme.surfaceContainer),
                  ),
                ),
                const SizedBox(width: 16),
                
                // Detalles
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0), // Espacio para el ícono de basura
                        child: Text(
                          item.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: colorTheme.onSurface,
                            decoration: !isAvailable ? TextDecoration.lineThrough : null,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        isGram ? _formatWeight(item.quantity) : '${item.quantity} pza',
                        style: TextStyle(
                          color: colorTheme.onSurfaceVariant,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            CurrencyFormatter.format(item.subtotal),
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              color: colorTheme.primaryContainer,
                            ),
                          ),
                          if (isAvailable)
                            _buildQuantityControls(context, isGram)
                          else
                            _buildUnavailableBadge(context),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            // Ícono de Basura posicionado arriba a la derecha
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: isProcessing ? null : () => context.read<CartCubit>().removeItem(item.productId),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: colorTheme.surface,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.delete_outline,
                    color: colorTheme.error,
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityControls(BuildContext context, bool isGram) {
    final colorTheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Botón Menos (Gris)
        InkWell(
          onTap: isProcessing ? null : () {
            final subtraction = isGram ? 1000 : 1;
            context.read<CartCubit>().updateQuantity(item.productId, item.quantity - subtraction);
          },
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: colorTheme.secondary,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.remove, size: 18, color: colorTheme.onPrimaryContainer),
          ),
        ),
        
        // Número central
        GestureDetector(
          onTap: isProcessing ? null : () async {
            if (isGram) {
              final newGrams = await showDialog<int>(
                context: context,
                builder: (context) => QuantitySelectorDialog(
                  productName: item.name,
                  pricePerKilo: item.unitPrice,
                ),
              );
              if (newGrams != null && newGrams > 0 && context.mounted) {
                _updateQuantityIfStockAllows(context, newGrams);
              }
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: isProcessing
                ? const SizedBox(height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2))
                : Text(
                    isGram ? _formatWeight(item.quantity) : '${item.quantity}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: colorTheme.onSurface,
                    ),
                  ),
          ),
        ),

        // Botón Más (Verde)
        InkWell(
          onTap: isProcessing ? null : () {
            final addition = isGram ? 1000 : 1;
            _updateQuantityIfStockAllows(context, item.quantity + addition);
          },
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: colorTheme.primary, // Verde vibrante
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.add, size: 18, color: colorTheme.onPrimaryContainer),
          ),
        ),
      ],
    );
  }

  Widget _buildUnavailableBadge( BuildContext context) {
    return Text(
      'Agotado',
      style: TextStyle(
        color: Theme.of(context).colorScheme.error,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}