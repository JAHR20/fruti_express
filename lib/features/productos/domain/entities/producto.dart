import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/enums/unidad_medida_producto.dart';

part 'producto.freezed.dart';

@freezed
abstract class Producto with _$Producto {
  const Producto._();
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
    DateTime? updatedAt,
    @Default(0) int stock,
  }) = _Producto;

  bool get tieneDescuento => 
      precioComparacion != null && precioComparacion! > precioActual;
      
  /// Calcula el porcentaje exacto de descuento para los badges
  int get porcentajeDescuento {
    if (!tieneDescuento) return 0;
    
    final calculo = (1 - (precioActual / precioComparacion!)) * 100;
    return calculo.round();
  }

}

