abstract class ContactService {
  Future<void> makeCall(String phoneNumber);
  Future<void> openWhatsApp(String phoneNumber);
  Future<void> openMaps(String address);
}