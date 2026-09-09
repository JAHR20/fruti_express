import 'package:fruti_express_jahr_admin/features/delivery_preferences/domain/repositories/preferences_delivery_repository.dart';

class GetSelectedAddressUseCase {
  final PreferencesDeliveryRepository repository;

  GetSelectedAddressUseCase(this.repository);

  Future<String?> call() {
    return repository.getSelectedAddress();
  }
}