import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/entities/inventario.dart';

part 'inventario_model.freezed.dart';
part 'inventario_model.g.dart';

@freezed
abstract class InventarioModel with _$InventarioModel {
  const factory InventarioModel({
    @JsonKey(name: 'producto_id') required String productoId,
    @JsonKey(name: 'sucursal_id') required String sucursalId,
    @JsonKey(name: 'stock_disponible') required int stockDisponible,
    @JsonKey(name: 'stock_reservado') required int stockReservado,
    @JsonKey(name: 'precio_local') int? precioLocal,
    @JsonKey(name: 'fecha_actualizacion') required DateTime fechaActualizacion,
  }) = _InventarioModel;

  factory InventarioModel.fromJson(Map<String, dynamic> json) =>
      _$InventarioModelFromJson(json);
}

extension InventarioModelX on InventarioModel {
  Inventario toDomain() => Inventario(
    productoId: productoId,
    sucursalId: sucursalId,
    stockDisponible: stockDisponible,
    stockReservado: stockReservado,
    precioLocal: precioLocal,
    fechaActualizacion: fechaActualizacion,
  );

  static InventarioModel fromDomain(Inventario i) => InventarioModel(
    productoId: i.productoId,
    sucursalId: i.sucursalId,
    stockDisponible: i.stockDisponible,
    stockReservado: i.stockReservado,
    precioLocal: i.precioLocal,
    fechaActualizacion: i.fechaActualizacion,
  );
}