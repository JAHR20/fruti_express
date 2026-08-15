import 'package:fruti_express_jahr_admin/features/carrito/domain/entities/carrito_item.dart';
import 'package:fruti_express_jahr_admin/features/carrito/domain/repositories/carrito_repository.dart';

class GuardarCarritoUseCase {
  final CarritoRepository repository;

  GuardarCarritoUseCase(this.repository);
  Future<void> call(List<CarritoItem> carrito) async {
    return await repository.guardarCarrito(carrito);
  }
}