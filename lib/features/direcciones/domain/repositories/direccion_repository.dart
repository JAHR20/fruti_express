import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import '../entities/direccion.dart';

abstract class DireccionRepository {
  ResultTask<List<Direccion>> obtenerPorUsuario(String usuarioId);
  ResultTask<Direccion> crear(Direccion direccion);
  ResultTask<Direccion> actualizar(Direccion direccion);
  ResultTask<Unit> eliminar(String id);
  ResultTask<Unit> establecerPrincipal({
    required String usuarioId,
    required String direccionId,
  });
}
