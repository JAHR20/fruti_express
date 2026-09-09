import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import '../entities/coupon.dart';
import '../repositories/coupon_repository.dart';

class ValidateAndApplyCouponUseCase {
  final CouponRepository repository;
  
  ValidateAndApplyCouponUseCase(this.repository);

  ResultTask<Coupon> execute({ 
    required String code, 
    required int cartSubtotal,
  }) {
    return TaskEither.Do(($) async {
      // 1. Validamos texto vacío
      await $(_validateInput(code));

      // 2. Traemos el cupón y validamos que exista
      final coupon = await $(_getCouponFromDB(code));

      // 3. Validamos fechas y usos
      await $(_validateCouponState(coupon));

      // 4. Validamos monto mínimo
      await $(_validateMinimumAmount(coupon, cartSubtotal));

      return coupon;
    });
  }

  ResultTask<Unit> _validateInput(String code) => 
      code.trim().isEmpty
          ? TaskEither.left(const Failure.badRequest(FailureCode.emptyCouponCode))
          : TaskEither.right(unit);

  ResultTask<Coupon> _getCouponFromDB(String code) {
    return TaskEither.Do(($) async {
      final coupon = await $(repository.getCouponByCode(code.trim().toUpperCase()));
      if (coupon == null) {
        return await $(TaskEither.left(const Failure.notFound(FailureCode.couponNotFound)));
      }
      return coupon;
    });
  }

  ResultTask<Unit> _validateCouponState(Coupon coupon) =>
      !coupon.isValidNow
          ? TaskEither.left(const Failure.badRequest(FailureCode.couponExpiredOrInactive))
          : TaskEither.right(unit);

  ResultTask<Unit> _validateMinimumAmount(Coupon coupon, int cartSubtotal) {
    if (!coupon.isApplicableForAmount(cartSubtotal)) {
      final missingAmount = coupon.minPurchaseAmount - cartSubtotal;
      return TaskEither.left(
        Failure.badRequest(
          FailureCode.couponMinAmountNotMet,
          params: {'missingAmount': missingAmount},
        ),
      );
    }
    return TaskEither.right(unit);
  }
}