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
  Future<PostaliPostalCode?> fetchPostalCode(String postalCode) async {
    final cleanCp = postalCode.trim();
    if (cleanCp.length != 5) return null;

    try {
      final response = await _client
          .get(Uri.parse('$_baseUrl/cp/$cleanCp'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 404) return null;
      if (response.statusCode != 200) return null;

      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return PostaliPostalCode.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<PostaliMunicipality?> fetchMunicipality({
    required String stateSlug,
    required String municipalitySlug,
  }) async {
    try {
      final url = '$_baseUrl/municipio/$stateSlug/$municipalitySlug';
      final response = await _client
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 15));

      if (response.statusCode == 404) return null;
      if (response.statusCode != 200) return null;

      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return PostaliMunicipality.fromJson(json);
    } catch (_) {
      return null;
    }
  }
}