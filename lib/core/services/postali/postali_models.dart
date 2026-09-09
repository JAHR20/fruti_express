class PostaliPostalCode {
  final String postalCode;
  final String state;
  final String stateSlug;
  final String municipality;
  final String municipalitySlug;
  final List<PostaliSettlement> settlements;

  const PostaliPostalCode({
    required this.postalCode,
    required this.state,
    required this.stateSlug,
    required this.municipality,
    required this.municipalitySlug,
    required this.settlements,
  });

  factory PostaliPostalCode.fromJson(Map<String, dynamic> json) => PostaliPostalCode(
        postalCode: json['cp'] as String,
        state: json['estado'] as String,
        stateSlug: json['estado_slug'] as String,
        municipality: json['municipio'] as String,
        municipalitySlug: json['municipio_slug'] as String,
        settlements: (json['asentamientos'] as List)
            .map((a) => PostaliSettlement.fromJson(a))
            .toList(),
      );

  List<String> get neighborhoods => settlements.map((s) => s.name).toList(); 
}

class PostaliSettlement { 
  final String name; 
  final String type; 
  final String? city; 

  const PostaliSettlement({
    required this.name,
    required this.type,
    this.city,
  });

  factory PostaliSettlement.fromJson(Map<String, dynamic> json) =>
      PostaliSettlement(
        name: json['nombre'] as String,
        type: json['tipo'] as String,
        city: json['ciudad'] as String?,
      );
}

class PostaliMunicipality { 
  final String state;
  final String stateSlug;
  final String municipality;
  final String municipalitySlug;
  final int totalSettlements;
  final bool truncated;
  final List<PostaliNeighborhood> neighborhoods; 

  const PostaliMunicipality({
    required this.state,
    required this.stateSlug,
    required this.municipality,
    required this.municipalitySlug,
    required this.totalSettlements,
    required this.truncated,
    required this.neighborhoods,
  });

  factory PostaliMunicipality.fromJson(Map<String, dynamic> json) =>
      PostaliMunicipality(
        state: json['estado'] as String,
        stateSlug: json['estado_slug'] as String,
        municipality: json['municipio'] as String,
        municipalitySlug: json['municipio_slug'] as String,
        totalSettlements: json['total_asentamientos'] as int,
        truncated: json['truncated'] as bool? ?? false,
        neighborhoods: (json['colonias'] as List)
            .map((c) => PostaliNeighborhood.fromJson(c))
            .toList(),
      );

  List<String> get uniquePostalCodes =>
      neighborhoods.map((n) => n.postalCode).toSet().toList()..sort();
}

class PostaliNeighborhood { 
  final String postalCode; 
  final String name; 
  final String type; 
  final String? city; 

  const PostaliNeighborhood({
    required this.postalCode,
    required this.name,
    required this.type,
    this.city,
  });

  factory PostaliNeighborhood.fromJson(Map<String, dynamic> json) =>
      PostaliNeighborhood(
        postalCode: json['cp'] as String,
        name: json['nombre'] as String,
        type: json['tipo'] as String,
        city: json['ciudad'] as String?,
      );
}