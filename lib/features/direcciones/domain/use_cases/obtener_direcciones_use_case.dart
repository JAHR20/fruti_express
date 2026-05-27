import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/repositories/direccion_repository.dart';

class ObtenerDireccionesUseCase {
  final DireccionRepository repository;
  ObtenerDireccionesUseCase(this.repository);

  ResultTask<List<Direccion>> call(String usuarioId) {
    return repository.obtenerPorUsuario(usuarioId);
  }
}
