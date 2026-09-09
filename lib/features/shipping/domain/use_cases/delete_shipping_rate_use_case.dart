import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/repositories/shipping_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';

class DeleteShippingRateUseCase { 
  final ShippingRepository _repository;

  DeleteShippingRateUseCase(this._repository);

  ResultTask<Unit> execute({
    required Profile currentUser, 
    required String rateId, 
  }) {
    return TaskEither.Do(($) async {
      if (!currentUser.isAdmin) { 
        return await $(
          TaskEither.left(const Failure.unauthorized(FailureCode.unauthorizedAccess)),
        );
      }
      
      await $(_repository.deleteRate(rateId));

      return unit;
    });
  }
}