import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import '../entities/perfil.dart';
import '../extensions/perfil_permisos_extension.dart';
import '../repositories/usuario_repository.dart';

class ExisteEncargadoEnSucursal {
  final UsuarioRepository repository;
  ExisteEncargadoEnSucursal(this.repository);

  /// Verifica si una sucursal tiene jefe.
  /// 🛡️ Solo permitido para Administradores.
  ResultTask<bool> ejecutar({
    required Perfil solicitante,
    required String sucursalId,
  }) {
    return TaskEither.Do(($) async {
      // 1. Validación de seguridad
      if (!solicitante.esAdmin) {
        return await $(
          TaskEither<Failure, bool>.left(
            const Failure.unauthorized(
              "No tienes permisos para consultar la disponibilidad de gestión en sucursales.",
            ),
          ),
        );
      }

      // 2. Validación de datos
      if (sucursalId.trim().isEmpty) {
        return await $(
          TaskEither<Failure, bool>.left(
            const Failure.validation(
              "El ID de la sucursal no puede estar vacío.",
            ),
          ),
        );
      }

      // 3. Consulta al repositorio
      return await $(repository.existeEncargadoEnSucursal(sucursalId));
    });
  }
}
