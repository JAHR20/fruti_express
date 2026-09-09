import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';

part 'category_state.freezed.dart';

@freezed
abstract class CategoryState with _$CategoryState {
  const factory CategoryState({
    @Default(<Category>[]) List<Category> categories, 
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(false) bool isSavingOperation, 
    String? operationError, 
    @Default(false) bool operationSuccessful, 
    String? processingCategoryId,
  }) = _CategoryState;
}