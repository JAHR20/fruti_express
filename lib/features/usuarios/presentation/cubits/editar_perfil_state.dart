import 'package:freezed_annotation/freezed_annotation.dart';

part 'editar_perfil_state.freezed.dart';

@freezed
class EditarPerfilState with _$EditarPerfilState {
  const factory EditarPerfilState.initial() = EditarPerfilInitial;
  const factory EditarPerfilState.saving() = EditarPerfilSaving;
  const factory EditarPerfilState.success() = EditarPerfilSuccess;
  const factory EditarPerfilState.error(String message) = EditarPerfilError;
}
