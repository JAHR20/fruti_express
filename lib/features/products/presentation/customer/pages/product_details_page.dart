import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/unit_formatter.dart';
import 'package:fruti_express_jahr_admin/features/cart/domain/entities/cart_item.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/widgets/product_detail_image.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/widgets/product_info_section.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/customer/widgets/detail_bottom_bar.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;
  final String branchId;
  final String? categoryName;

  const ProductDetailsPage({
    super.key,
    required this.product,
    required this.branchId,
    this.categoryName,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late int _selectedQuantity;
  late bool _isGram;

  @override
  void initState() {
    super.initState();
    _isGram = widget.product.measurementUnit == MeasurementUnit.gram;
    _selectedQuantity = _isGram ? 1000 : 1;
  }

  void _handleIncrement() {
    final addition = _isGram ? 1000 : 1;
    final newQuantity = _selectedQuantity + addition;

    if (newQuantity > widget.product.stock) {
      final stockFormateado = widget.product.measurementUnit.format(
        widget.product.stock,
      );
      final colorScheme = Theme.of(context).colorScheme;

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(
              'Límite alcanzado. Solo quedan $stockFormateado',
              style: TextStyle(color: colorScheme.onError),
            ),
            backgroundColor: colorScheme.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      return;
    }

    setState(() {
      _selectedQuantity = newQuantity;
    });
  }

  void _handleDecrement() {
    final subtraction = _isGram ? 1000 : 1;
    final minLimit = _isGram ? 1000 : 1;

    if (_selectedQuantity > minLimit) {
      setState(() {
        _selectedQuantity -= subtraction;
      });
    }
  }

  void _addToCart() {
    final colorScheme = Theme.of(context).colorScheme;

    // Aseguramos que la sucursal quede registrada en el cubit
    context.read<CartCubit>().setActiveBranch(widget.branchId);

    final cartItem = CartItem(
      productId: widget.product.id!,
      name: widget.product.name,
      imageUrl: widget.product.imageUrl,
      unitPrice: widget.product.currentPrice,
      measurementUnit: widget.product.measurementUnit,
      branchId: widget.branchId,
      quantity: _selectedQuantity,
    );

    context.read<CartCubit>().addItem(cartItem);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Producto agregado al carrito',
          style: TextStyle(color: colorScheme.onPrimary),
        ),
        backgroundColor: colorScheme.primary,
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final double unitMultiplier = _isGram
        ? (_selectedQuantity / 1000)
        : _selectedQuantity.toDouble();
    final int totalPrice = (widget.product.currentPrice * unitMultiplier)
        .round();
    final bool isOutOfStock = widget.product.stock <= 0;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colorScheme.onSurface.withValues(alpha: 0.5),
            shape: BoxShape.circle,
          ),
          child: BackButton(color: colorScheme.surface),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colorScheme.onSurface.withValues(alpha: 0.5),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.favorite_border, color: colorScheme.surface),
              onPressed: () {},
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductDetailImage(imageUrl: widget.product.imageUrl),
            ProductInfoSection(
              name: widget.product.name,
              categoryName: widget.categoryName ?? 'Categoría desconocida',
              price: widget.product.currentPrice,
              unit: widget.product.measurementUnit,
              stock: widget.product.stock,
              description: widget.product.description,
            ),
          ],
        ),
      ),
      bottomSheet: DetailBottomBar(
        totalPrice: totalPrice,
        isOutOfStock: isOutOfStock,
        onAddToCart: _addToCart,
        quantity: _selectedQuantity,
        formattedQuantity: widget.product.measurementUnit.format(
          _selectedQuantity,
        ),
        onIncrement: _handleIncrement,
        onDecrement: _handleDecrement,
      ),
    );
  }
}
