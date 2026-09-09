import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fruti_express_jahr_admin/features/cart/domain/entities/cart_item.dart';
import 'package:fruti_express_jahr_admin/features/cart/data/datasources/cart_local_datasource.dart';

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final SharedPreferences sharedPreferences;
  
  static const String _cartKey = 'FRUTI_EXPRESS_CART_CACHE'; 

  CartLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<CartItem>> getCart() async {
    final jsonString = sharedPreferences.getString(_cartKey);
    
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((json) => CartItem.fromJson(json)).toList();
    }
    
    return []; 
  }

  @override
  Future<void> saveCart(List<CartItem> cart) async {
    final List<Map<String, dynamic>> jsonList = cart.map((item) => item.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await sharedPreferences.setString(_cartKey, jsonString);
  }

  @override
  Future<void> clearCart() async {
    await sharedPreferences.remove(_cartKey);
  }
}