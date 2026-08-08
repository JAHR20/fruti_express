import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/enums/unidad_medida_producto.dart';


part 'carrito_item.freezed.dart';
part 'carrito_item.g.dart'; 

@freezed
abstract class CarritoItem with _$CarritoItem {
  const CarritoItem._();

  const factory CarritoItem({
    required String productoId,
    required String nombre,
    String? imagenUrl,
    required int precioUnitario,
    required int cantidad,
    required UnidadMedida unidadMedida,
    required String sucursalId,
  }) = _CarritoItem;

  factory CarritoItem.fromJson(Map<String, dynamic> json) => 
      _$CarritoItemFromJson(json);


  int get subtotal {
    if (unidadMedida == UnidadMedida.gramo || unidadMedida == UnidadMedida.mililitro) {
      return ((cantidad / 1000) * precioUnitario).round();
    }
    return cantidad * precioUnitario;
  }
}