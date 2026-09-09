import 'package:fruti_express_jahr_admin/features/cart/domain/repositories/cart_repository.dart';

class ClearCartUseCase {
  final CartRepository _repository;

  ClearCartUseCase(this._repository);

  Future<void> execute() async {
    return await _repository.clearCart();
  }
}