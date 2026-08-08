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
      // 1️⃣ Seguridad: Solo el Super Admin puede desactivar sucursales
      if (!usuarioActual.esAdmin) {
        return await $(
          TaskEither.left(
            const Failure.unauthorized(
              "No tienes permisos para desactivar sucursales",
            ),
          ),
        );
      }

      // 2️⃣ Obtener la sucursal actual
      final sucursal = await $(repository.obtenerPorId(sucursalId));
      if (sucursal == null) {
        return await $(
          TaskEither.left(const Failure.notFound("La sucursal no existe")),
        );
      }

      // 3️⃣ Validación de Negocio: No desactivar algo ya desactivado
      if (sucursal.activa == nuevoEstado) {
        return await $(
          TaskEither.left(
            const Failure.validation("La sucursal ya se encuentra en el estado solicitado"),
          ),
        );
      }

      // 💡 REGLA DE INTEGRIDAD (Opcional pero recomendada):
      // Podrías verificar si hay pedidos "En Camino" antes de permitir desactivar.
      // await $(_validarSinPedidosPendientes(sucursalId));

      // 4️⃣ Aplicar el cambio (Inmutabilidad)
      final actualizada = sucursal.copyWith(activa: nuevoEstado);

      // 5️⃣ Persistir
      return await $(repository.actualizar(actualizada));
    });
  }
}
