// features/pedidos/domain/services/contacto_service.dart

abstract class ContactoService {
  Future<void> llamar(String telefono);
  Future<void> abrirWhatsApp(String telefono);
  Future<void> abrirMaps(String direccion);
}