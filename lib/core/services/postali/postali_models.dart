
class PostaliCp {
  final String cp;
  final String estado;
  final String estadoSlug;
  final String municipio;
  final String municipioSlug;
  final List<PostaliAsentamiento> asentamientos;

  const PostaliCp({
    required this.cp,
    required this.estado,
    required this.estadoSlug,
    required this.municipio,
    required this.municipioSlug,
    required this.asentamientos,
  });

  factory PostaliCp.fromJson(Map<String, dynamic> json) => PostaliCp(
        cp: json['cp'] as String,
        estado: json['estado'] as String,
        estadoSlug: json['estado_slug'] as String,
        municipio: json['municipio'] as String,
        municipioSlug: json['municipio_slug'] as String,
        asentamientos: (json['asentamientos'] as List)
            .map((a) => PostaliAsentamiento.fromJson(a))
            .toList(),
      );

  List<String> get colonias => asentamientos.map((a) => a.nombre).toList();
}

class PostaliAsentamiento {
  final String nombre;
  final String tipo;
  final String? ciudad;

  const PostaliAsentamiento({
    required this.nombre,
    required this.tipo,
    this.ciudad,
  });

  factory PostaliAsentamiento.fromJson(Map<String, dynamic> json) =>
      PostaliAsentamiento(
        nombre: json['nombre'] as String,
        tipo: json['tipo'] as String,
        ciudad: json['ciudad'] as String?,
      );
}

class PostaliMunicipio {
  final String estado;
  final String estadoSlug;
  final String municipio;
  final String municipioSlug;
  final int totalAsentamientos;
  final bool truncated;
  final List<PostaliColoniaMunicipio> colonias;

  const PostaliMunicipio({
    required this.estado,
    required this.estadoSlug,
    required this.municipio,
    required this.municipioSlug,
    required this.totalAsentamientos,
    required this.truncated,
    required this.colonias,
  });

  factory PostaliMunicipio.fromJson(Map<String, dynamic> json) =>
      PostaliMunicipio(
        estado: json['estado'] as String,
        estadoSlug: json['estado_slug'] as String,
        municipio: json['municipio'] as String,
        municipioSlug: json['municipio_slug'] as String,
        totalAsentamientos: json['total_asentamientos'] as int,
        truncated: json['truncated'] as bool? ?? false,
        colonias: (json['colonias'] as List)
            .map((c) => PostaliColoniaMunicipio.fromJson(c))
            .toList(),
      );

  List<String> get codigosPostalesUnicos =>
      colonias.map((c) => c.cp).toSet().toList()..sort();
}

class PostaliColoniaMunicipio {
  final String cp;
  final String nombre;
  final String tipo;
  final String? ciudad;

  const PostaliColoniaMunicipio({
    required this.cp,
    required this.nombre,
    required this.tipo,
    this.ciudad,
  });

  factory PostaliColoniaMunicipio.fromJson(Map<String, dynamic> json) =>
      PostaliColoniaMunicipio(
        cp: json['cp'] as String,
        nombre: json['nombre'] as String,
        tipo: json['tipo'] as String,
        ciudad: json['ciudad'] as String?,
      );
}