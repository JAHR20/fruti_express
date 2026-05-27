import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/entities/categoria.dart';

abstract class CategoriaRepository {
  // --- ✍️ ESCRITURA ---
  ResultTask<Categoria> crear(Categoria categoria);
  ResultTask<Categoria> actualizar(Categoria categoria);
  ResultTask<Unit> desactivar(String id);

  // --- 🔍 CONSULTAS ---
  ResultTask<Categoria?> obtenerPorId(String id);
  ResultTask<Categoria?> obtenerPorNombre(String nombre);
  ResultTask<List<Categoria>> obtenerTodas();
  ResultTask<List<Categoria>> obtenerPorCategoriaPadre(String padreId);

  // --- 📡 REACTIVIDAD ---
  ResultStream<List<Categoria>> watchTodas();
}
