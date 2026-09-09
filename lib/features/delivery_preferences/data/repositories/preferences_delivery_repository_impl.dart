import 'package:fruti_express_jahr_admin/features/delivery_preferences/data/datasources/preferences_delivery_local_datasource.dart';
import 'package:fruti_express_jahr_admin/features/delivery_preferences/domain/repositories/preferences_delivery_repository.dart';

class PreferencesDeliveryRepositoryImpl implements PreferencesDeliveryRepository {
  final PreferencesDeliveryLocalDatasource _localDatasource;

  PreferencesDeliveryRepositoryImpl(this._localDatasource);

  @override
  Future<String?> getSelectedAddress() {
    return _localDatasource.getSelectedAddress();
  }

  @override
  Future<void> saveSelectedAddress(String addressId) {
    return _localDatasource.saveSelectedAddress(addressId);
  }

  @override
  Future<void> clearSelectedAddress() {
    return _localDatasource.clearSelectedAddress();
  }
}