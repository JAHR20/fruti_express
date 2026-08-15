import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart';

part 'direcciones_state.freezed.dart';

@freezed
abstract class DireccionesState with _$DireccionesState {
  const factory DireccionesState({
    @Default(<Direccion>[]) List<Direccion> direcciones,

    @Default(false) bool isLoading,

    /// ID de la dirección que está siendo creada/actualizada/eliminada.
    String? direccionProcesandoId,

    /// ID de la dirección que se está marcando como principal.
    String? direccionPrincipalProcesandoId,

    /// Error al cargar la lista completa.
    String? errorMessage,

    /// Error producido durante una operación puntual.
    String? operacionError,

    /// Indica que una operación puntual terminó correctamente.
    @Default(false) bool operacionExitosa,

    /// Usuario cuyas direcciones están actualmente cargadas.
    String? usuarioId,
  }) = _DireccionesState;
}