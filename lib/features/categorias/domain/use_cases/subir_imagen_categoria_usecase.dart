import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/services/storage/storage_service.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:image_picker/image_picker.dart';

class SubirImagenCategoria {
  final StorageService storageService;

  SubirImagenCategoria(this.storageService);

  ResultTask<String> ejecutar({
    required XFile archivo,
    required String identificadorUnico,
  }) {
    return TaskEither.tryCatch(
      () async {
        final timestamp = DateTime.now().millisecondsSinceEpoch;
        final nombreLimpio =
            identificadorUnico.replaceAll(' ', '_').toLowerCase();
        final pathUnico = '${nombreLimpio}_$timestamp.jpg';

        return await storageService.uploadImage(
          file: archivo,
          bucketName: 'categorias',
          pathName: pathUnico,
        );
      },
      (error, stackTrace) =>
          error is Failure ? error : Failure.server(error.toString()),
    );
  }
}