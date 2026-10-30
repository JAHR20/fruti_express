import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';

part 'admin_products_state.freezed.dart';

@freezed
abstract class AdminProductsState with _$AdminProductsState {
  const factory AdminProductsState({
    @Default(<Product>[]) List<Product> products,
    @Default(false) bool isLoading,
    String? errorMessage,
    
    // Banderas exclusivas de las operaciones de administración
    String? processingProductId,
    @Default(false) bool isSavingOperation,
    String? operationError,
    @Default(false) bool operationSuccessful,
  }) = _AdminProductsState;
}