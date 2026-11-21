// test/features/banners/presentation/widgets/promo_banner_renderer_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_background_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_button_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_format_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_layout_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_style_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_typography_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/promo_banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_format.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_template.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/widgets/promo_banner_renderer.dart';

PromoBanner _banner({
  String title = 'Ofertas',
  String discount = '15%',
  String subtitle = 'En todas las frutas',
  String startColor = '#9B7A67',
  String endColor = '#ADD7F2',
  BannerStyleConfig? styleConfig,
}) {
  return PromoBanner(
    id: '1',
    title: title,
    discount: discount,
    subtitle: subtitle,
    startColor: startColor,
    endColor: endColor,
    isActive: true,
    sortOrder: 0,
    createdAt: DateTime(2026, 11, 1),
    styleConfig: styleConfig,
  );
}

BannerStyleConfig _style({BannerBackgroundConfig? background}) {
  return BannerStyleConfig(
    version: 1,
    defaultFormat: BannerFormat.carouselCard,
    formats: {
      BannerFormat.carouselCard: BannerFormatConfig(
        template: BannerTemplate.imageRight,
        background: background ?? const BannerBackgroundConfig(),
        layout: const BannerLayoutConfig(),
        typography: const BannerTypographyConfig(),
        button: const BannerButtonConfig(enabled: true, text: 'Ver ofertas'),
      ),
    },
  );
}

Future<void> _pump(WidgetTester tester, PromoBanner banner) {
  return tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 280,
            child: PromoBannerRenderer(banner: banner),
          ),
        ),
      ),
    ),
  );
}

void main() {
  testWidgets('un banner anterior (sin styleConfig) muestra sus tres textos', (tester) async {
    await _pump(tester, _banner());

    expect(find.text('Ofertas'), findsOneWidget);
    expect(find.text('15%'), findsOneWidget);
    expect(find.text('En todas las frutas'), findsOneWidget);
  });

  testWidgets('un banner con plantilla muestra textos y botón', (tester) async {
    await _pump(tester, _banner(styleConfig: _style()));

    expect(find.text('Ofertas'), findsOneWidget);
    expect(find.text('15%'), findsOneWidget);
    expect(find.text('Ver ofertas'), findsOneWidget);
  });

  testWidgets('colores inválidos usan el respaldo y no lanzan error', (tester) async {
    await _pump(tester, _banner(startColor: 'xyz', endColor: ''));
    expect(tester.takeException(), isNull);

    await _pump(
      tester,
      _banner(
        styleConfig: _style(
          background: const BannerBackgroundConfig(primaryColor: 'no-es-color'),
        ),
      ),
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('textos muy largos no desbordan el banner', (tester) async {
    final long = 'Texto larguísimo ' * 30;

    await _pump(tester, _banner(title: long, discount: long, subtitle: long));
    expect(tester.takeException(), isNull);

    await _pump(
      tester,
      _banner(title: long, discount: long, subtitle: long, styleConfig: _style()),
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('un texto vacío no se dibuja', (tester) async {
    await _pump(tester, _banner(subtitle: '   ', styleConfig: _style()));

    expect(find.text('   '), findsNothing);
    expect(tester.takeException(), isNull);
  });
}