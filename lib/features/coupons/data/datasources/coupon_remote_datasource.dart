import 'package:fruti_express_jahr_admin/features/coupons/data/models/coupon_model.dart';

abstract class CouponRemoteDataSource {
  Future<List<CouponModel>> getAll({bool includeInactive = false});
  Future<CouponModel?> getById(String id);
  Future<CouponModel?> getByCode(String code);
  Stream<List<CouponModel>> watchAll();
  Future<CouponModel> create(CouponModel model);
  Future<CouponModel> update(CouponModel model);
  Future<void> changeStatus(String id, bool newState);
}