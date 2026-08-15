import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import '../entities/perfil.dart';
import '../extensions/perfil_permisos_extension.dart';
import '../repositories/usuario_repository.dart';

class ContarAdminsActivos {
  final UsuarioRepository repository;
  ContarAdminsActivos(this.repository);

  ResultTask<int> ejecutar(Perfil solicitante) {
    return TaskEither.Do(($) async {
      if (!solicitante.esStaff) {
        return await $(
          TaskEither<Failure, int>.left(
            const Failure.unauthorized("Acceso denegado a métricas de staff."),
          ),
        );
      }

      return await $(repository.contarAdminsActivos());
    });
  }
}
