
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/repositories/sucursal_repository.dart';

class ObtenerCobertura {
  final SucursalRepository repository;

  ObtenerCobertura(this.repository);

  ResultTask<List<String>> ejecutar(String sucursalId) {
    return repository.obtenerCobertura(sucursalId);
  }
}