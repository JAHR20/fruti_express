import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/repositories/banner_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';

class CrearBanner {
  final BannerRepository _repository;
  CrearBanner(this._repository);

  ResultTask<Banner> ejecutar({
    required Perfil usuarioActual,
    required Banner banner,
    File? imagenArchivo,
  }) {
    return TaskEither.Do(($) async {
      // 1. Validar permisos
      if (!usuarioActual.esStaff) {
        return await $(TaskEither.left(
          const Failure.unauthorized("No tienes permisos para crear banners."),
        ));
      }

      String? imageUrlFinal = banner.imagenUrl;

      // 2. Si hay imagen, la subimos primero
      if (imagenArchivo != null) {
        final extensionReal = imagenArchivo.path.split('.').last.toLowerCase();
        final nombreUnico = 'banner_${DateTime.now().millisecondsSinceEpoch}.$extensionReal';

        // El '$' extrae la URL automáticamente o detiene todo si hay error
        final url = await $(_repository.subirImagen(imagenArchivo, nombreUnico));
        imageUrlFinal = url;
      }

      // 3. Empaquetamos la nueva URL en el banner
      final bannerFinal = banner.copyWith(imagenUrl: imageUrlFinal);

      // 4. Guardamos en la base de datos
      return await $(_repository.crear(bannerFinal));
    });
  }
}