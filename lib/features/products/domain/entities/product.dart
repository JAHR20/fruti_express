import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart';

part 'product.freezed.dart';

@freezed
abstract class Product with _$Product {
  const Product._();
  const factory Product({
    String? id,
    required String categoryId, 
    required String name,
    String? description, 
    required int currentPrice,
    int? comparisonPrice,
    required MeasurementUnit measurementUnit,
    String? imageUrl,
    required bool isActive, 
    required DateTime createdAt,
    DateTime? updatedAt,
    @Default(0) int stock,
  }) = _Product;

  bool get hasDiscount => 
      comparisonPrice != null && comparisonPrice! > currentPrice;
      
  int get discountPercentage { 
    if (!hasDiscount) return 0;
    
    final calculation = (1 - (currentPrice / comparisonPrice!)) * 100;
    return calculation.round();
  }
}