import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/shipping/data/models/shipping_config_model.dart';
import 'package:fruti_express_jahr_admin/features/shipping/data/models/shipping_rate_model.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_config.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_rate.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/repositories/shipping_repository.dart';
import 'package:fruti_express_jahr_admin/features/shipping/data/datasources/shipping_remote_datasource.dart';

class ShippingRepositoryImpl
    with SupabaseHandleException
    implements ShippingRepository {
  final ShippingRemoteDataSource _remoteDataSource;

  ShippingRepositoryImpl(this._remoteDataSource);

  @override
  ResultTask<ShippingConfig?> getConfig(String branchId) {
    return TaskEither.tryCatch(() async {
      final model = await _remoteDataSource.getConfig(branchId);
      return model?.toEntity();
    }, handleException);
  }

  @override
  ResultTask<List<ShippingRate>> getRates(String branchId) {
    return TaskEither.tryCatch(() async {
      final models = await _remoteDataSource.getRates(branchId);
      return models.map((model) => model.toEntity()).toList();
    }, handleException);
  }

  @override
  ResultTask<Unit> saveConfig(ShippingConfig config) {
    return TaskEither.tryCatch(() async {
      final model = ShippingConfigModel.fromEntity(config);
      await _remoteDataSource.saveConfig(model);
      return unit;
    }, handleException);
  }


  @override
  ResultTask<Unit> saveRates({
    required String branchId,
    required List<ShippingRate> rates,
  }) {
    return TaskEither.tryCatch(() async {
      final models = rates.map(ShippingRateModel.fromEntity).toList();

      await _remoteDataSource.saveRates(branchId: branchId, rates: models);

      return unit;
    }, handleException);
  }


  @override
  ResultTask<Set<String>> getBranchesWithConfiguredShipping() {
    return TaskEither.tryCatch(() async {
      return await _remoteDataSource.getBranchesWithConfiguredShipping();
    }, handleException);
  }
}
