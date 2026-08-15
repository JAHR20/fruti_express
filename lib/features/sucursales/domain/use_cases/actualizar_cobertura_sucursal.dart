import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/repositories/sucursal_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';

class ActualizarCoberturaSucursal {
  final SucursalRepository repository;

  ActualizarCoberturaSucursal(this.repository);

  ResultTask<void> ejecutar({
    required Perfil usuarioActual,
    required String sucursalId,
    required List<String> codigosPostales,
  }) {
    if (!usuarioActual.esAdmin) {
      return TaskEither.left(
        const Failure.unauthorized(
          'No tienes permisos para modificar la cobertura.',
        ),
      );
    }

    return repository.actualizarCobertura(
      sucursalId: sucursalId,
      codigosPostales: codigosPostales,
    );
  }
}