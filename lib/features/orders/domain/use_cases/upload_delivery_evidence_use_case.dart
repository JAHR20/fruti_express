import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/services/storage/storage_service.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:image_picker/image_picker.dart';

class UploadDeliveryEvidenceUseCase {
  final StorageService storageService;

  UploadDeliveryEvidenceUseCase(this.storageService);

  ResultTask<String> execute({
    required String photoPath,
    required String orderId,
  }) {
    return TaskEither.tryCatch(
      () async {
        return await storageService.uploadImage(
          file: XFile(photoPath),
          bucketName: 'evidencias-entrega',
          pathName: 'evidencias/$orderId',
        );
      },
      (error, stackTrace) => error is Failure
          ? error
          : Failure.server(
              FailureCode.genericError,
              params: {'detail': error.toString()},
            ),
    );
  }
}