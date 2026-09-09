import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/unit_formatter.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart';
import 'package:fruti_express_jahr_admin/features/cart/domain/entities/cart_item.dart'; // CarritoItem -> CartItem
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart'; // CarritoCubit -> CartCubit
import 'package:fruti_express_jahr_admin/features/products/presentation/widgets/quantity_selector_dialog.dart'; // Actualizado el import
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart'; // Producto -> Product
import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart'; // UnidadMedida -> MeasurementUnit

class CustomerProductCard extends StatelessWidget { // TarjetaProductoCliente -> CustomerProductCard
  final Product product; // producto -> product

  const CustomerProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final bool isOutOfStock = product.stock <= 0; // estaAgotado -> isOutOfStock

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
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
                        product.imageUrl ?? '', // imagenUrl -> imageUrl
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(Icons.broken_image, color: Colors.grey),
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
                        product.name, // nombre -> name
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      // Unidad de medida sola
                      Text(
                        product.measurementUnit.name, // unidadMedida.nombreUI -> measurementUnit.uiName (Asumiendo traducción en la extensión)
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      // Stock solo
                      if (!isOutOfStock)
                        Text(
                          'Disp: ${product.measurementUnit.format(product.stock)}', // formatear -> format
                          style: TextStyle(
                            color: Colors.green.shade700,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      const SizedBox(height: 8),
                      Text(
                        CurrencyFormatter.format(product.currentPrice.toInt()), // precioActual -> currentPrice
                        style: const TextStyle(
                          color: Color(0xFFEF4444),
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // LETRERO DE "AGOTADO"
          if (isOutOfStock)
            Positioned(
              top: 12,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: const Text(
                  'AGOTADO',
                  style: TextStyle(
                    color: Colors.white,
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
                    ? Colors.grey.shade300
                    : const Color(0xFFF9A826),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: isOutOfStock ? Colors.grey.shade500 : Colors.white,
                ),
                onPressed: isOutOfStock
                    ? null
                    : () async {
                        int finalQuantity = 1; // cantidadFinal -> finalQuantity

                        if (product.measurementUnit == MeasurementUnit.gram) { // UnidadMedida.gramo -> MeasurementUnit.gram
                          final chosenGrams = await showDialog<int>( // gramosElegidos -> chosenGrams
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
                        final activeBranch = cartState.branchId ?? ''; // sucursalActiva -> activeBranch

                        final newItem = CartItem( // nuevoItem -> newItem
                          productId: product.id!,
                          name: product.name,
                          imageUrl: product.imageUrl ?? '',
                          unitPrice: product.currentPrice, // precioUnitario -> unitPrice
                          quantity: finalQuantity,
                          measurementUnit: product.measurementUnit,
                          branchId: activeBranch,
                        );
                        
                        final error = await cartCubit.addItem(newItem); // agregarProducto -> addItem

                        if (context.mounted) {
                          if (error != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(error),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  product.measurementUnit == MeasurementUnit.gram
                                      ? '${finalQuantity}g de ${product.name} agregados'
                                      : '${product.name} agregado al carrito',
                                ),
                                duration: const Duration(seconds: 1),
                                backgroundColor: const Color(0xFF4DB6AC),
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
    );
  }
}