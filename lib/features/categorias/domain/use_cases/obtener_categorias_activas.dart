import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/entities/categoria.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/repositories/categoria_repositorie.dart';

class ObtenerCategoriasActivas {
  final CategoriaRepository _repository;
  ObtenerCategoriasActivas(this._repository);

  ResultTask<List<Categoria>> ejecutar() => _repository.obtenerActivas();
}