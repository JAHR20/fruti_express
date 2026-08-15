import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import '../entities/perfil.dart';
import '../extensions/perfil_permisos_extension.dart';
import '../repositories/usuario_repository.dart';

class ExisteEncargadoEnSucursal {
  final UsuarioRepository repository;
  ExisteEncargadoEnSucursal(this.repository);
  ResultTask<bool> ejecutar({
    required Perfil solicitante,
    required String sucursalId,
  }) {
    return TaskEither.Do(($) async {
      if (!solicitante.esAdmin) {
        return await $(
          TaskEither<Failure, bool>.left(
            const Failure.unauthorized(
              "No tienes permisos para consultar la disponibilidad de gestión en sucursales.",
            ),
          ),
        );
      }

      if (sucursalId.trim().isEmpty) {
        return await $(
          TaskEither<Failure, bool>.left(
            const Failure.validation(
              "El ID de la sucursal no puede estar vacío.",
            ),
          ),
        );
      }

      return await $(repository.existeEncargadoEnSucursal(sucursalId));
    });
  }
}
