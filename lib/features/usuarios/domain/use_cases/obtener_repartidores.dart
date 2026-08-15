import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';
import '../entities/perfil.dart';
import '../repositories/usuario_repository.dart';

class ObtenerRepartidores {
  final UsuarioRepository repository;
  ObtenerRepartidores(this.repository);

  ResultTask<List<Perfil>> call({
    required Perfil solicitante,
    String? sucursalIdOpcional,
  }) {
    // Bloqueo para Clientes o Repartidores
    if (!solicitante.esStaff) {
      return TaskEither.left(
        const Failure.unauthorized(
          'No tienes permisos para consultar repartidores.',
        ),
      );
    }

    // REGLA PARA ENCARGADO, Filtro forzado a su propia sucursal
    if (solicitante.esEncargado) {
      final miSucursal = solicitante.sucursalId;

      if (miSucursal == null || miSucursal.isEmpty) {
        return TaskEither.left(
          const Failure.validation(
            'Tu perfil de encargado no tiene una sucursal asignada.',
          ),
        );
      }

      return repository.obtenerRepartidores(sucursalId: miSucursal);
    }

    // REGLA PARA ADMIN: Libertad total, si sucursalIdOpcional es null, el repo traerá a todos los repartidores del sistema.
    return repository.obtenerRepartidores(sucursalId: sucursalIdOpcional);
  }
}
