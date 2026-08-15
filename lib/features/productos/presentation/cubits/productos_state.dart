import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';
part 'productos_state.freezed.dart';

@freezed
abstract class ProductosState with _$ProductosState {
  const factory ProductosState({
    @Default(<Producto>[]) List<Producto> productos,
    Producto? productoDetalle,
    String? categoriaIdActual,
    @Default(false) bool isLoading,
    String? productoProcesandoId,
    @Default(false) bool guardandoOperacion,
    String? errorMessage,
    String? operacionError,
    @Default(false) bool operacionExitosa,
  }) = _ProductosState;
}