import 'package:fruti_express_jahr_admin/features/cart/domain/entities/cart_item.dart';

abstract class CartRepository {
  
  Future<List<CartItem>> getCart(); 

  Future<void> saveCart(List<CartItem> cart); 

  Future<void> clearCart(); 
}