import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/repositories/sucursal_repository.dart';

class ObtenerSucursales {
  final SucursalRepository repository;

  ObtenerSucursales(this.repository);

  ResultTask<List<Sucursal>> ejecutar() {
    return repository.obtenerTodas();
  }
}
