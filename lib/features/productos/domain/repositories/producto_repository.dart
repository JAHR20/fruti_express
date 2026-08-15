import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';

abstract class ProductoRepository {
  ResultTask<Producto> crear(Producto producto);
  ResultTask<Producto> actualizar(Producto producto);
  ResultTask<Producto> obtenerPorId(String id);
  ResultTask<Producto> obtenerPorNombre(String nombre);
  ResultTask<bool> existePorNombre(String nombre);
  ResultTask<List<Producto>> obtenerTodos();
  ResultTask<List<Producto>> obtenerPorCategoria(String categoriaId, String sucursalId);
  ResultTask<List<Producto>> buscarProductos(String query, String sucursalId);
  ResultTask<Unit> eliminar(String id);
  ResultTask<String> subirImagen(File archivo, String nombreArchivo);
  ResultTask<List<Producto>> obtenerPorSucursal(String sucursalId);
}
