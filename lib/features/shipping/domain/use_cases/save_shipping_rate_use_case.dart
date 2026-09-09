import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_rate.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/repositories/shipping_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';

class SaveShippingRateUseCase { 
  final ShippingRepository _repository;

  SaveShippingRateUseCase(this._repository);

  ResultTask<Unit> execute({
    required Profile currentUser,
    required ShippingRate rate,
  }) {
    return TaskEither.Do(($) async {
      if (!currentUser.isAdmin) {
        return await $(
          TaskEither.left(const Failure.unauthorized(FailureCode.unauthorizedAccess)),
        );
      }
      
      if (rate.minDistanceKm >= rate.maxDistanceKm) {
        return await $(
          TaskEither.left(const Failure.validation(FailureCode.invalidDistanceRange)),
        );
      }

      if (rate.cost < 0) {
        return await $(
          TaskEither.left(const Failure.validation(FailureCode.invalidShippingCost)),
        );
      }

      await $(_repository.saveRate(rate));

      return unit;
    });
  }
}