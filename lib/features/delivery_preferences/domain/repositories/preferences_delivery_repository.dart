abstract class PreferencesDeliveryRepository {
  Future<String?> getSelectedAddress();
  Future<void> saveSelectedAddress(String addressId);
  Future<void> clearSelectedAddress();
}