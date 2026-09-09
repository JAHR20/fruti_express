import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/services/storage/storage_service.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:image_picker/image_picker.dart';

class UploadCategoryImageUseCase {
  final StorageService storageService;

  UploadCategoryImageUseCase(this.storageService);

  ResultTask<String> execute({
    required XFile file,
    required String uniqueIdentifier,
  }) {
    return TaskEither.tryCatch(
      () async {
        final timestamp = DateTime.now().millisecondsSinceEpoch;
        final String bucketname = 'categories';
        final cleanName =
            uniqueIdentifier.replaceAll(' ', '_').toLowerCase();
        final uniquePath = '${cleanName}_$timestamp.jpg';

        return await storageService.uploadImage(
          file: file,
          bucketName: bucketname,
          pathName: uniquePath,
        );
      },
      (error, stackTrace) =>
          error is Failure ? error : Failure.server(FailureCode.genericError),
    );
  }
}