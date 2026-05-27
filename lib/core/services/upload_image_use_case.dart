import 'dart:io';
import 'image_repository.dart';

class UploadImageUseCase {
  final ImageRepository repository;
  UploadImageUseCase(this.repository);

  Future<String?> execute(File file) async {
    // Aquí podrías validar tamaño de imagen, formato, etc.
    return await repository.uploadImage(file);
  }
}
