import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/core/utils/formateador_unidades.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/enums/unidad_medida_producto.dart';

part 'pedido_item.freezed.dart';

@freezed
abstract class PedidoItem with _$PedidoItem {
  const factory PedidoItem({
    required String id,
    required String pedidoId,
    required String productoId,
    required String nombreProductoSnapshot,
    required int cantidad,
    required int precioUnitarioSnapshot,
    UnidadMedida? unidadMedida, // cambiat a enum unidad medida
  }) = _PedidoItem;
}


extension PedidoItemLogica on PedidoItem {
  // 1. Lógica matemática 100% segura usando tipado fuerte
  int get subtotalCalculado {
    final esAgranel = unidadMedida == UnidadMedida.gramo || unidadMedida == UnidadMedida.mililitro;
    final factor = esAgranel ? (cantidad / 1000) : cantidad.toDouble();
    return (factor * precioUnitarioSnapshot).round();
  }

  // 2. Lógica de presentación delegada directamente al Enum
  String get cantidadFormateada {
    return unidadMedida != null 
        ? unidadMedida!.formatear(cantidad) 
        : '$cantidad';
  }
}