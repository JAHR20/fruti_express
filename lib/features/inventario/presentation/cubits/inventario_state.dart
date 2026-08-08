import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/entities/inventario.dart';

part 'inventario_state.freezed.dart';

@freezed
class InventarioState with _$InventarioState {
  const factory InventarioState.initial() = InventarioInitial;
  const factory InventarioState.loading() = InventarioLoading;
  const factory InventarioState.loaded(
    List<Inventario> inventario, {
    String? actualizandoProductoId,
  }) = InventarioLoaded;
  const factory InventarioState.error(String message) = InventarioError;
}