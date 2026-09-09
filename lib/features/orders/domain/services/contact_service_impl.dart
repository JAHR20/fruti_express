import 'package:url_launcher/url_launcher.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/services/contact_service.dart';

class ContactServiceImpl implements ContactService {
  static const _countryCode = '52';
  static const _whatsAppMessage =
      '¡Hola! Soy tu repartidor de Fruti Express. '
      'Estoy en camino con tu pedido. 🛵';

  @override
  Future<void> makeCall(String phoneNumber) async {
    final uri = Uri(scheme: 'tel', path: phoneNumber);
    if (!await canLaunchUrl(uri)) return;
    await launchUrl(uri);
  }

  @override
  Future<void> openWhatsApp(String phoneNumber) async {
    final message = Uri.encodeComponent(_whatsAppMessage);
    final uri = Uri.parse('https://wa.me/$_countryCode$phoneNumber?text=$message');
    if (!await canLaunchUrl(uri)) return;
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Future<void> openMaps(String address) async {
    final query = Uri.encodeComponent(address);
    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$query',
    );
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}