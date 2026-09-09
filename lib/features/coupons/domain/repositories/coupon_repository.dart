import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/coupons/domain/entities/coupon.dart';

abstract class CouponRepository {
  ResultTask<Coupon?> getCouponByCode(String code);
  ResultTask<List<Coupon>> getCoupons({bool includeInactive = false});
  ResultTask<Coupon> createCoupon(Coupon coupon);
  ResultTask<Coupon> updateCoupon(Coupon coupon);
  ResultTask<Unit> changeStatus(String id, bool newState);
}
