// test/features/banners/domain/promo_banner_never_shows_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/promo_banner.dart';

// Referencia: el 1 de diciembre de 2026 es martes (1 = lunes ... 7 = domingo).
// Las horas se dan en UTC; la hora de México es UTC-6.
PromoBanner _banner({
  DateTime? startsAt,
  DateTime? endsAt,
  List<int> weekdays = const [],
}) {
  return PromoBanner(
    id: '1',
    title: 'Ofertas',
    discount: '15%',
    subtitle: 'En frutas',
    startColor: '#0C700F',
    endColor: '#F9A826',
    isActive: true,
    sortOrder: 0,
    createdAt: DateTime(2026, 11, 1),
    startsAt: startsAt,
    endsAt: endsAt,
    weekdays: weekdays,
  );
}

void main() {
  // Del martes 1 (00:00 México) al miércoles 2 (23:59 México).
  final startTue = DateTime.utc(2026, 12, 1, 6);
  final endWed = DateTime.utc(2026, 12, 3, 5, 59);

  group('PromoBanner.neverShows', () {
    test('sin días marcados siempre se muestra en algún momento', () {
      expect(_banner(startsAt: startTue, endsAt: endWed).neverShows, isFalse);
    });

    test('con una fecha abierta siempre llegará un día que coincida', () {
      expect(_banner(startsAt: startTue, weekdays: const [5]).neverShows, isFalse);
      expect(_banner(endsAt: endWed, weekdays: const [5]).neverShows, isFalse);
    });

    test('un día marcado que cae dentro del periodo sí se muestra', () {
      final banner = _banner(startsAt: startTue, endsAt: endWed, weekdays: const [3]);

      expect(banner.neverShows, isFalse);
    });

    test('ningún día marcado cae dentro del periodo: nunca se muestra', () {
      // Martes y miércoles, pero solo viernes.
      final banner = _banner(startsAt: startTue, endsAt: endWed, weekdays: const [5]);

      expect(banner.neverShows, isTrue);
    });

    test('un periodo de 7 días siempre contiene cada día de la semana', () {
      final banner = _banner(
        startsAt: startTue,
        endsAt: DateTime.utc(2026, 12, 8, 5, 59),
        weekdays: const [4],
      );

      expect(banner.neverShows, isFalse);
    });

    test('los días se cuentan con la hora de México, no con la de UTC', () {
      // Del martes 1 a las 00:00 México al martes 1 a las 23:00 México.
      // En UTC termina el miércoles 2 a las 05:00, pero en México sigue siendo martes.
      final start = DateTime.utc(2026, 12, 1, 6);
      final end = DateTime.utc(2026, 12, 2, 5);

      expect(_banner(startsAt: start, endsAt: end, weekdays: const [3]).neverShows, isTrue);
      expect(_banner(startsAt: start, endsAt: end, weekdays: const [2]).neverShows, isFalse);
    });

    test('la fecha de fin no cuenta: terminar a las 00:00 deja fuera ese día', () {
      // Hasta el miércoles 2 a las 00:00 México: el miércoles ya no se muestra.
      final end = DateTime.utc(2026, 12, 2, 6);

      expect(_banner(startsAt: startTue, endsAt: end, weekdays: const [3]).neverShows, isTrue);
      expect(_banner(startsAt: startTue, endsAt: end, weekdays: const [2]).neverShows, isFalse);
    });

    test('un fin anterior al inicio nunca se muestra', () {
      final banner = _banner(startsAt: endWed, endsAt: startTue, weekdays: const [2]);

      expect(banner.neverShows, isTrue);
    });
  });
}