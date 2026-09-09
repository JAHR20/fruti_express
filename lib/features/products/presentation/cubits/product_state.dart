import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';
part 'product_state.freezed.dart';

@freezed
abstract class ProductState with _$ProductState {
  const factory ProductState({
    @Default(<Product>[]) List<Product> products,
    Product? productDetail,
    String? currentCategoryId,
    @Default(false) bool isLoading,
    String? processingProductId,
    @Default(false) bool isSavingOperation,
    String? errorMessage,
    String? operationError,
    @Default(false) bool operationSuccessful,
  }) = _ProductState;
}