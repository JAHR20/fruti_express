import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_config.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/repositories/shipping_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';

class SaveShippingConfigUseCase { 
  final ShippingRepository _repository;

  SaveShippingConfigUseCase(this._repository);

  ResultTask<Unit> execute({
    required Profile currentUser,
    required ShippingConfig config,
  }) {
    return TaskEither.Do(($) async {
      if (!currentUser.isAdmin) {
        return await $(
          TaskEither.left(const Failure.unauthorized(FailureCode.unauthorizedAccess)),
        );
      }

      if (config.maxRadiusKm <= 0) {
        return await $(
          TaskEither.left(const Failure.validation(FailureCode.invalidShippingRadius)),
        );
      }
      
      if (config.minAmountForFreeShipping != null && config.minAmountForFreeShipping! < 0) {
        return await $(
           TaskEither.left(const Failure.validation(FailureCode.invalidAmount)),
        );
      }

      await $(_repository.saveConfig(config));

      return unit;
    });
  }
}