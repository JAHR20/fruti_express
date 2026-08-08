import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';

part 'productos_state.freezed.dart';

@freezed
class ProductosState with _$ProductosState {
  const factory ProductosState.initial() = ProductosInitial;
  const factory ProductosState.loading() = ProductosLoading;
  
  // 🌟 Unificamos catálogo y detalle en una sola estructura
  const factory ProductosState.loaded({
    required List<Producto> productos,
    Producto? productoDetalle,
    String? categoriaIdActual,
  }) = ProductosLoaded;
  
  const factory ProductosState.error(String message) = ProductosError;
}