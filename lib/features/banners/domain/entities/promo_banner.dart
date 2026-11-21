import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_style_config.dart';

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
    BannerStyleConfig? styleConfig,
    required bool isActive, 
    required int sortOrder, 
    required DateTime createdAt, 
  }) = _PromoBanner;
}