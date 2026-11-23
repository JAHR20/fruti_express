
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_style_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_schedule_status.dart';

part 'promo_banner.freezed.dart';

@freezed
abstract class PromoBanner with _$PromoBanner {
  const PromoBanner._();

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
    // Ventana en la que se muestra a los clientes (null = sin límite).
    DateTime? startsAt,
    DateTime? endsAt,
  }) = _PromoBanner;

  /// Estado según las fechas, sin considerar el interruptor `isActive`.
  BannerScheduleStatus scheduleStatusAt(DateTime now) {
    if (startsAt == null && endsAt == null) return BannerScheduleStatus.always;
    if (startsAt != null && startsAt!.isAfter(now)) {
      return BannerScheduleStatus.scheduled;
    }
    if (endsAt != null && !endsAt!.isAfter(now)) {
      return BannerScheduleStatus.expired;
    }
    return BannerScheduleStatus.live;
  }

  /// Un cliente lo ve solo si está activo Y dentro de su ventana.
  bool isVisibleAt(DateTime now) {
    if (!isActive) return false;
    final status = scheduleStatusAt(now);
    return status == BannerScheduleStatus.always ||
        status == BannerScheduleStatus.live;
  }
}