import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';
import '../entities/perfil.dart';
import '../repositories/usuario_repository.dart';

class ObtenerRepartidores {
  final UsuarioRepository repository;
  ObtenerRepartidores(this.repository);

  /// El [sucursalIdOpcional] solo lo toma en cuenta si el solicitante es ADMIN.
  ResultTask<List<Perfil>> call({
    required Perfil solicitante,
    String? sucursalIdOpcional,
  }) {
    // 1. Bloqueo para Clientes o Repartidores
    if (!solicitante.esStaff) {
      return TaskEither.left(
        const Failure.unauthorized(
          'No tienes permisos para consultar repartidores.',
        ),
      );
    }

    // 2. REGLA PARA ENCARGADO: Filtro forzado a su propia sucursal
    if (solicitante.esEncargado) {
      // Ignoramos lo que venga en sucursalIdOpcional y usamos el del perfil del encargado
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

    // 3. REGLA PARA ADMIN: Libertad total
    // Si sucursalIdOpcional es null, el repo traerá a todos los repartidores del sistema.
    return repository.obtenerRepartidores(sucursalId: sucursalIdOpcional);
  }
}
