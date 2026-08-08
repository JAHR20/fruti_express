import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/repositories/banner_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';

class EliminarBanner {
  final BannerRepository _repository;
  EliminarBanner(this._repository);

  ResultTask<Unit> ejecutar({
    required Perfil usuarioActual,
    required String id,
  }) {
    return TaskEither.Do(($) async {
      if (!usuarioActual.esAdmin) { // ← solo Admin puede eliminar
        return await $(TaskEither.left(
          const Failure.unauthorized("Solo el administrador puede eliminar banners."),
        ));
      }
      return await $(_repository.eliminar(id));
    });
  }
}