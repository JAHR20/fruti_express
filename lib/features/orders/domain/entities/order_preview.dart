
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_preview.freezed.dart';

@freezed
abstract class OrderPreview with _$OrderPreview {
  const factory OrderPreview({
    required int subtotal,
    required int shippingCost,
    required int discount,
    required int total,
  }) = _OrderPreview;
}