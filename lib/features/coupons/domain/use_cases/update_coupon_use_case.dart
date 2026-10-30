import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';
import '../entities/coupon.dart';
import '../repositories/coupon_repository.dart';

class UpdateCouponUseCase {
  final CouponRepository repository;
  
  UpdateCouponUseCase(this.repository);

  ResultTask<Coupon> execute({ 
    required AppUser currentUser, 
    required Coupon couponToEdit,
  }) {
    return TaskEither.Do(($) async {
      await $(_validatePermissions(currentUser));
      await $(_validateBusinessRules(couponToEdit));

      return await $(repository.updateCoupon(couponToEdit)); 
    });
  }

  ResultTask<Unit> _validatePermissions(AppUser user) =>
      (user.isAdmin || user.isManager)
          ? TaskEither.right(unit)
          : TaskEither.left(
              const Failure.unauthorized(
                FailureCode.noPermissionToPerformAction,
              ),
            );

  ResultTask<Unit> _validateBusinessRules(Coupon coupon) {
    if (coupon.validUntil != null && coupon.validUntil!.isBefore(coupon.validFrom)) {
      return TaskEither.left(
          const Failure.badRequest(FailureCode.invalidDateRange));
    }
    return TaskEither.right(unit);
  }
}