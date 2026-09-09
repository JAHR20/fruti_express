import 'package:fruti_express_jahr_admin/features/delivery_preferences/domain/repositories/preferences_delivery_repository.dart';

class SaveSelectedAddressUseCase {
  final PreferencesDeliveryRepository repository;

  SaveSelectedAddressUseCase(this.repository);

  Future<void> call(String addressId) {
    return repository.saveSelectedAddress(addressId);
  }
}