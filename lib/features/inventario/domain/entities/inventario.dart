import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';

part 'inventario.freezed.dart';

@freezed
abstract class Inventario with _$Inventario {
  const Inventario._();

  const factory Inventario({
    required String productoId,
    required String sucursalId,
    required int stockDisponible,
    required int stockReservado,
    int? precioLocal, 
    required DateTime fechaActualizacion,
  }) = _Inventario;

  bool get tieneRemateLocal => precioLocal != null;

  int precioFinal(Producto producto) => 
      precioLocal ?? producto.precioActual;

  bool tieneDescuentoGlobal(Producto producto) =>
      !tieneRemateLocal && producto.tieneDescuento;

  bool esStockCritico(Producto producto) {
    return stockDisponible <= 5;
  }
}