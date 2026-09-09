import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/repositories/product_repository.dart';

class UploadProductImageUseCase {
  final ProductRepository repository;

  UploadProductImageUseCase({required this.repository});

  ResultTask<String> execute(File file, String fileName) {
    final cleanFileName = fileName.trim();

    return TaskEither.Do(($) async {
      if (cleanFileName.isEmpty) {
        return await $(
          TaskEither.left(const Failure.validation(FailureCode.invalidFileName)),
        );
      }
      
      final url = await $(repository.uploadImage(file, cleanFileName));
      return url;
    });
  }
}