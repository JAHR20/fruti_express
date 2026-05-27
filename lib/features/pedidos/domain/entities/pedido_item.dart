import 'package:freezed_annotation/freezed_annotation.dart';

part 'pedido_item.freezed.dart';
part 'pedido_item.g.dart';

@freezed
abstract class PedidoItem with _$PedidoItem {
  const factory PedidoItem({
    required String id,
    required String pedidoId,
    required String productoId,
    required String nombreProductoSnapshot,
    required int cantidad,
    required int precioUnitarioSnapshot,
  }) = _PedidoItem;

  factory PedidoItem.fromJson(Map<String, dynamic> json) =>
      _$PedidoItemFromJson(json);
}
