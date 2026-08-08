// features/pedidos/domain/services/contacto_service.dart

abstract class ContactoService {
  /// Abre el marcador telefónico con el [telefono] del cliente.
  Future<void> llamar(String telefono);

  /// Abre WhatsApp con un mensaje predefinido al [telefono] del cliente.
  Future<void> abrirWhatsApp(String telefono);

  /// Abre Google Maps con la [direccion] como destino de búsqueda.
  Future<void> abrirMaps(String direccion);
}