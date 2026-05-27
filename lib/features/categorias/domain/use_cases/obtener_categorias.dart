import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/entities/categoria.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/repositories/categoria_repositorie.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';

class ObtenerCategorias {
  final CategoriaRepository repository;

  ObtenerCategorias(this.repository);

  /// Obtiene la lista de categorías.
  /// [padreId]: Si se proporciona, solo trae las subcategorías de ese padre.
  ResultTask<List<Categoria>> ejecutar({
    required Perfil usuarioActual,
    String? padreId,
  }) {
    return TaskEither.Do(($) async {
      // 🛡️ 1. Validación de seguridad: Solo el staff puede ver el catálogo en el Admin
      if (!usuarioActual.esStaff) {
        return await $(
          TaskEither<Failure, List<Categoria>>.left(
            const Failure.unauthorized(
              "No tienes permisos para consultar el catálogo.",
            ),
          ),
        );
      }

      // 🟢 2. Si hay un padreId, pedimos subcategorías específicas
      if (padreId != null && padreId.isNotEmpty) {
        return await $(repository.obtenerPorCategoriaPadre(padreId));
      }

      // 🔵 3. Si no hay padreId, traemos todas (o solo las principales, según tu lógica)
      // En un Admin Dashboard, generalmente quieres ver la lista completa para gestionar.
      return await $(repository.obtenerTodas());
    });
  }
}
