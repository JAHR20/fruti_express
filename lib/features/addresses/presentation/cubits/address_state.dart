import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/entities/address.dart';

part 'address_state.freezed.dart';

@freezed
abstract class AddressState with _$AddressState {
  const factory AddressState({
    @Default(<Address>[]) List<Address> addresses, // direcciones -> addresses

    @Default(false) bool isLoading,

    /// ID de la dirección que está siendo creada/actualizada/eliminada.
    String? processingAddressId, // direccionProcesandoId -> processingAddressId

    /// ID de la dirección que se está marcando como principal.
    String? processingMainAddressId, // direccionPrincipalProcesandoId -> processingMainAddressId

    /// Error al cargar la lista completa.
    String? errorMessage,

    /// Error producido durante una operación puntual.
    String? operationError, // operacionError -> operationError

    /// Indica que una operación puntual terminó correctamente.
    @Default(false) bool operationSuccessful, // operacionExitosa -> operationSuccessful

    /// Usuario cuyas direcciones están actualmente cargadas.
    String? userId, // usuarioId -> userId
  }) = _AddressState;
}