import 'package:image_picker/image_picker.dart'; 

abstract class StorageService {
  Future<String> uploadImage({
    required XFile file,
    required String bucketName,
    required String pathName,
  });

  Future<void> deleteImage({
    required String bucketName,
    required String pathName,
  });
}