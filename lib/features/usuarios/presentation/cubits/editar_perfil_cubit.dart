import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/use_cases/actualizar_perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/presentation/cubits/editar_perfil_state.dart';

class EditarPerfilCubit extends Cubit<EditarPerfilState> {
  final ActualizarPerfil _actualizarPerfil;

  EditarPerfilCubit({
    required ActualizarPerfil actualizarPerfil,
  })  : _actualizarPerfil = actualizarPerfil,
        super(const EditarPerfilState.initial());

  Future<void> actualizarPerfil({
    required Perfil usuarioActual,
    required Perfil perfilAEditar,
  }) async {
    emit(const EditarPerfilState.saving());

    final result = await _actualizarPerfil
        .ejecutar(
          solicitante: usuarioActual,
          perfilAEditar: perfilAEditar,
        )
        .run();

    result.fold(
      (failure) {
        emit(EditarPerfilState.error(failure.errorMessage));
      },
      (_) {
        emit(const EditarPerfilState.success());
      },
    );
  }
}