// test/features/banners/domain/promo_banner_weekdays_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:fruti_express_jahr_admin/features/banners/data/models/promo_banner_model.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/promo_banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/utils/banner_date_format.dart';

PromoBanner _banner({List<int> weekdays = const []}) {
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
    weekdays: weekdays,
  );
}

void main() {
  group('weekdaysLabel', () {
    test('sin días o con los siete no hay etiqueta', () {
      expect(weekdaysLabel(const []), isNull);
      expect(weekdaysLabel(const [1, 2, 3, 4, 5, 6, 7]), isNull);
    });

    test('un solo día', () {
      expect(weekdaysLabel(const [3]), 'Solo miércoles');
    });

    test('dos días', () {
      expect(weekdaysLabel(const [5, 1]), 'Solo lunes y viernes');
    });

    test('varios días, ordenados', () {
      expect(
        weekdaysLabel(const [5, 1, 3]),
        'Solo lunes, miércoles y viernes',
      );
    });

    test('ignora valores fuera de rango y repetidos', () {
      expect(weekdaysLabel(const [0, 8, 3, 3]), 'Solo miércoles');
    });
  });

  group('PromoBannerModel (días de la semana)', () {
    test('se guardan ordenados y sin repetir', () {
      final json = PromoBannerModelX.fromDomain(
        _banner(weekdays: const [5, 3, 3, 1]),
      ).toJson();

      expect(json['weekdays'], [1, 3, 5]);
    });

    test('sin días o con los siete se guarda null (todos los días)', () {
      final none = PromoBannerModelX.fromDomain(_banner()).toJson();
      final all = PromoBannerModelX.fromDomain(
        _banner(weekdays: const [1, 2, 3, 4, 5, 6, 7]),
      ).toJson();

      expect(none['weekdays'], isNull);
      expect(all['weekdays'], isNull);
    });

    test('al leer, un null de la base de datos queda como lista vacía', () {
      final model = PromoBannerModelX.fromDomain(_banner(weekdays: const [2]));
      final domain = model.toDomain();

      expect(domain.weekdays, [2]);
      expect(model.copyWith(weekdays: null).toDomain().weekdays, isEmpty);
    });
  });
}