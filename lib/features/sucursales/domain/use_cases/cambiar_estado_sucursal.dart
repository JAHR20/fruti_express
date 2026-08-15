import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/repositories/sucursal_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';

class CambiarEstadoSucursal {
  final SucursalRepository repository;

  CambiarEstadoSucursal(this.repository);

  ResultTask<Sucursal> ejecutar({
    required Perfil usuarioActual,
    required String sucursalId,
    required bool nuevoEstado,
  }) {
    return TaskEither.Do(($) async {
      // Solo el Super Admin puede desactivar sucursales
      if (!usuarioActual.esAdmin) {
        return await $(
          TaskEither.left(
            const Failure.unauthorized(
              "No tienes permisos para desactivar sucursales",
            ),
          ),
        );
      }

      // Obtener la sucursal actual
      final sucursal = await $(repository.obtenerPorId(sucursalId));
      if (sucursal == null) {
        return await $(
          TaskEither.left(const Failure.notFound("La sucursal no existe")),
        );
      }

      // Validación de Negocio, no se puede desactivar algo ya desactivado
      if (sucursal.activa == nuevoEstado) {
        return await $(
          TaskEither.left(
            const Failure.validation("La sucursal ya se encuentra en el estado solicitado"),
          ),
        );
      }

      final actualizada = sucursal.copyWith(activa: nuevoEstado);

      return await $(repository.actualizar(actualizada));
    });
  }
}
