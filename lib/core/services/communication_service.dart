// lib/domain/services/communication_service.dart
abstract class CommunicationService {
  Future<void> makeCall(String phoneNumber);
  Future<void> sendWhatsApp(String phoneNumber, String message);
}


//https://sepomex.nitrostudio.com.mx/api/latest/cp/$cp.json'