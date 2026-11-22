import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_background_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_button_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_format_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_image_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_text_style_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/promo_banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_background_type.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_font_weight.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_format.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_image_fit.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_template.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_text_alignment.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_vertical_alignment.dart';

typedef BannerImageUrlResolver = String Function(String storagePath);

extension BannerFormatSpec on BannerFormat {
  double get aspectRatio => switch (this) {
        BannerFormat.heroWide => 2.4,
        BannerFormat.carouselCard => 2.0,
        BannerFormat.square => 1.0,
        BannerFormat.portrait => 0.8,
      };
}

/// Dibuja un banner. Lo usan por igual la administración y los clientes.
///
/// - Sin `styleConfig` (banners anteriores): diseño clásico con degradado
///   entre `startColor` y `endColor` e `imageUrl` de fondo tenue.
/// - Con `styleConfig`: plantilla del formato pedido. La imagen sale de
///   `image.imagePath` si trae ruta; si está vacía usa la imagen principal
///   del banner (`imageUrl`). Por ahora están
///   implementadas `imageRight` e `imageLeft`; el resto de plantillas se
///   dibuja como `imageRight` hasta que tengan su propio diseño.
///
/// Todo valor numérico se limita a un rango seguro y todo color inválido
/// usa uno de respaldo, de modo que una configuración mala no rompa la pantalla.
class PromoBannerRenderer extends StatelessWidget {
  const PromoBannerRenderer({
    super.key,
    required this.banner,
    this.format = BannerFormat.carouselCard,
    this.resolveImageUrl,
    this.onButtonTap,
    this.previewImage,
  });

  final PromoBanner banner;
  final BannerFormat format;
  final BannerImageUrlResolver? resolveImageUrl;

  /// Imagen local aún sin subir (vista previa del editor). Tiene prioridad
  /// sobre la imagen guardada del banner.
  final ImageProvider? previewImage;

  /// Null = el botón se dibuja pero no responde (vista previa del admin).
  final void Function(BannerButtonConfig button)? onButtonTap;

  BannerFormatConfig? _resolveConfig() {
    final style = banner.styleConfig;
    if (style == null || style.formats.isEmpty) return null;
    return style.formats[format] ??
        style.formats[style.defaultFormat] ??
        style.formats.values.first;
  }

  @override
  Widget build(BuildContext context) {
    final config = _resolveConfig();

    return AspectRatio(
      aspectRatio: format.aspectRatio,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: config == null
            ? _LegacyBanner(banner: banner, previewImage: previewImage)
            : _TemplateBanner(
                banner: banner,
                config: config,
                resolveImageUrl: resolveImageUrl,
                onButtonTap: onButtonTap,
                previewImage: previewImage,
              ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Diseño clásico
// ---------------------------------------------------------------------------

class _LegacyBanner extends StatelessWidget {
  const _LegacyBanner({required this.banner, required this.previewImage});

  final PromoBanner banner;
  final ImageProvider? previewImage;

  @override
  Widget build(BuildContext context) {
    final start = _parseColor(banner.startColor, const Color(0xFF0C700F));
    final end = _parseColor(banner.endColor, const Color(0xFFF9A826));
    final imageUrl = (banner.imageUrl ?? '').trim();

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [start, end],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (previewImage != null)
            Opacity(
              opacity: 0.15,
              child: Image(image: previewImage!, fit: BoxFit.cover),
            )
          else if (imageUrl.isNotEmpty)
            Opacity(opacity: 0.15, child: _networkImage(imageUrl, BoxFit.cover)),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  banner.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  banner.discount,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  banner.subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Plantillas
// ---------------------------------------------------------------------------

class _TemplateBanner extends StatelessWidget {
  const _TemplateBanner({
    required this.banner,
    required this.config,
    required this.resolveImageUrl,
    required this.onButtonTap,
    required this.previewImage,
  });

  final PromoBanner banner;
  final BannerFormatConfig config;
  final BannerImageUrlResolver? resolveImageUrl;
  final void Function(BannerButtonConfig button)? onButtonTap;
  final ImageProvider? previewImage;

  @override
  Widget build(BuildContext context) {
    final layout = config.layout;
    final image = config.image;

    // Ruta propia del formato; si está vacía, la imagen principal del banner.
    final source = (image != null && image.imagePath.trim().isNotEmpty)
        ? image.imagePath
        : (banner.imageUrl ?? '');
    final imageUrl = (image != null && image.visible)
        ? _storageUrl(source, resolveImageUrl)
        : null;
    final hasImage = image != null &&
        image.visible &&
        (previewImage != null || imageUrl != null);

    final content = _Content(
      banner: banner,
      config: config,
      onButtonTap: onButtonTap,
    );

    Widget body = content;
    if (hasImage) {
      final imagePercent = _clampDouble(image.widthPercent, 10, 60);
      final imageFlex = imagePercent.round();
      final contentFlex = (100 - imagePercent).round();
      final imageOnLeft = config.template == BannerTemplate.imageLeft;
      final imageWidget = _SideImage(
        config: image,
        url: imageUrl,
        provider: previewImage,
        verticalFactor: _verticalFactor(layout.verticalAlignment),
      );

      body = Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (imageOnLeft) Expanded(flex: imageFlex, child: imageWidget),
          Expanded(flex: contentFlex, child: content),
          if (!imageOnLeft) Expanded(flex: imageFlex, child: imageWidget),
        ],
      );
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        _Background(config: config.background, resolveImageUrl: resolveImageUrl),
        Padding(
          padding: EdgeInsets.fromLTRB(
            _clampDouble(layout.paddingLeft, 0, 48),
            _clampDouble(layout.paddingTop, 0, 48),
            _clampDouble(layout.paddingRight, 0, 48),
            _clampDouble(layout.paddingBottom, 0, 48),
          ),
          child: body,
        ),
      ],
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({required this.config, required this.resolveImageUrl});

  final BannerBackgroundConfig config;
  final BannerImageUrlResolver? resolveImageUrl;

  @override
  Widget build(BuildContext context) {
    final primary = _parseColor(config.primaryColor, const Color(0xFF0C700F));
    final secondary =
        _parseColor(config.secondaryColor, const Color(0xFFF9A826));
    final tertiaryHex = config.tertiaryColor;

    final BoxDecoration decoration;
    if (config.type == BannerBackgroundType.linearGradient) {
      // 0° = de izquierda a derecha, 90° = de arriba a abajo.
      final angle = _clampDouble(config.gradientAngle, -360, 360) * math.pi / 180;
      decoration = BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primary,
            secondary,
            if (tertiaryHex != null) _parseColor(tertiaryHex, secondary),
          ],
          begin: Alignment(-math.cos(angle), -math.sin(angle)),
          end: Alignment(math.cos(angle), math.sin(angle)),
        ),
      );
    } else {
      decoration = BoxDecoration(color: primary);
    }

    final backgroundUrl = _storageUrl(config.imagePath ?? '', resolveImageUrl);
    final overlayHex = config.overlayColor;
    final overlayOpacity = _clampDouble(config.overlayOpacity, 0, 1);

    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(decoration: decoration),
        if (backgroundUrl != null) _networkImage(backgroundUrl, BoxFit.cover),
        if (overlayHex != null && overlayOpacity > 0)
          ColoredBox(
            color: _parseColor(overlayHex, Colors.black)
                .withValues(alpha: overlayOpacity),
          ),
      ],
    );
  }
}

class _SideImage extends StatelessWidget {
  const _SideImage({
    required this.config,
    required this.url,
    required this.provider,
    required this.verticalFactor,
  });

  final BannerImageConfig config;
  final String? url;
  final ImageProvider? provider;
  final double verticalFactor;

  @override
  Widget build(BuildContext context) {
    final heightFactor = _clampDouble(config.heightPercent, 20, 100) / 100;
    final radius = _clampDouble(config.borderRadius, 0, 40);
    final offset = Offset(
      _clampDouble(config.offsetX, -50, 50),
      _clampDouble(config.offsetY, -50, 50),
    );
    final angle = _clampDouble(config.rotation, -15, 15) * math.pi / 180;

    return Align(
      alignment: Alignment(0, verticalFactor),
      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: heightFactor,
        child: Transform.translate(
          offset: offset,
          child: Transform.rotate(
            angle: angle,
            child: Opacity(
              opacity: _clampDouble(config.opacity, 0, 1),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: SizedBox.expand(
                  child: provider != null
                      ? Image(image: provider!, fit: _boxFit(config.fit))
                      : _networkImage(url!, _boxFit(config.fit)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.banner,
    required this.config,
    required this.onButtonTap,
  });

  final PromoBanner banner;
  final BannerFormatConfig config;
  final void Function(BannerButtonConfig button)? onButtonTap;

  @override
  Widget build(BuildContext context) {
    final layout = config.layout;
    final typography = config.typography;
    final horizontal = layout.horizontalAlignment;
    final spacing = _clampDouble(layout.elementSpacing, 0, 32);

    final children = <Widget>[];
    void add(Widget widget) {
      if (children.isNotEmpty) children.add(SizedBox(height: spacing));
      children.add(widget);
    }

    if (banner.title.trim().isNotEmpty) {
      add(_StyledText(
        text: banner.title,
        config: typography.title,
        inheritedAlignment: horizontal,
        fallbackMaxLines: 1,
        fallbackStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ));
    }

    if (banner.discount.trim().isNotEmpty) {
      add(_StyledText(
        text: banner.discount,
        config: typography.discount,
        inheritedAlignment: horizontal,
        fallbackMaxLines: 1,
        fallbackStyle: const TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ));
    }

    if (banner.subtitle.trim().isNotEmpty) {
      add(_StyledText(
        text: banner.subtitle,
        config: typography.subtitle,
        inheritedAlignment: horizontal,
        fallbackMaxLines: 2,
        fallbackStyle: const TextStyle(color: Colors.white, fontSize: 12),
      ));
    }

    final button = config.button;
    if (button != null && button.enabled && button.text.trim().isNotEmpty) {
      add(_ActionButton(config: button, onTap: onButtonTap));
    }

    final offset = Offset(
      _clampDouble(layout.offsetX, -50, 50),
      _clampDouble(layout.offsetY, -50, 50),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth.isFinite ? constraints.maxWidth : 240.0;

        // Si el contenido es más alto que el banner, se reduce en lugar de desbordarse.
        return FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment(0, _verticalFactor(layout.verticalAlignment)),
          child: Transform.translate(
            offset: offset,
            child: SizedBox(
              width: width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: _crossAxis(horizontal),
                children: children,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _StyledText extends StatelessWidget {
  const _StyledText({
    required this.text,
    required this.config,
    required this.inheritedAlignment,
    required this.fallbackStyle,
    required this.fallbackMaxLines,
  });

  final String text;
  final BannerTextStyleConfig? config;
  final BannerTextAlignment inheritedAlignment;
  final TextStyle fallbackStyle;
  final int fallbackMaxLines;

  @override
  Widget build(BuildContext context) {
    final cfg = config;

    final style = cfg == null
        ? fallbackStyle
        : TextStyle(
            color: _parseColor(cfg.color, Colors.white),
            fontSize: _clampDouble(cfg.fontSize, 8, 64),
            fontWeight: _fontWeight(cfg.fontWeight),
            fontFamily: cfg.fontFamily,
            height: _clampDouble(cfg.lineHeight, 0.8, 2.5),
            letterSpacing: _clampDouble(cfg.letterSpacing, -2, 10),
            decoration:
                cfg.underline ? TextDecoration.underline : TextDecoration.none,
          );

    final maxLines = cfg == null ? fallbackMaxLines : cfg.maxLines.clamp(1, 6).toInt();
    final shownText = (cfg != null && cfg.uppercase) ? text.toUpperCase() : text;

    Widget result = Text(
      shownText,
      style: style,
      textAlign: _textAlign(cfg?.alignment ?? inheritedAlignment),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );

    final rotation = cfg == null ? 0.0 : _clampDouble(cfg.rotation, -15, 15);
    if (rotation != 0) {
      result = Transform.rotate(angle: rotation * math.pi / 180, child: result);
    }
    return result;
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.config, required this.onTap});

  final BannerButtonConfig config;
  final void Function(BannerButtonConfig button)? onTap;

  @override
  Widget build(BuildContext context) {
    final background = _parseColor(config.backgroundColor, const Color(0xFF0C700F));
    final foreground = _parseColor(config.textColor, Colors.white);
    final radius = BorderRadius.circular(_clampDouble(config.borderRadius, 0, 30));

    return Material(
      color: background,
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        onTap: onTap == null ? null : () => onTap!(config),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _clampDouble(config.horizontalPadding, 4, 32),
            vertical: _clampDouble(config.verticalPadding, 2, 20),
          ),
          child: Text(
            config.text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: foreground,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Utilidades
// ---------------------------------------------------------------------------

Color _parseColor(String? hex, Color fallback) {
  if (hex == null) return fallback;
  var value = hex.trim().replaceFirst('#', '');
  if (value.length == 6) value = 'FF$value';
  if (value.length != 8) return fallback;
  final parsed = int.tryParse(value, radix: 16);
  return parsed == null ? fallback : Color(parsed);
}

double _clampDouble(double value, double min, double max) {
  if (value.isNaN) return min;
  return value.clamp(min, max).toDouble();
}

/// Acepta una URL completa (banners anteriores) o una ruta del bucket.
String? _storageUrl(String path, BannerImageUrlResolver? resolver) {
  final trimmed = path.trim();
  if (trimmed.isEmpty) return null;
  if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
    return trimmed;
  }
  return resolver?.call(trimmed);
}

Widget _networkImage(String url, BoxFit fit) {
  return Image.network(
    url,
    fit: fit,
    errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
  );
}

// Las conversiones de enums se hacen por nombre para no depender de que
// existan casos concretos; los valores desconocidos usan un respaldo.

CrossAxisAlignment _crossAxis(BannerTextAlignment value) {
  final name = value.name.toLowerCase();
  if (name.contains('center')) return CrossAxisAlignment.center;
  if (name.contains('right') || name.contains('end')) {
    return CrossAxisAlignment.end;
  }
  return CrossAxisAlignment.start;
}

TextAlign _textAlign(BannerTextAlignment value) {
  final name = value.name.toLowerCase();
  if (name.contains('center')) return TextAlign.center;
  if (name.contains('right') || name.contains('end')) return TextAlign.right;
  return TextAlign.left;
}

double _verticalFactor(BannerVerticalAlignment value) {
  final name = value.name.toLowerCase();
  if (name.contains('top')) return -1;
  if (name.contains('bottom')) return 1;
  return 0;
}

BoxFit _boxFit(BannerImageFit value) {
  return BoxFit.values.where((fit) => fit.name == value.name).firstOrNull ??
      BoxFit.cover;
}

FontWeight _fontWeight(BannerFontWeight value) {
  final digits = int.tryParse(value.name.replaceAll(RegExp(r'[^0-9]'), ''));
  if (digits == null) return FontWeight.w400;
  final index = (digits ~/ 100).clamp(1, 9).toInt() - 1;
  return FontWeight.values[index];
}