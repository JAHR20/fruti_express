import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fruti_express_jahr_admin/features/carrito/domain/entities/carrito_item.dart';
import 'package:fruti_express_jahr_admin/features/carrito/data/datasources/carrito_local_datasource.dart';

class CarritoLocalDatasourceImpl implements CarritoLocalDatasource {
  final SharedPreferences sharedPreferences;
  static const String _carritoKey = 'CACHE_CARRITO_FRUTI_EXPRESS';

  CarritoLocalDatasourceImpl({required this.sharedPreferences});

  @override
  Future<List<CarritoItem>> obtenerCarrito() async {
    final jsonString = sharedPreferences.getString(_carritoKey);
    
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((json) => CarritoItem.fromJson(json)).toList();
    }
    
    return []; 
  }

  @override
  Future<void> guardarCarrito(List<CarritoItem> carrito) async {
    final List<Map<String, dynamic>> jsonList = carrito.map((item) => item.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await sharedPreferences.setString(_carritoKey, jsonString);
  }

  @override
  Future<void> vaciarCarrito() async {
    await sharedPreferences.remove(_carritoKey);
  }
}