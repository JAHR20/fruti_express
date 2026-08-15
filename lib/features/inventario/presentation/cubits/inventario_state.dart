import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/entities/inventario.dart';

part 'inventario_state.freezed.dart';

@freezed
abstract class InventarioState with _$InventarioState {
  const factory InventarioState({
    @Default([]) List<Inventario> inventario,
    @Default(false) bool isLoading,
    String? productoProcesandoId,
    String? errorMessage,
    String? operacionError,
    @Default(false) bool operacionExitosa,
    String? sucursalId,
  }) = _InventarioState;
}