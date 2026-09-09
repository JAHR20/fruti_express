import 'package:freezed_annotation/freezed_annotation.dart';

part 'promo_banner.freezed.dart';

@freezed
abstract class PromoBanner with _$PromoBanner {
  const factory PromoBanner({
    required String id,
    required String title, 
    required String discount, 
    required String subtitle, 
    required String startColor, 
    required String endColor, 
    String? imageUrl, 
    required bool isActive, 
    required int sortOrder, 
    required DateTime createdAt, 
  }) = _PromoBanner;
}