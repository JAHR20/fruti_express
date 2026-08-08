import 'dart:io';

import 'package:fruti_express_jahr_admin/features/productos/data/models/producto_model.dart';

abstract class ProductoRemoteDatasource {
  Future<List<ProductoModel>> obtenerTodos();
  Future<List<ProductoModel>> obtenerPorCategoria(String categoriaId, String sucursalId);
  Future<ProductoModel?> obtenerPorId(String id);
  Future<ProductoModel?> obtenerPorNombre(String nombre);
  Future<bool> existePorNombre(String nombre);
  Future<List<ProductoModel>> buscarProductos(String query, String sucursalId);
  Future<ProductoModel> crear(ProductoModel model);
  Future<ProductoModel> actualizar(ProductoModel model);
  Future<String> subirImagen(File archivo, String nombreArchivo);
  Future<void> eliminar(String id); // Recordamos: Soft Delete (activa: false)
  Future<List<ProductoModel>> obtenerPorSucursal(String sucursalId);
}
