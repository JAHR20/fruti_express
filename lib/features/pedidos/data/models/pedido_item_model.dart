import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/core/utils/unidad_medida_converter.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/enums/unidad_medida_producto.dart';
import '../../domain/entities/pedido_item.dart';

part 'pedido_item_model.freezed.dart';
part 'pedido_item_model.g.dart';

@freezed
abstract class PedidoItemModel with _$PedidoItemModel {
  const factory PedidoItemModel({
    required String id,
    @JsonKey(name: 'pedido_id') required String pedidoId,
    @JsonKey(name: 'producto_id') required String productoId,
    @JsonKey(name: 'nombre_producto_snapshot') required String nombreProductoSnapshot,
    required int cantidad,
    @JsonKey(name: 'precio_unitario_snapshot') required int precioUnitarioSnapshot,
    @UnidadMedidaConverter() 
    @JsonKey(name: 'unidad_medida') UnidadMedida? unidadMedida,
  }) = _PedidoItemModel;

  factory PedidoItemModel.fromJson(Map<String, dynamic> json) =>
      _$PedidoItemModelFromJson(json);
}

extension PedidoItemModelX on PedidoItemModel {
  PedidoItem toDomain() => PedidoItem(
    id: id,
    pedidoId: pedidoId,
    productoId: productoId,
    nombreProductoSnapshot: nombreProductoSnapshot,
    cantidad: cantidad,
    precioUnitarioSnapshot: precioUnitarioSnapshot,
    unidadMedida: unidadMedida,
  );

  static PedidoItemModel fromDomain(PedidoItem item) => PedidoItemModel(
    id: item.id,
    pedidoId: item.pedidoId,
    productoId: item.productoId,
    nombreProductoSnapshot: item.nombreProductoSnapshot,
    cantidad: item.cantidad,
    precioUnitarioSnapshot: item.precioUnitarioSnapshot,
    unidadMedida: item.unidadMedida,
  );
}