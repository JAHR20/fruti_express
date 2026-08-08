import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner.dart';

abstract class BannerRepository {
  // --- 🔍 CONSULTAS ---
  ResultTask<List<Banner>> obtenerActivos();
  ResultTask<List<Banner>> obtenerTodos(); 
  ResultTask<Banner?> obtenerPorId(String id);

  // --- ✍️ ESCRITURA ---
  ResultTask<Banner> crear(Banner banner);
  ResultTask<Banner> actualizar(Banner banner);
  ResultTask<Unit> cambiarEstado(String id, bool activo);
  ResultTask<Unit> eliminar(String id);
  ResultTask<String> subirImagen(File archivo, String nombreArchivo);
}