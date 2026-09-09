import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/services/postali/postali_service.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/postal_location.dart';

class GetLocationByPostalCodeUseCase {
  final PostaliService postaliService;

  GetLocationByPostalCodeUseCase(this.postaliService);

  ResultTask<PostalLocation> execute(String postalCode) {
    final cleanCp = postalCode.trim();

    if (cleanCp.length != 5) {
      return TaskEither.left(
        const Failure.validation(FailureCode.invalidPostalCodeLength),
      );
    }

    return TaskEither.Do(($) async {
      // Obtener información del CP
      final postalInfo = await $(
        TaskEither.tryCatch(
          () => postaliService.fetchPostalCode(cleanCp).then((result) { 
            if (result == null) {
              throw Exception();
            }
            return result;
          }),
          (_, __) => const Failure.notFound(FailureCode.postalCodeNotFound),
        ),
      );

      // Obtener todos los CP del municipio
      final municipalityInfo = await $(
        TaskEither.tryCatch(
          () => postaliService
              .fetchMunicipality( 
                stateSlug: postalInfo.stateSlug, 
                municipalitySlug: postalInfo.municipalitySlug, 
              )
              .then((result) {
                if (result == null) {
                  throw Exception();
                }
                return result;
              }),
          (_, __) => const Failure.notFound(FailureCode.municipalityInfoNotFound),
        ),
      );

      // Agrupar colonias por CP
      final Map<String, List<String>> neighborhoodsByCp = {};

      // 🌟 neighborhoods, postalCode, name
      for (final neighborhood in municipalityInfo.neighborhoods) {
        neighborhoodsByCp.putIfAbsent(neighborhood.postalCode, () => []);
        neighborhoodsByCp[neighborhood.postalCode]!.add(neighborhood.name); 
      }

      // Crear nuestra entidad de dominio
      return PostalLocation(
        postalCode: postalInfo.postalCode,
        state: postalInfo.state, 
        municipality: postalInfo.municipality, 
        availablePostalCodes: municipalityInfo.uniquePostalCodes, 
        neighborhoodsByPostalCode: neighborhoodsByCp,
      );
    });
  }
}