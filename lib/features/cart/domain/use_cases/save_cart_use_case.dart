import 'package:fruti_express_jahr_admin/features/cart/domain/entities/cart_item.dart';
import 'package:fruti_express_jahr_admin/features/cart/domain/repositories/cart_repository.dart';

class SaveCartUseCase {
  final CartRepository _repository;

  SaveCartUseCase(this._repository);

  Future<void> execute(List<CartItem> cart) async {
    final validCart = cart.where((item) => item.quantity > 0).toList();
    return await _repository.saveCart(validCart);
  }
}