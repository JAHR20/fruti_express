// lib/features/banners/domain/entities/banner_template_settings.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_format_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_style_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_action_type.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_format.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_template.dart';

part 'banner_template_settings.freezed.dart';

/// Lo que el administrador puede ajustar en esta primera versión del editor
/// (formato carouselCard con las plantillas imageRight e imageLeft).
/// Se convierte en el BannerStyleConfig que se guarda con
/// BannerStyleConfigBuilder.
@freezed
abstract class BannerTemplateSettings with _$BannerTemplateSettings {
  const BannerTemplateSettings._();

  const factory BannerTemplateSettings({
    @Default(BannerTemplate.imageRight) BannerTemplate template,
    @Default('#FFFFFF') String textColor,
    @Default(40.0) double imageWidthPercent,
    @Default(false) bool buttonEnabled,
    @Default('Ver ofertas') String buttonText,
    // Categoría de las ofertas a las que lleva el botón; null = todas.
    String? buttonCategoryId,
  }) = _BannerTemplateSettings;

  static const supportedTemplates = [
    BannerTemplate.imageRight,
    BannerTemplate.imageLeft,
  ];

  static const double minImageWidth = 20;
  static const double maxImageWidth = 50;

  /// Rellena el editor con la configuración guardada de un banner.
  /// Lo que esta versión del editor no maneja (otra plantilla) se sustituye
  /// por un valor que sí maneja.
  factory BannerTemplateSettings.fromConfig(BannerStyleConfig? config) {
    final format = _carouselFormat(config);
    if (format == null) return const BannerTemplateSettings();

    final button = format.button;
    final width = format.image?.widthPercent ?? 40;

    return BannerTemplateSettings(
      template: supportedTemplates.contains(format.template)
          ? format.template
          : BannerTemplate.imageRight,
      textColor: format.typography.title?.color ?? '#FFFFFF',
      imageWidthPercent: width.clamp(minImageWidth, maxImageWidth).toDouble(),
      buttonEnabled: button?.enabled ?? false,
      buttonText: button?.text ?? 'Ver ofertas',
      buttonCategoryId: button?.actionType == BannerActionType.promotions
          ? _cleanId(button?.actionValue)
          : null,
    );
  }

  static String? _cleanId(String? value) {
    final trimmed = value?.trim();
    return (trimmed == null || trimmed.isEmpty) ? null : trimmed;
  }

  static BannerFormatConfig? _carouselFormat(BannerStyleConfig? config) {
    if (config == null) return null;
    return config.formats[BannerFormat.carouselCard] ??
        config.formats[config.defaultFormat] ??
        config.formats.values.firstOrNull;
  }
}