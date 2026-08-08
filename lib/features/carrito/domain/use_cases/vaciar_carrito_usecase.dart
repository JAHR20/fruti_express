import 'package:fruti_express_jahr_admin/features/carrito/domain/repositories/carrito_repository.dart';

class VaciarCarritoUseCase {
  final CarritoRepository repository;

  VaciarCarritoUseCase(this.repository);

  Future<void> call() async {
    return await repository.vaciarCarrito();
  }
}