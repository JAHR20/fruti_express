import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final Color logistics;

  const AppColorsExtension({
    required this.logistics,
  });

  @override
  ThemeExtension<AppColorsExtension> copyWith({Color? logistics}) {
    return AppColorsExtension(
      logistics: logistics ?? this.logistics,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) return this;
    return AppColorsExtension(
      logistics: Color.lerp(logistics, other.logistics, t)!,
    );
  }
}