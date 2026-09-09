import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/errors/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/coupons/data/datasources/coupon_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/coupons/data/models/coupon_model.dart';
import 'package:fruti_express_jahr_admin/features/coupons/domain/entities/coupon.dart';
import 'package:fruti_express_jahr_admin/features/coupons/domain/repositories/coupon_repository.dart';

class CouponRepositoryImpl
    with SupabaseHandleException
    implements CouponRepository {
  final CouponRemoteDataSource remoteDataSource;

  CouponRepositoryImpl(this.remoteDataSource);

  @override
  ResultTask<Coupon?> getCouponByCode(String code) =>
      TaskEither.tryCatch(() async {
        final model = await remoteDataSource.getByCode(code);
        return model?.toEntity();
      }, handleException);

  @override
  ResultTask<List<Coupon>> getCoupons({bool includeInactive = false}) =>
      TaskEither.tryCatch(() async {
        final models = await remoteDataSource.getAll(
          includeInactive: includeInactive,
        );
        return models.map((m) => m.toEntity()).toList();
      }, handleException);

  @override
  ResultTask<Coupon> createCoupon(Coupon coupon) =>
      TaskEither.tryCatch(() async {
        final model = CouponModel.fromEntity(coupon);
        final created = await remoteDataSource.create(model);
        return created.toEntity();
      }, handleException);

  @override
  ResultTask<Coupon> updateCoupon(Coupon coupon) =>
      TaskEither.tryCatch(() async {
        final model = CouponModel.fromEntity(coupon);
        final updated = await remoteDataSource.update(model);
        return updated.toEntity();
      }, handleException);

  @override
  ResultTask<Unit> changeStatus(String id, bool newState) =>
      TaskEither.tryCatch(() async {
        await remoteDataSource.changeStatus(id, newState);
        return unit;
      }, handleException);
}
