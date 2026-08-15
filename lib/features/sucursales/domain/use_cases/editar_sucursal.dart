import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/repositories/sucursal_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';

class EditarSucursal {
  final SucursalRepository repository;

  EditarSucursal(this.repository);

  ResultTask<Sucursal> ejecutar({
    required Perfil usuarioActual,
    required Sucursal sucursalModificada,
  }) {
    return TaskEither.Do(($) async {
      // Seguridad
      if (!usuarioActual.esAdmin) {
        return await $(
          TaskEither.left(
            const Failure.unauthorized(
              "No tienes permisos para editar sucursales",
            ),
          ),
        );
      }

      // se verifica la existencia
      final original = await $(repository.obtenerPorId(sucursalModificada.id));
      if (original == null) {
        return await $(
          TaskEither.left(const Failure.notFound("La sucursal no existe")),
        );
      }

      if (sucursalModificada.latitud == null ||
          sucursalModificada.longitud == null) {
        return await $(
          TaskEither.left(
            const Failure.validation(
              "Las coordenadas de ubicación son obligatorias para los envíos.",
            ),
          ),
        );
      }

      final sucursalActualizada = await $(
        repository.actualizar(sucursalModificada),
      );

      return sucursalActualizada;
    });
  }
}
