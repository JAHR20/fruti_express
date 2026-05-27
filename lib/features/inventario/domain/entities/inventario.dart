import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventario.freezed.dart';
part 'inventario.g.dart';

@freezed
abstract class Inventario with _$Inventario {
  const factory Inventario({
    required String id,
    required String productoId,
    required String sucursalId,
    required int cantidadDisponible,
    required int cantidadReservada,
    required DateTime ultimaActualizacion,
  }) = _Inventario;

  factory Inventario.fromJson(Map<String, dynamic> json) =>
      _$InventarioFromJson(json);
}
