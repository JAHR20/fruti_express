import 'package:url_launcher/url_launcher.dart';
import 'communication_service.dart';

class CommunicationServiceImpl implements CommunicationService {
  @override
  Future<void> makeCall(String phoneNumber) async {
    final url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) await launchUrl(url);
  }

  @override
  Future<void> sendWhatsApp(String phoneNumber, String message) async {
    final numLimpio = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
    final url = Uri.parse(
      "https://wa.me/52$numLimpio?text=${Uri.encodeComponent(message)}",
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }
}
