import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  const CategoryModel._();
  const factory CategoryModel({
    required String id,
    required String name,
    String? description, 
    @JsonKey(name: 'image_url') String? imageUrl, 
    @JsonKey(name: 'is_active') required bool isActive, 
    @JsonKey(name: 'parent_category_id') String? parentCategoryId, 
    @JsonKey(name: 'created_at') required DateTime createdAt, 
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

extension CategoryModelX on CategoryModel {
  Category toDomain() => Category(
    id: id,
    name: name,
    description: description,
    imageUrl: imageUrl,
    isActive: isActive,
    parentCategoryId: parentCategoryId,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  static CategoryModel fromDomain(Category c) => CategoryModel(
    id: c.id,
    name: c.name,
    description: c.description,
    imageUrl: c.imageUrl,
    isActive: c.isActive,
    parentCategoryId: c.parentCategoryId,
    createdAt: c.createdAt,
    updatedAt: c.updatedAt,
  );
}