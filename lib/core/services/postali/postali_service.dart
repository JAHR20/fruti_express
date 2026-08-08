// core/services/postali/postali_service.dart

import 'postali_models.dart';

abstract class PostaliService {
  /// GET /cp/{codigo} — municipio, estado y colonias de un C.P.
  /// Devuelve null si el C.P. no existe o hay error de red.
  Future<PostaliCp?> consultarCp(String codigoPostal);

  /// GET /municipio/{estadoSlug}/{municipioSlug}
  /// Devuelve todos los C.P. únicos del municipio para el selector de cobertura.
  Future<PostaliMunicipio?> obtenerMunicipio({
    required String estadoSlug,
    required String municipioSlug,
  });
}