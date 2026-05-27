import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'image_repository.dart';

class CloudinaryImageRepositoryImpl implements ImageRepository {
  final String cloudName = String.fromEnvironment('CLOUDINARY_CLOUD_NAME');
  final String uploadPreset = String.fromEnvironment(
    'CLOUDINARY_UPLOAD_PRESET',
  );

  @override
  Future<String?> uploadImage(File file) async {
    final url = Uri.parse(
      'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
    );

    try {
      final request = http.MultipartRequest('POST', url)
        ..fields['upload_preset'] = uploadPreset
        ..files.add(await http.MultipartFile.fromPath('file', file.path));

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.toBytes();
        final jsonRes = jsonDecode(utf8.decode(responseData));
        return jsonRes['secure_url'];
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
