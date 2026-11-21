// lib/features/banners/domain/services/banner_style_config_builder.dart
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_background_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_button_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_format_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_image_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_layout_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_style_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_template_settings.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_text_style_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_typography_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_background_type.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_font_weight.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_format.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_image_position.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_template.dart';

/// Construye el BannerStyleConfig que se guarda en `style_config`.
///
/// La imagen no lleva ruta propia (`imagePath` vacío): se usa la imagen
/// principal del banner, la misma que ya se sube con el formulario actual.
abstract final class BannerStyleConfigBuilder {
  static BannerStyleConfig build({
    required BannerTemplateSettings settings,
    required String backgroundStartHex,
    required String backgroundEndHex,
  }) {
    final imageOnLeft = settings.template == BannerTemplate.imageLeft;
    final buttonText = settings.buttonText.trim();

    return BannerStyleConfig(
      version: 1,
      defaultFormat: BannerFormat.carouselCard,
      formats: {
        BannerFormat.carouselCard: BannerFormatConfig(
          template: settings.template,
          background: BannerBackgroundConfig(
            type: BannerBackgroundType.linearGradient,
            primaryColor: backgroundStartHex,
            secondaryColor: backgroundEndHex,
            gradientAngle: 45,
          ),
          layout: const BannerLayoutConfig(),
          typography: BannerTypographyConfig(
            title: _text(settings.textColor, 14, 'w500', 1),
            discount: _text(settings.textColor, 28, 'w700', 1),
            subtitle: _text(settings.textColor, 12, 'w400', 2),
          ),
          image: BannerImageConfig(
            imagePath: '',
            position: BannerImagePosition.values.firstWhere(
              (p) => p.name == (imageOnLeft ? 'left' : 'right'),
              orElse: () => BannerImagePosition.right,
            ),
            widthPercent: settings.imageWidthPercent,
          ),
          button: BannerButtonConfig(
            enabled: settings.buttonEnabled,
            text: buttonText.isEmpty
                ? 'Ver más'
                : (buttonText.length > 20 ? buttonText.substring(0, 20) : buttonText),
            textColor: '#0C700F',
            backgroundColor: '#FFFFFF',
            actionType: settings.buttonAction,
          ),
        ),
      },
    );
  }

  static BannerTextStyleConfig _text(
    String color,
    double size,
    String weightName,
    int maxLines,
  ) {
    return BannerTextStyleConfig(
      color: color,
      fontSize: size,
      fontWeight: BannerFontWeight.values.firstWhere(
        (w) => w.name == weightName,
        orElse: () => BannerFontWeight.w400,
      ),
      maxLines: maxLines,
    );
  }
}