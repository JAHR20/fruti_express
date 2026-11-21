// test/features/banners/presentation/editor/banner_template_settings_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_format_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_background_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_layout_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_style_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_typography_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_action_type.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_format.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_template.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_template_settings.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/services/banner_style_config_builder.dart';

void main() {
  group('BannerTemplateSettings', () {
    test('sin configuración usa los valores por defecto', () {
      expect(
        BannerTemplateSettings.fromConfig(null),
        const BannerTemplateSettings(),
      );
    });

    test('construir y volver a leer conserva los ajustes', () {
      const settings = BannerTemplateSettings(
        template: BannerTemplate.imageLeft,
        textColor: '#112233',
        imageWidthPercent: 30,
        buttonEnabled: true,
        buttonText: 'Comprar',
        buttonAction: BannerActionType.none,
      );

      final config = BannerStyleConfigBuilder.build(
        settings: settings,
        backgroundStartHex: '#0C700F',
        backgroundEndHex: '#F9A826',
      );

      expect(BannerTemplateSettings.fromConfig(config), settings);
    });

    test('lo que el editor no maneja se sustituye por un valor válido', () {
      final config = BannerStyleConfig(
        version: 1,
        defaultFormat: BannerFormat.carouselCard,
        formats: {
          BannerFormat.carouselCard: BannerFormatConfig(
            template: BannerTemplate.centered,
            background: const BannerBackgroundConfig(),
            layout: const BannerLayoutConfig(),
            typography: const BannerTypographyConfig(),
          ),
        },
      );

      final settings = BannerTemplateSettings.fromConfig(config);

      expect(settings.template, BannerTemplate.imageRight);
      expect(settings.buttonEnabled, isFalse);
    });
  });

  group('BannerStyleConfigBuilder', () {
    test('arma el formato carouselCard con el fondo indicado', () {
      final config = BannerStyleConfigBuilder.build(
        settings: const BannerTemplateSettings(),
        backgroundStartHex: '#AA0000',
        backgroundEndHex: '#00AA00',
      );

      final format = config.formats[BannerFormat.carouselCard]!;

      expect(config.version, 1);
      expect(config.defaultFormat, BannerFormat.carouselCard);
      expect(config.formats.keys, [BannerFormat.carouselCard]);
      expect(format.background.primaryColor, '#AA0000');
      expect(format.background.secondaryColor, '#00AA00');
    });

    test('la imagen no lleva ruta propia: usa la imagen principal del banner', () {
      final config = BannerStyleConfigBuilder.build(
        settings: const BannerTemplateSettings(),
        backgroundStartHex: '#AA0000',
        backgroundEndHex: '#00AA00',
      );

      final image = config.formats[BannerFormat.carouselCard]!.image!;

      expect(image.imagePath, isEmpty);
      expect(image.widthPercent, 40);
    });

    test('un texto de botón vacío o muy largo se corrige', () {
      final empty = BannerStyleConfigBuilder.build(
        settings: const BannerTemplateSettings(buttonText: '   '),
        backgroundStartHex: '#AA0000',
        backgroundEndHex: '#00AA00',
      );
      final long = BannerStyleConfigBuilder.build(
        settings: BannerTemplateSettings(buttonText: 'x' * 50),
        backgroundStartHex: '#AA0000',
        backgroundEndHex: '#00AA00',
      );

      expect(empty.formats[BannerFormat.carouselCard]!.button!.text, 'Ver más');
      expect(long.formats[BannerFormat.carouselCard]!.button!.text.length, 20);
    });
  });
}