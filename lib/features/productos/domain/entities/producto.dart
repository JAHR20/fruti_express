import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/enums/unidad_medida_producto.dart';

part 'producto.freezed.dart';
part 'producto.g.dart';

@freezed
abstract class Producto with _$Producto {
  const factory Producto({
    String? id,
    required String categoriaId,
    required String nombre,
    String? descripcion,
    required int precioActual,
    int? precioComparacion,
    required UnidadMedida unidadMedida,
    String? imagenUrl,
    required bool isActive,
    required DateTime fechaCreacion,
  }) = _Producto;

  factory Producto.fromJson(Map<String, dynamic> json) =>
      _$ProductoFromJson(json);
}
