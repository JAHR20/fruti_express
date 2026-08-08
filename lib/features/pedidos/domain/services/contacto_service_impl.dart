// features/pedidos/data/services/contacto_service_impl.dart

import 'package:url_launcher/url_launcher.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/services/contacto_service.dart';

class ContactoServiceImpl implements ContactoService {
  static const _codigoPais = '52'; // México
  static const _mensajeWhatsApp =
      '¡Hola! Soy tu repartidor de Fruti Express. '
      'Estoy en camino con tu pedido. 🛵';

  @override
  Future<void> llamar(String telefono) async {
    final uri = Uri(scheme: 'tel', path: telefono);
    if (!await canLaunchUrl(uri)) return;
    await launchUrl(uri);
  }

  @override
  Future<void> abrirWhatsApp(String telefono) async {
    final mensaje = Uri.encodeComponent(_mensajeWhatsApp);
    final uri = Uri.parse('https://wa.me/$_codigoPais$telefono?text=$mensaje');
    if (!await canLaunchUrl(uri)) return;
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Future<void> abrirMaps(String direccion) async {
    final query = Uri.encodeComponent(direccion);
    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$query',
    );
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}