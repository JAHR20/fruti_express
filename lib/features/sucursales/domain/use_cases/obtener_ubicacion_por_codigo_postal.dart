import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/services/postali/postali_service.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/ubicacion_postal.dart';

class ObtenerUbicacionPorCodigoPostal {
  final PostaliService postaliService;

  ObtenerUbicacionPorCodigoPostal(this.postaliService);

  ResultTask<UbicacionPostal> ejecutar(String codigoPostal) {
    final cp = codigoPostal.trim();

    if (cp.length != 5) {
      return TaskEither.left(
        const Failure.validation('El código postal debe tener 5 dígitos.'),
      );
    }

    return TaskEither.Do(($) async {
      // Obtener información del CP
      final infoCp = await $(
        TaskEither.tryCatch(
          () => postaliService.consultarCp(cp).then((resultado) {
            if (resultado == null) {
              throw Exception(
                'No se encontró información para el código postal.',
              );
            }

            return resultado;
          }),
          (_, __) => const Failure.notFound(
            'No se encontró información para el código postal.',
          ),
        ),
      );

      // Obtener todos los CP del municipio
      final infoMunicipio = await $(
        TaskEither.tryCatch(
          () => postaliService
              .obtenerMunicipio(
                estadoSlug: infoCp.estadoSlug,
                municipioSlug: infoCp.municipioSlug,
              )
              .then((resultado) {
                if (resultado == null) {
                  throw Exception('No se encontró información del municipio.');
                }

                return resultado;
              }),
          (_, __) => const Failure.notFound(
            'No se pudo obtener la información del municipio.',
          ),
        ),
      );

      // Agrupar colonias por CP
      final Map<String, List<String>> coloniasPorCp = {};

      for (final colonia in infoMunicipio.colonias) {
        coloniasPorCp.putIfAbsent(colonia.cp, () => []);

        coloniasPorCp[colonia.cp]!.add(colonia.nombre);
      }

      // Crear nuestra entidad de dominio
      return UbicacionPostal(
        codigoPostal: infoCp.cp,
        estado: infoCp.estado,
        municipio: infoCp.municipio,
        codigosPostalesDisponibles: infoMunicipio.codigosPostalesUnicos,
        coloniasPorCodigoPostal: coloniasPorCp,
      );
    });
  }
}
