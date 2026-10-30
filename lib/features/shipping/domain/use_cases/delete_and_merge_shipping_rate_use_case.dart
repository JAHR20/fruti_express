import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_rate.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';

class DeleteAndMergeShippingRateUseCase {
  const DeleteAndMergeShippingRateUseCase();

  ResultTask<List<ShippingRate>> execute({
    required AppUser currentUser,
    required String branchId,
    required List<ShippingRate> rates,
    required String rateId,
  }) {
    return TaskEither.Do(($) async {
      // 1. Validar permisos.
      if (!currentUser.isAdmin) {
        return await $(
          TaskEither.left(
            const Failure.unauthorized(
              FailureCode.unauthorizedAccess,
            ),
          ),
        );
      }

      // 2. No permitir dejar la sucursal sin tarifas.
      if (rates.length <= 1) {
        return await $(
          TaskEither.left(
            const Failure.validation(
              FailureCode.invalidDistanceRange,
            ),
          ),
        );
      }

      // 3. Ordenar y verificar que la tarifa pertenezca a la sucursal.
      final sortedRates = List<ShippingRate>.of(rates)
        ..sort(
          (a, b) => a.minDistanceKm.compareTo(b.minDistanceKm),
        );

      final index = sortedRates.indexWhere(
        (rate) =>
            rate.id == rateId && rate.branchId == branchId,
      );

      if (index == -1) {
        return await $(
          TaskEither.left(
            const Failure.validation(
              FailureCode.invalidDistanceRange,
            ),
          ),
        );
      }

      final rateToDelete = sortedRates[index];
      final updatedRates = List<ShippingRate>.of(sortedRates);

      // 4. Unir el rango eliminado con el siguiente o el anterior.
      if (index < sortedRates.length - 1) {
        // Si existe una tarifa siguiente, esta absorbe el rango.
        final nextRate = sortedRates[index + 1];

        updatedRates[index + 1] = nextRate.copyWith(
          minDistanceKm: rateToDelete.minDistanceKm,
        );
      } else {
        // Si es la última, la tarifa anterior absorbe su rango.
        final previousRate = sortedRates[index - 1];

        updatedRates[index - 1] = previousRate.copyWith(
          maxDistanceKm: rateToDelete.maxDistanceKm,
        );
      }

      updatedRates.removeAt(index);

      return updatedRates;
    });
  }
}
