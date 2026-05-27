import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import '../entities/perfil.dart';
import '../extensions/perfil_permisos_extension.dart';
import '../repositories/usuario_repository.dart';

class ActualizarPerfil {
  final UsuarioRepository repository;
  ActualizarPerfil(this.repository);

  ResultTask<Perfil> ejecutar({
    required Perfil solicitante,
    required Perfil perfilAEditar,
  }) {
    return TaskEither.Do(($) async {
      // 🛡️ Regla: Solo puedes editarte a ti mismo O ser Administrador
      final esDueno = solicitante.id == perfilAEditar.id;

      if (!esDueno && !solicitante.esAdmin) {
        return await $(
          TaskEither<Failure, Perfil>.left(
            const Failure.unauthorized(
              "No tienes permiso para editar este perfil.",
            ),
          ),
        );
      }

      return await $(repository.actualizar(perfilAEditar));
    });
  }
}
