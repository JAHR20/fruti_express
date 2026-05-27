import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/repositories/direccion_repository.dart';

class ActualizarDireccionUseCase {
  final DireccionRepository repository;
  ActualizarDireccionUseCase(this.repository);

  ResultTask<Direccion> call(Direccion direccion) {
    return repository.actualizar(direccion);
  }
}
