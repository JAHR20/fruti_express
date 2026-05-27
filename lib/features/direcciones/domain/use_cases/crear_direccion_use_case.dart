import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/repositories/direccion_repository.dart';

class CrearDireccionUseCase {
  final DireccionRepository repository;
  CrearDireccionUseCase(this.repository);

  ResultTask<Direccion> call(Direccion direccion) {
    return repository.crear(direccion);
  }
}
