import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/entities/categoria.dart';

abstract class CategoriaRepository {
  ResultTask<Categoria> crear(Categoria categoria);
  ResultTask<Categoria> actualizar(Categoria categoria);
  ResultTask<Unit> cambiarEstado(String id, bool nuevoEstado);

  ResultTask<Categoria?> obtenerPorId(String id);
  ResultTask<Categoria?> obtenerPorNombre(String nombre);
  ResultTask<List<Categoria>> obtenerTodas();
  ResultTask<List<Categoria>> obtenerActivas();
  ResultTask<List<Categoria>> obtenerPorCategoriaPadre(String padreId);

  ResultStream<List<Categoria>> watchTodas();
}
