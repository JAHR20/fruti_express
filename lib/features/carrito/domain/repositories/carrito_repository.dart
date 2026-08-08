import 'package:fruti_express_jahr_admin/features/carrito/domain/entities/carrito_item.dart';

abstract class CarritoRepository {

  Future<List<CarritoItem>> obtenerCarrito();

  Future<void> guardarCarrito(List<CarritoItem> carrito);

  Future<void> vaciarCarrito();
}