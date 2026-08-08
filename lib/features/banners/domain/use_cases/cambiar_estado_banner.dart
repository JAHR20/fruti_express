import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/repositories/banner_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';

class CambiarEstadoBanner {
  final BannerRepository _repository;
  CambiarEstadoBanner(this._repository);

  ResultTask<Unit> ejecutar({
    required Perfil usuarioActual,
    required String id,
    required bool activo,
  }) {
    return TaskEither.Do(($) async {
      if (!usuarioActual.esStaff) {
        return await $(TaskEither.left(
          const Failure.unauthorized("No tienes permisos."),
        ));
      }
      return await $(_repository.cambiarEstado(id, activo));
    });
  }
}