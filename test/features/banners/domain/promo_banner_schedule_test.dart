// test/features/banners/domain/promo_banner_schedule_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:fruti_express_jahr_admin/features/banners/data/models/promo_banner_model.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/promo_banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_schedule_status.dart';

PromoBanner _banner({
  bool isActive = true,
  DateTime? startsAt,
  DateTime? endsAt,
}) {
  return PromoBanner(
    id: '1',
    title: 'Ofertas',
    discount: '15%',
    subtitle: 'En frutas',
    startColor: '#0C700F',
    endColor: '#F9A826',
    isActive: isActive,
    sortOrder: 0,
    createdAt: DateTime(2026, 11, 1),
    startsAt: startsAt,
    endsAt: endsAt,
  );
}

void main() {
  final now = DateTime(2026, 11, 25, 12);
  final yesterday = now.subtract(const Duration(days: 1));
  final tomorrow = now.add(const Duration(days: 1));

  group('PromoBanner (programación)', () {
    test('sin fechas se muestra siempre', () {
      final banner = _banner();

      expect(banner.scheduleStatusAt(now), BannerScheduleStatus.always);
      expect(banner.isVisibleAt(now), isTrue);
    });

    test('con inicio en el futuro está programado y no se muestra', () {
      final banner = _banner(startsAt: tomorrow);

      expect(banner.scheduleStatusAt(now), BannerScheduleStatus.scheduled);
      expect(banner.isVisibleAt(now), isFalse);
    });

    test('con fin en el pasado está vencido y no se muestra', () {
      final banner = _banner(endsAt: yesterday);

      expect(banner.scheduleStatusAt(now), BannerScheduleStatus.expired);
      expect(banner.isVisibleAt(now), isFalse);
    });

    test('dentro de su ventana se muestra', () {
      final banner = _banner(startsAt: yesterday, endsAt: tomorrow);

      expect(banner.scheduleStatusAt(now), BannerScheduleStatus.live);
      expect(banner.isVisibleAt(now), isTrue);
    });

    test('el instante exacto del fin ya cuenta como vencido', () {
      final banner = _banner(startsAt: yesterday, endsAt: now);

      expect(banner.scheduleStatusAt(now), BannerScheduleStatus.expired);
    });

    test('apagado no se muestra aunque esté dentro de su ventana', () {
      final banner = _banner(
        isActive: false,
        startsAt: yesterday,
        endsAt: tomorrow,
      );

      expect(banner.isVisibleAt(now), isFalse);
    });
  });

  group('PromoBannerModel (fechas)', () {
    test('las fechas se envían en UTC para que la base de datos no las desfase', () {
      final json = PromoBannerModelX.fromDomain(
        _banner(
          startsAt: DateTime(2026, 11, 28, 18, 30),
          endsAt: DateTime(2026, 11, 30, 23, 59),
        ),
      ).toJson();

      expect(json['starts_at'] as String, endsWith('Z'));
      expect(json['ends_at'] as String, endsWith('Z'));
    });

    test('sin fechas se envía null para poder quitar una programación', () {
      final json = PromoBannerModelX.fromDomain(_banner()).toJson();

      expect(json.containsKey('starts_at'), isTrue);
      expect(json['starts_at'], isNull);
      expect(json['ends_at'], isNull);
    });
  });
}