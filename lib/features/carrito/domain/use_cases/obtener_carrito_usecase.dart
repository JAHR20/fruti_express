import 'package:fruti_express_jahr_admin/features/carrito/domain/entities/carrito_item.dart';
import 'package:fruti_express_jahr_admin/features/carrito/domain/repositories/carrito_repository.dart';

class ObtenerCarritoUseCase {
  final CarritoRepository repository;

  ObtenerCarritoUseCase(this.repository);

  Future<List<CarritoItem>> call() async {
    return await repository.obtenerCarrito();
  }
}