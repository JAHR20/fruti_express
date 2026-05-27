import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import '../entities/perfil.dart';
import '../extensions/perfil_permisos_extension.dart';
import '../repositories/usuario_repository.dart';

class ObtenerUsuarioPorId {
  final UsuarioRepository repository;
  ObtenerUsuarioPorId(this.repository);

  /// Obtiene un perfil por ID validando permisos.
  /// 🛡️ Regla: Solo el dueño del perfil o el Staff pueden ver esta información.
  ResultTask<Perfil> ejecutar({
    required Perfil solicitante,
    required String idABuscar,
  }) {
    return TaskEither.Do(($) async {
      final esDueno = solicitante.id == idABuscar;

      // 1. Validación de seguridad
      if (!esDueno && !solicitante.esStaff) {
        return await $(
          TaskEither<Failure, Perfil>.left(
            const Failure.unauthorized(
              "No tienes permisos para ver el perfil de otros usuarios.",
            ),
          ),
        );
      }

      // 2. Validación de datos
      if (idABuscar.trim().isEmpty) {
        return await $(
          TaskEither<Failure, Perfil>.left(
            const Failure.validation("El ID de búsqueda no puede estar vacío."),
          ),
        );
      }

      // 3. Consulta al repositorio
      return await $(repository.obtenerPorId(idABuscar));
    });
  }
}
