import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/tarifa_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/repositories/envios_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';

class GuardarTarifaEnvioUseCase {
  final EnvioRepository repository;

  GuardarTarifaEnvioUseCase(this.repository);

  ResultTask<Unit> call({
    required Perfil usuarioActual,
    required TarifaEnvio tarifa,
  }) {
    return TaskEither.Do(($) async {
      // 1️⃣ Seguridad: Validar rol
      if (!usuarioActual.esAdmin) {
        return await $(
          TaskEither.left(
            const Failure.unauthorized(
              "Solo un administrador puede gestionar tarifas de envío",
            ),
          ),
        );
      }

      // 2️⃣ Validaciones de negocio críticas
      if (tarifa.distanciaMinKm >= tarifa.distanciaMaxKm) {
        return await $(
          TaskEither.left(
            const Failure.validation(
              "La distancia mínima no puede ser mayor o igual a la máxima",
            ),
          ),
        );
      }

      if (tarifa.costo < 0) {
        return await $(
          TaskEither.left(
            const Failure.validation("El costo de envío no puede ser negativo"),
          ),
        );
      }

      // 3️⃣ Guardamos la tarifa
      await $(repository.guardarTarifa(tarifa));

      return unit;
    });
  }
}