import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/repositories/pedido_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/enums/tipo_usuario.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/repositories/usuario_repository.dart';

class AsignarRepartidor {
  final PedidoRepository pedidoRepository;
  final UsuarioRepository usuarioRepository;

  AsignarRepartidor(this.pedidoRepository, this.usuarioRepository);

  ResultTask<Pedido> ejecutar({
    required String pedidoId,
    required String repartidorId,
  }) {
    return TaskEither.Do(($) async {
      // 1️⃣ Obtener el Pedido
      // Si el pedido no existe, el repo devuelve Left y el $ corta aquí.
      final pedido = await $(pedidoRepository.obtenerPorId(pedidoId));

      // 2️⃣ Obtener el Usuario (Repartidor)
      final repartidor = await $(usuarioRepository.obtenerPorId(repartidorId));

      // 3️⃣ Validar Rol de Repartidor
      await $(_validarRolRepartidor(repartidor));

      // 4️⃣ Validar Correspondencia de Sucursal
      await $(_validarSucursalMatch(repartidor, pedido));

      // 5️⃣ Ejecutar Asignación Final
      return await $(
        pedidoRepository.asignarRepartidor(
          pedidoId: pedidoId,
          repartidorId: repartidorId,
        ),
      );
    });
  }

  // --- 🧩 MICRO-PASOS DE VALIDACIÓN ---

  ResultTask<Unit> _validarRolRepartidor(Perfil usuario) =>
      usuario.rol == TipoUsuario.repartidor
      ? TaskEither.right(unit)
      : TaskEither.left(
          const Failure.unauthorized(
            'El usuario seleccionado no cuenta con el rol de repartidor.',
          ),
        );

  ResultTask<Unit> _validarSucursalMatch(Perfil repartidor, Pedido pedido) {
    final sucursalRepartidor = repartidor.sucursalId ?? '';
    final sucursalPedido = pedido.sucursalId;

    return sucursalRepartidor == sucursalPedido
        ? TaskEither.right(unit)
        : TaskEither.left(
            const Failure.validation(
              'El repartidor no pertenece a la misma sucursal que el pedido.',
            ),
          );
  }
}
