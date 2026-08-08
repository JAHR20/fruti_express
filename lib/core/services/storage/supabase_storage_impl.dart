import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'storage_service.dart';

class SupabaseStorageImpl implements StorageService {
  final SupabaseClient _supabaseClient;

  SupabaseStorageImpl(this._supabaseClient);

  @override
  Future<String> uploadImage({
    required XFile file,
    required String bucketName,
    required String pathName,
  }) async {
    try {
      final fileBytes = await file.readAsBytes();
      final fileExt = file.name.split('.').last;
      // Creamos un nombre único para el archivo usando el path y la extensión
      final fileName = '$pathName.$fileExt';

      // 1. Subimos el archivo al bucket
      await _supabaseClient.storage.from(bucketName).uploadBinary(
            fileName,
            fileBytes,
            fileOptions: FileOptions(
              cacheControl: '3600',
              upsert: true, // Si ya existe, lo reemplaza
              contentType: 'image/$fileExt',
            ),
          );

      // 2. Obtenemos y retornamos la URL pública
      final String publicUrl = _supabaseClient.storage
          .from(bucketName)
          .getPublicUrl(fileName);

      return publicUrl;
    } catch (e) {
      throw Exception('Error al subir la imagen a Supabase Storage: $e');
    }
  }

  @override
  Future<void> deleteImage({
    required String bucketName,
    required String pathName,
  }) async {
    try {
      await _supabaseClient.storage.from(bucketName).remove([pathName]);
    } catch (e) {
      throw Exception('Error al borrar la imagen de Supabase Storage: $e');
    }
  }
}