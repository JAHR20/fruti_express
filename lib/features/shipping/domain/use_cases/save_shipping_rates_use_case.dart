
import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_rate.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/repositories/shipping_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';

class SaveShippingRatesUseCase {
  final ShippingRepository _repository;

  SaveShippingRatesUseCase(this._repository);

  ResultTask<Unit> execute({
    required AppUser currentUser,
    required String branchId,
    required List<ShippingRate> rates,
    required double maxRadiusKm,
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

      if (rates.isEmpty || maxRadiusKm <= 0) {
        return await $(
          TaskEither.left(
            const Failure.validation(
              FailureCode.ratesMustCoverFullRadius,
            ),
          ),
        );
      }

      // Todas las tarifas deben pertenecer a la misma sucursal.
      if (rates.any((rate) => rate.branchId != branchId)) {
        return await $(
          TaskEither.left(
            const Failure.validation(
              FailureCode.ratesBranchMismatch,
            ),
          ),
        );
      }

      // Validar rangos y costos.
      for (final rate in rates) {
        if (rate.minDistanceKm < 0 ||
            rate.minDistanceKm >= rate.maxDistanceKm ||
            rate.maxDistanceKm > maxRadiusKm) {
          return await $(
            TaskEither.left(
              const Failure.validation(
                FailureCode.ratesMustCoverFullRadius,
              ),
            ),
          );
        }

        if (rate.cost < 0) {
          return await $(
            TaskEither.left(
              const Failure.validation(
                FailureCode.invalidShippingCost,
              ),
            ),
          );
        }
      }

      // Ordenar las tarifas para comprobar continuidad.
      final sortedRates = List<ShippingRate>.of(rates)
        ..sort(
          (a, b) =>
              a.minDistanceKm.compareTo(b.minDistanceKm),
        );

      const tolerance = 0.0001;

      if (sortedRates.first.minDistanceKm.abs() > tolerance ||
          (sortedRates.last.maxDistanceKm - maxRadiusKm).abs() >
              tolerance) {
        return await $(
          TaskEither.left(
            const Failure.validation(
              FailureCode.ratesMustCoverFullRadius,
            ),
          ),
        );
      }

      for (var i = 1; i < sortedRates.length; i++) {
        final previous = sortedRates[i - 1];
        final current = sortedRates[i];

        if ((current.minDistanceKm - previous.maxDistanceKm).abs() >
            tolerance) {
          return await $(
            TaskEither.left(
              const Failure.validation(
                FailureCode.ratesHaveGap,
              ),
            ),
          );
        }
      }

      await $(
        _repository.saveRates(
          branchId: branchId,
          rates: sortedRates,
        ),
      );

      return unit;
    });
  }
}