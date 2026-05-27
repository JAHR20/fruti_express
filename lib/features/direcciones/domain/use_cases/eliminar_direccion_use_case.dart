import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/repositories/direccion_repository.dart';

class EliminarDireccionUseCase {
  final DireccionRepository repository;
  EliminarDireccionUseCase(this.repository);

  ResultTask<Unit> call(String id) {
    return repository.eliminar(id);
  }
}
