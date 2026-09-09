
abstract class PreferencesDeliveryLocalDatasource {
  Future<String?> getSelectedAddress();
  Future<void> saveSelectedAddress(String addressId);
  Future<void> clearSelectedAddress();
}