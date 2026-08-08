import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

part 'usuarios_state.freezed.dart';

@freezed
class UsuariosState with _$UsuariosState {
  const factory UsuariosState.initial() = UsuariosInitial;
  const factory UsuariosState.loading() = UsuariosLoading;
  const factory UsuariosState.loaded(List<Perfil> usuarios) = UsuariosLoaded;
  const factory UsuariosState.error(String message) = UsuariosError;
}