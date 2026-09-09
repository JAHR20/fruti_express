import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import '../entities/coupon.dart';
import '../repositories/coupon_repository.dart';

class GetCouponsUseCase {
  final CouponRepository repository;
  
  GetCouponsUseCase(this.repository);

  ResultTask<List<Coupon>> execute({ 
    required Profile requester, 
    bool includeInactive = false,
  }) {
    return TaskEither.Do(($) async {
      await $(_validatePermissions(requester));

      return await $(repository.getCoupons(includeInactive: includeInactive)); 
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