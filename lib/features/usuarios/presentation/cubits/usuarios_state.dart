import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

part 'usuarios_state.freezed.dart';

enum UsuariosTab {
  todos,
  repartidores,
  clientes,
}

@freezed
abstract class UsuariosState with _$UsuariosState {
  const factory UsuariosState({
    @Default([]) List<Perfil> usuarios,
    @Default(false) bool isLoading,
    @Default(UsuariosTab.todos) UsuariosTab tab,
    String? usuarioProcesandoId,
    String? errorMessage,
    @Default('') String searchQuery,
  }) = _UsuariosState;
}