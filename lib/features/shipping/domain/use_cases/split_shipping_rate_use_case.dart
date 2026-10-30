
import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_rate.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';

class SplitShippingRateUseCase {
  const SplitShippingRateUseCase();

  ResultTask<List<ShippingRate>> execute({
    required AppUser currentUser,
    required String branchId,
    required List<ShippingRate> rates,
    required String rateId,
    required String name,
    required double minKm,
    required double maxKm,
    required int costInCents,
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

      // 2. Validar los datos de la nueva tarifa.
      final newMin = double.parse(minKm.toStringAsFixed(1));
      final newMax = double.parse(maxKm.toStringAsFixed(1));

      if (name.trim().isEmpty ||
          newMin < 0 ||
          newMin >= newMax ||
          costInCents < 0) {
        return await $(
          TaskEither.left(
            const Failure.validation(
              FailureCode.invalidDistanceRange,
            ),
          ),
        );
      }

      // 3. Encontrar la tarifa que se va a dividir.
      final index = rates.indexWhere(
        (rate) => rate.id == rateId && rate.branchId == branchId,
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

      final original = rates[index];

      // 4. El nuevo rango debe estar dentro del original.
      if (newMin < original.minDistanceKm ||
          newMax > original.maxDistanceKm) {
        return await $(
          TaskEither.left(
            const Failure.validation(
              FailureCode.invalidDistanceRange,
            ),
          ),
        );
      }

      final hasPrevious = newMin > original.minDistanceKm;
      final hasNext = newMax < original.maxDistanceKm;

      final replacementRates = <ShippingRate>[];

      // 5. Tramo anterior: conserva el ID original si existe.
      if (hasPrevious) {
        replacementRates.add(
          original.copyWith(maxDistanceKm: newMin),
        );
      }

      // 6. Nueva tarifa: la base de datos generará su ID.
      replacementRates.add(
        ShippingRate(
          id: '',
          branchId: branchId,
          name: name.trim(),
          minDistanceKm: newMin,
          maxDistanceKm: newMax,
          cost: costInCents,
          isActive: true,
          createdAt: DateTime.now(),
        ),
      );

      // 7. Tramo posterior.
      if (hasNext) {
        replacementRates.add(
          original.copyWith(
            id: hasPrevious ? '' : original.id,
            minDistanceKm: newMax,
          ),
        );
      }

      // 8. Sustituir el original y ordenar el resultado.
      final result = List<ShippingRate>.of(rates)
        ..removeAt(index)
        ..insertAll(index, replacementRates)
        ..sort(
          (a, b) => a.minDistanceKm.compareTo(b.minDistanceKm),
        );

      return result;
    });
  }
}