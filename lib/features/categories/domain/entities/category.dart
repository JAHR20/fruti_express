import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';

@freezed
abstract class Category with _$Category {
  const factory Category({
    required String id,
    required String name, 
    String? description, 
    String? imageUrl,
    required bool isActive,
    String? parentCategoryId,
    required DateTime createdAt,
    DateTime? updatedAt, 
  }) = _Category;
}