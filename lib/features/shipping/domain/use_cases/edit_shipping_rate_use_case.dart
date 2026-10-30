
import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_rate.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';

class EditShippingRateUseCase {
  const EditShippingRateUseCase();

  ResultTask<List<ShippingRate>> execute({
    required AppUser currentUser,
    required String branchId,
    required List<ShippingRate> rates,
    required String rateId,
    required String name,
    required double minKm,
    required double maxKm,
    required double maxRadiusKm,
    required int costInCents,
  }) {
    return TaskEither.Do(($) async {
      if (!currentUser.isAdmin) {
        return await $(
          TaskEither.left(
            const Failure.unauthorized(
              FailureCode.unauthorizedAccess,
            ),
          ),
        );
      }

      final normalizedName = name.trim();

      if (normalizedName.isEmpty ||
          costInCents < 0 ||
          !minKm.isFinite ||
          !maxKm.isFinite ||
          !maxRadiusKm.isFinite ||
          maxRadiusKm <= 0) {
        return await $(
          TaskEither.left(
            const Failure.validation(
              FailureCode.invalidDistanceRange,
            ),
          ),
        );
      }

      final updatedRates = List<ShippingRate>.of(rates)
        ..sort(
          (a, b) => a.minDistanceKm.compareTo(b.minDistanceKm),
        );

      final index = updatedRates.indexWhere(
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

      final original = updatedRates[index];

      final isFirst = index == 0;
      final isLast = index == updatedRates.length - 1;

      final adjustedMin = isFirst ? 0.0 : minKm;
      final adjustedMax = isLast ? maxRadiusKm : maxKm;

      const tolerance = 0.0001;

      if (adjustedMin < 0 ||
          adjustedMax > maxRadiusKm ||
          adjustedMin >= adjustedMax) {
        return await $(
          TaskEither.left(
            const Failure.validation(
              FailureCode.invalidDistanceRange,
            ),
          ),
        );
      }

      // No permitir cambiar los límites compartidos.
      if ((!isFirst &&
              (adjustedMin - original.minDistanceKm).abs() >
                  tolerance) ||
          (!isLast &&
              (adjustedMax - original.maxDistanceKm).abs() >
                  tolerance)) {
        return await $(
          TaskEither.left(
            const Failure.validation(
              FailureCode.invalidDistanceRange,
            ),
          ),
        );
      }

      updatedRates[index] = original.copyWith(
        name: normalizedName,
        minDistanceKm: adjustedMin,
        maxDistanceKm: adjustedMax,
        cost: costInCents,
      );

      return updatedRates;
    });
  }
}
