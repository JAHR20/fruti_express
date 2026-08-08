// core/services/postali/postali_service_impl.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'postali_service.dart';
import 'postali_models.dart';

class PostaliServiceImpl implements PostaliService {
  static const _baseUrl = 'https://postali.app/api/v1/mx';
  final http.Client _client;

  PostaliServiceImpl({http.Client? client})
      : _client = client ?? http.Client();

  @override
  Future<PostaliCp?> consultarCp(String codigoPostal) async {
    final cp = codigoPostal.trim();
    if (cp.length != 5) return null;

    try {
      final response = await _client
          .get(Uri.parse('$_baseUrl/cp/$cp'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 404) return null;
      if (response.statusCode != 200) return null;

      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return PostaliCp.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<PostaliMunicipio?> obtenerMunicipio({
    required String estadoSlug,
    required String municipioSlug,
  }) async {
    try {
      final url = '$_baseUrl/municipio/$estadoSlug/$municipioSlug';
      final response = await _client
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 15));

      if (response.statusCode == 404) return null;
      if (response.statusCode != 200) return null;

      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return PostaliMunicipio.fromJson(json);
    } catch (_) {
      return null;
    }
  }
}