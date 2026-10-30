import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:fruti_express_jahr_admin/core/theme/app_colors_extension.dart';

class AppTheme {
  static const Color _primaryColor = Color.fromARGB(255, 12, 112, 15);
  static const Color _secondaryColor = Color(0xFFF9A826);
  static const Color _tertiaryColor = Color(0xFF7C3AED);
  static const Color _errorColor = Color(0xFFDC2626);

  static const Color _logisticsColor = Color(0xFF2563EB);

  static ThemeData get light {
    return FlexThemeData.light(
      colors: FlexSchemeColor.from(
        primary: _primaryColor,
        secondary: _secondaryColor,
        tertiary: _tertiaryColor,
        error: _errorColor,
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 7,
      subThemesData: const FlexSubThemesData(
        appBarCenterTitle: true,
        blendOnLevel: 10,
        useMaterial3Typography: true,
        elevatedButtonRadius: 12,
        elevatedButtonElevation: 0,
        outlinedButtonRadius: 12,
        filledButtonRadius: 12,
        inputDecoratorRadius: 14,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        inputDecoratorIsFilled: true,
        inputDecoratorUnfocusedHasBorder: true,
        cardRadius: 16,
        cardElevation: 2,
        chipRadius: 20,
        bottomSheetRadius: 24,
        bottomSheetElevation: 4,
        appBarBackgroundSchemeColor: SchemeColor.surface,
        appBarScrolledUnderElevation: 3,
        dialogRadius: 20,
        switchSchemeColor: SchemeColor.primary,
        elevatedButtonSchemeColor: SchemeColor.onPrimary,
        elevatedButtonSecondarySchemeColor: SchemeColor.primary,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      useMaterial3: true,
      fontFamily: 'YourFontIfAny',
      extensions: const <ThemeExtension<dynamic>>[
        AppColorsExtension(logistics: _logisticsColor),
      ],
    );
  }

  static ThemeData get dark {
    return FlexThemeData.dark(
      colors: FlexSchemeColor.from(
        primary: _primaryColor,
        secondary: _secondaryColor,
        tertiary: _tertiaryColor, // 👈 nuevo
        error: _errorColor,
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 13,
      subThemesData: const FlexSubThemesData(
        appBarCenterTitle: true,
        blendOnLevel: 20,
        useMaterial3Typography: true,
        elevatedButtonRadius: 12,
        inputDecoratorRadius: 14,
        cardRadius: 16,
        chipRadius: 20,
        bottomSheetRadius: 24,
        dialogRadius: 20,
        appBarBackgroundSchemeColor:
            SchemeColor.surface,
        appBarScrolledUnderElevation: 3,
        elevatedButtonSchemeColor: SchemeColor.primary,
        elevatedButtonSecondarySchemeColor: SchemeColor.onPrimary,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      useMaterial3: true,
      extensions: const <ThemeExtension<dynamic>>[
        AppColorsExtension(logistics: _logisticsColor),
      ],
    );
  }
}
