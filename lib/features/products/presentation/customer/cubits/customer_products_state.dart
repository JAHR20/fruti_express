import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';

part 'customer_products_state.freezed.dart';

@freezed
abstract class CustomerProductsState with _$CustomerProductsState {
  const factory CustomerProductsState({
    @Default(<Product>[]) List<Product> products,
    Product? productDetail,
    String? currentCategoryId,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default('') String branchId,
  }) = _CustomerProductsState;
}