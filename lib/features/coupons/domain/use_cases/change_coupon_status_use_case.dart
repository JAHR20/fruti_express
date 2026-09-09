import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';
import '../repositories/coupon_repository.dart';

class ChangeCouponStatusUseCase {
  final CouponRepository repository;
  
  ChangeCouponStatusUseCase(this.repository);

  ResultTask<Unit> execute({ 
    required Profile currentUser, 
    required String couponId,
    required bool newState,
  }) {
    return TaskEither.Do(($) async {
      await $(_validatePermissions(currentUser));

      return await $(repository.changeStatus(couponId, newState)); 
    });
  }

  ResultTask<Unit> _validatePermissions(Profile user) =>
      (user.isAdmin || user.isManager)
          ? TaskEither.right(unit)
          : TaskEither.left(
              const Failure.unauthorized(
                FailureCode.noPermissionToPerformAction,
              ),
            );
}