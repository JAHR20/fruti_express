import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/repositories/direccion_repository.dart';

class EstablecerDireccionPrincipalUseCase {
  final DireccionRepository repository;
  EstablecerDireccionPrincipalUseCase(this.repository);

  ResultTask<Unit> call({
    required String usuarioId,
    required String direccionId,
  }) {
    return repository.establecerPrincipal(
      usuarioId: usuarioId,
      direccionId: direccionId,
    );
  }
}
