import 'package:fruti_express_jahr_admin/features/shipping/data/models/shipping_config_model.dart';
import 'package:fruti_express_jahr_admin/features/shipping/data/models/shipping_rate_model.dart';

abstract class ShippingRemoteDataSource {
  Future<ShippingConfigModel?> getConfig(String branchId);
  Future<List<ShippingRateModel>> getRates(String branchId);
  Future<void> saveConfig(ShippingConfigModel config);
  Future<void> saveRates({
    required String branchId,
    required List<ShippingRateModel> rates,
  });
  Future<Set<String>> getBranchesWithConfiguredShipping();
}
