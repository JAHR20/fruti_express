import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import '../entities/direccion.dart';

abstract class DireccionRepository {
  /// Obtiene todas las direcciones de un usuario específico.
  ResultTask<List<Direccion>> obtenerPorUsuario(String usuarioId);

  /// Agrega una nueva dirección al perfil del usuario.
  ResultTask<Direccion> crear(Direccion direccion);

  /// Modifica los datos de una dirección existente.
  ResultTask<Direccion> actualizar(Direccion direccion);

  /// Elimina físicamente una dirección (ya que el pedido guarda su propia copia).
  ResultTask<Unit> eliminar(String id);

  /// Marca una dirección como la favorita para envíos y desmarca las demás.
  ResultTask<Unit> establecerPrincipal({
    required String usuarioId,
    required String direccionId,
  });
}
