// lib/features/banners/domain/entities/promo_banner.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_style_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_schedule_status.dart';

part 'promo_banner.freezed.dart';

/// México (America/Mexico_City) no usa horario de verano desde 2022: siempre UTC-6.
/// Los días de la semana de los banners se cuentan con esta hora, igual que en la
/// base de datos (función `banner_today_isodow`).
const _mexicoOffset = Duration(hours: 6);

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
    // Días de la semana en que se muestra (1 = lunes ... 7 = domingo, hora de
    // México). Vacío = todos los días. Los días los decide el servidor.
    @Default(<int>[]) List<int> weekdays,
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

  /// Cierto si, con sus fechas y sus días de la semana, el banner jamás se
  /// mostrará: por ejemplo, del lunes 1 al martes 2 pero solo los viernes.
  /// Solo se evalúa cuando hay días marcados y las dos fechas; con una fecha
  /// abierta siempre llegará algún día que coincida.
  bool get neverShows {
    if (weekdays.isEmpty || startsAt == null || endsAt == null) return false;

    DateTime mexicoDay(DateTime instant) {
      final shifted = instant.toUtc().subtract(_mexicoOffset);
      return DateTime.utc(shifted.year, shifted.month, shifted.day);
    }

    // La fecha de fin no se incluye: el último instante visible es justo antes.
    final first = mexicoDay(startsAt!);
    final last = mexicoDay(endsAt!.subtract(const Duration(microseconds: 1)));

    final days = last.difference(first).inDays;
    if (days < 0) return true;

    // Con 7 días seguidos ya pasó cada día de la semana.
    final span = days > 6 ? 6 : days;
    for (var i = 0; i <= span; i++) {
      if (weekdays.contains(first.add(Duration(days: i)).weekday)) return false;
    }
    return true;
  }

  /// Un cliente lo ve solo si está activo Y dentro de su ventana de fechas.
  /// Los días de la semana no se evalúan aquí: la base de datos solo entrega
  /// los banners que tocan hoy.
  bool isVisibleAt(DateTime now) {
    if (!isActive) return false;
    final status = scheduleStatusAt(now);
    return status == BannerScheduleStatus.always ||
        status == BannerScheduleStatus.live;
  }
}