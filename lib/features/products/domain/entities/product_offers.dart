// lib/features/products/domain/entities/product_offers.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';

part 'product_offers.freezed.dart';

/// Productos en oferta de una sucursal.
/// [categoryUnavailable] es true cuando se pidió una categoría que ya no existe
/// o está desactivada: en ese caso [products] trae las ofertas de todas las categorías.
@freezed
abstract class ProductOffers with _$ProductOffers {
  const factory ProductOffers({
    @Default(<Product>[]) List<Product> products,
    @Default(false) bool categoryUnavailable,
  }) = _ProductOffers;
}