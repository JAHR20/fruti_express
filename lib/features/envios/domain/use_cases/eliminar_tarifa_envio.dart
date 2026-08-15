import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/repositories/envios_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';

class EliminarTarifaEnvioUseCase {
  final EnvioRepository repository;

  EliminarTarifaEnvioUseCase(this.repository);

  ResultTask<Unit> call({
    required Perfil usuarioActual,
    required String tarifaId,
  }) {
    return TaskEither.Do(($) async {
      if (!usuarioActual.esAdmin) {
        return await $(
          TaskEither.left(
            const Failure.unauthorized(
              "Solo un administrador puede eliminar tarifas",
            ),
          ),
        );
      }
      await $(repository.eliminarTarifa(tarifaId));

      return unit;
    });
  }
}
