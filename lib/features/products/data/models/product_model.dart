import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/core/utils/measurement_unit_converter.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const ProductModel._();
  const factory ProductModel({
    String? id,
    @JsonKey(name: 'category_id') required String categoryId,
    required String name,
    String? description,
    @JsonKey(name: 'current_price') required int currentPrice,
    @JsonKey(name: 'compare_at_price') int? comparisonPrice,
    @MeasurementUnitConverter()
    @JsonKey(name: 'measurement_unit') required MeasurementUnit measurementUnit,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(readValue: _readStock, includeToJson: false) @Default(0) int stock,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

extension ProductModelX on ProductModel {
  Product toDomain() => Product(
    id: id,
    categoryId: categoryId,
    name: name,
    description: description,
    currentPrice: currentPrice,
    comparisonPrice: comparisonPrice,
    measurementUnit: measurementUnit,
    imageUrl: imageUrl,
    isActive: isActive,
    createdAt: createdAt,
    updatedAt: updatedAt,
    stock: stock,
  );

  static ProductModel fromDomain(Product p) => ProductModel(
    id: p.id,
    categoryId: p.categoryId,
    name: p.name,
    description: p.description,
    currentPrice: p.currentPrice,
    comparisonPrice: p.comparisonPrice,
    measurementUnit: p.measurementUnit,
    imageUrl: p.imageUrl,
    isActive: p.isActive,
    createdAt: p.createdAt,
    updatedAt: p.updatedAt,
    stock: p.stock,
  );
}

int _readStock(Map<dynamic, dynamic> json, String key) {
  final inventory = json['inventory'];

  if (inventory is List && inventory.isNotEmpty) {
    return inventory.first['available_stock'] ?? 0;
  } else if (inventory is Map) {
    return inventory['available_stock'] ?? 0;
  }

  return json['available_stock'] ?? 0;
}
