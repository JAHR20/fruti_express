import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/entities/categoria.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/repositories/categoria_repositorie.dart';

class ObtenerCategorias {
  final CategoriaRepository repository;

  ObtenerCategorias(this.repository);

  ResultTask<List<Categoria>> ejecutar({String? padreId}) {
    return TaskEither.Do(($) async {
      if (padreId != null && padreId.isNotEmpty) {
        return await $(repository.obtenerPorCategoriaPadre(padreId));
      }
      return await $(repository.obtenerTodas());
    });
  }
}