import 'package:fruti_express_jahr_admin/features/cart/domain/entities/cart_item.dart';
import 'package:fruti_express_jahr_admin/features/cart/domain/repositories/cart_repository.dart';
import 'package:fruti_express_jahr_admin/features/cart/data/datasources/cart_local_datasource.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource localDataSource;

  CartRepositoryImpl({required this.localDataSource});

  @override
  Future<List<CartItem>> getCart() async {
    try {
      return await localDataSource.getCart();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> saveCart(List<CartItem> cart) async {
    await localDataSource.saveCart(cart);
  }

  @override
  Future<void> clearCart() async {
    await localDataSource.clearCart();
  }
}