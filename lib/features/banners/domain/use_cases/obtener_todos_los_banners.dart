import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/repositories/banner_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';

class ObtenerTodosLosBanners {
  final BannerRepository _repository;
  ObtenerTodosLosBanners(this._repository);

  ResultTask<List<Banner>> ejecutar({required Perfil usuarioActual}) {
    return TaskEither.Do(($) async {
      if (!usuarioActual.esStaff) {
        return await $(TaskEither.left(
          const Failure.unauthorized("No tienes permisos."),
        ));
      }
      return await $(_repository.obtenerTodos());
    });
  }
}