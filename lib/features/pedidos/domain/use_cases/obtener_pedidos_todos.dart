import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/repositories/pedido_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';

class ObtenerTodosLosPedidos {
  final PedidoRepository repository;

  ObtenerTodosLosPedidos(this.repository);

  /// Obtiene la lista global de pedidos si el usuario tiene permisos de Admin.
  ResultTask<List<Pedido>> ejecutar(Perfil usuarioActual) {
    return TaskEither.Do(($) async {
      // 1️⃣ Validación de Seguridad (Solo Admins)
      if (!usuarioActual.esAdmin) {
        return await $(
          TaskEither.left(
            const Failure.unauthorized(
              'No tienes permisos para ver el historial global de pedidos.',
            ),
          ),
        );
      }

      // 2️⃣ Delegación al Repositorio
      // Obtenemos la "foto completa" del negocio.
      return await $(repository.obtenerTodos());
    });
  }
}
