import 'postali_models.dart';

abstract class PostaliService {
  /// GET /cp/{codigo}
  Future<PostaliPostalCode?> fetchPostalCode(String postalCode);

  /// GET /municipio/{estadoSlug}/{municipioSlug}
  Future<PostaliMunicipality?> fetchMunicipality({
    required String stateSlug,
    required String municipalitySlug,
  });
}