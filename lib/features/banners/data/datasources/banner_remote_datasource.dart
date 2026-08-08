import 'dart:io';
import 'package:fruti_express_jahr_admin/features/banners/data/models/banner_model.dart';

abstract class BannerRemoteDatasource {
  Future<List<BannerModel>> obtenerActivos();
  Future<List<BannerModel>> obtenerTodos();
  Future<BannerModel?> obtenerPorId(String id);
  Future<BannerModel> crear(BannerModel model);
  Future<BannerModel> actualizar(BannerModel model);
  Future<void> cambiarEstado(String id, bool activo);
  Future<void> eliminar(String id);
  Future<String> subirImagen(File archivo, String nombreArchivo); // ← para subir imagen opcional
}