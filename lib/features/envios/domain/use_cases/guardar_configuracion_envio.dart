import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/configuracion_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/repositories/envios_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';

class GuardarConfiguracionEnvioUseCase {
  final EnvioRepository repository;

  GuardarConfiguracionEnvioUseCase(this.repository);

  ResultTask<Unit> call({
    required Perfil usuarioActual,
    required ConfiguracionEnvio configuracion,
  }) {
    return TaskEither.Do(($) async {
      // 1️⃣ Seguridad: Validar rol
      if (!usuarioActual.esAdmin) {
        return await $(
          TaskEither.left(
            const Failure.unauthorized(
              "Solo un administrador puede configurar los envíos",
            ),
          ),
        );
      }

      // 2️⃣ Validaciones de negocio preventivas
      if (configuracion.radioMaximoKm <= 0) {
        return await $(
          TaskEither.left(
            const Failure.validation(
              "El radio máximo de entrega debe ser mayor a 0 km",
            ),
          ),
        );
      }

      // 3️⃣ Guardamos la configuración
      await $(repository.guardarConfiguracion(configuracion));

      return unit;
    });
  }
}