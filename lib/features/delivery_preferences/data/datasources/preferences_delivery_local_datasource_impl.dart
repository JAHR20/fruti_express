import 'package:fruti_express_jahr_admin/features/delivery_preferences/data/datasources/preferences_delivery_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesDeliveryLocalDatasourceImpl implements PreferencesDeliveryLocalDatasource {
  final SharedPreferences sharedPreferences;
  
  static const String _addressKey = 'FRUTI_EXPRESS_SELECTED_ADDRESS_CACHE';

  PreferencesDeliveryLocalDatasourceImpl({required this.sharedPreferences});

  @override
  Future<String?> getSelectedAddress() async {
    return sharedPreferences.getString(_addressKey);
  }

  @override
  Future<void> saveSelectedAddress(String addressId) async {
    await sharedPreferences.setString(_addressKey, addressId);
  }

  @override
  Future<void> clearSelectedAddress() async {
    await sharedPreferences.remove(_addressKey);
  }
}