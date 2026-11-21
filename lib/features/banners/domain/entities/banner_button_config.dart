import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums/banner_action_type.dart';

part 'banner_button_config.freezed.dart';

@freezed
abstract class BannerButtonConfig with _$BannerButtonConfig {
  const factory BannerButtonConfig({
    @Default(false) bool enabled,

    @Default('Ver más') String text,

    @Default('#FFFFFF') String textColor,
    @Default('#0C700F') String backgroundColor,

    @Default(8.0) double borderRadius,

    @Default(12.0) double horizontalPadding,
    @Default(8.0) double verticalPadding,

    String? iconName,

    @Default(BannerActionType.none)
    BannerActionType actionType,

    String? actionValue,
  }) = _BannerButtonConfig;
}