import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/enums/unidad_medida_producto.dart';

part 'producto_model.freezed.dart';
part 'producto_model.g.dart';

@freezed
abstract class ProductoModel with _$ProductoModel {
  const factory ProductoModel({
    String? id,
    @JsonKey(name: 'categoria_id') required String categoriaId,
    required String nombre,
    String? descripcion,
    @JsonKey(name: 'precio_actual') required int precioActual,
    @JsonKey(name: 'precio_comparacion') int? precioComparacion,
    @JsonKey(name: 'unidad_medida') required UnidadMedida unidadMedida,
    @JsonKey(name: 'imagen_url') String? imagenUrl,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'fecha_creacion') required DateTime fechaCreacion,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
   @JsonKey(readValue: _leerStock, includeToJson: false)
    @Default(0) int stock,
  }) = _ProductoModel;

  factory ProductoModel.fromJson(Map<String, dynamic> json) =>
      _$ProductoModelFromJson(json);
}

extension ProductoModelX on ProductoModel {
  Producto toDomain() => Producto(
    id: id,
    categoriaId: categoriaId,
    nombre: nombre,
    descripcion: descripcion,
    precioActual: precioActual,
    precioComparacion: precioComparacion,
    unidadMedida: unidadMedida,
    imagenUrl: imagenUrl,
    isActive: isActive,
    fechaCreacion: fechaCreacion,
    updatedAt: updatedAt,
    stock: stock,
  );

  static ProductoModel fromDomain(Producto p) => ProductoModel(
    id: p.id,
    categoriaId: p.categoriaId,
    nombre: p.nombre,
    descripcion: p.descripcion,
    precioActual: p.precioActual,
    precioComparacion: p.precioComparacion,
    unidadMedida: p.unidadMedida,
    imagenUrl: p.imagenUrl,
    isActive: p.isActive,
    fechaCreacion: p.fechaCreacion,
    updatedAt: p.updatedAt,
  );
}

int _leerStock(Map<dynamic, dynamic> json, String key) {

  final inventario = json['inventario'];
  
  if (inventario is List && inventario.isNotEmpty) {
    return inventario.first['stock_disponible'] ?? 0;
  } 
  else if (inventario is Map) {
    return inventario['stock_disponible'] ?? 0;
  }
  
  return json['stock_disponible'] ?? 0;
}