// test/features/banners/data/models/banner_style_config_model_test.dart
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fruti_express_jahr_admin/features/banners/data/models/banner_style_config_model.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_background_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_layout_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_typography_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_format.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_template.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_text_alignment.dart';

void main() {
  Map<String, dynamic> minimal() => {
    'version': 1,
    'defaultFormat': 'carouselCard',
    'formats': {
      'carouselCard': {'template': 'imageRight'},
    },
  };

  group('BannerStyleConfigModel', () {
    test(
      'un JSON mínimo se completa con los valores por defecto del dominio',
      () {
        final domain = BannerStyleConfigModel.fromJson(minimal()).toDomain();
        final format = domain.formats[BannerFormat.carouselCard]!;

        expect(format.template, BannerTemplate.imageRight);
        expect(format.background, const BannerBackgroundConfig());
        expect(format.layout, const BannerLayoutConfig());
        expect(format.typography, const BannerTypographyConfig());
        expect(format.image, isNull);
        expect(format.button, isNull);
      },
    );

    test('un enum desconocido usa el valor de respaldo en lugar de fallar', () {
      final json = minimal();
      json['formats'] = {
        'carouselCard': {
          'template': 'hologram',
          'layout': {'horizontalAlignment': 'diagonal'},
        },
      };

      final format = BannerStyleConfigModel.fromJson(
        json,
      ).toDomain().formats[BannerFormat.carouselCard]!;

      expect(format.template, BannerTemplate.centered);
      expect(format.layout.horizontalAlignment, BannerTextAlignment.left);
    });

    test(
      'un formato desconocido se ignora y defaultFormat usa uno disponible',
      () {
        final json = {
          'version': 2,
          'defaultFormat': 'hologram',
          'formats': {
            'hologram': {'template': 'imageRight'},
            'square': {'template': 'centered'},
          },
        };

        final domain = BannerStyleConfigModel.fromJson(json).toDomain();

        expect(domain.formats.keys, [BannerFormat.square]);
        expect(domain.defaultFormat, BannerFormat.square);
      },
    );

    test('una imagen sin ruta usa la imagen principal del banner', () {
      final json = minimal();
      json['formats'] = {
        'carouselCard': {
          'template': 'imageRight',
          'image': {'position': 'right'},
        },
      };

      final format = BannerStyleConfigModel.fromJson(
        json,
      ).toDomain().formats[BannerFormat.carouselCard]!;

      // imagePath vacío = se usa la imagen principal del banner (image_url).
      expect(format.image, isNotNull);
      expect(format.image!.imagePath, isEmpty);
    });

    test('un JSON vacío no lanza error', () {
      final domain = BannerStyleConfigModel.fromJson({}).toDomain();

      expect(domain.formats, isEmpty);
    });

    test('guardar y volver a leer conserva la configuración', () {
      final json = minimal();
      json['formats'] = {
        'carouselCard': {
          'template': 'imageRight',
          'background': {'primaryColor': '#112233', 'gradientAngle': 30},
          'typography': {
            'title': {'fontSize': 22, 'maxLines': 3},
          },
          'image': {'imagePath': 'abc/carouselCard.webp', 'widthPercent': 35},
          'button': {
            'enabled': true,
            'text': 'Comprar',
            'actionType': 'promotions',
          },
        },
      };

      final domain = BannerStyleConfigModel.fromJson(json).toDomain();
      final saved =
          jsonDecode(
                jsonEncode(BannerStyleConfigModel.fromDomain(domain).toJson()),
              )
              as Map<String, dynamic>;

      expect(BannerStyleConfigModel.fromJson(saved).toDomain(), domain);
    });
  });
}
