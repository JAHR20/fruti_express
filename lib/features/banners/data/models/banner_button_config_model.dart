import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_button_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_action_type.dart';

part 'banner_button_config_model.freezed.dart';
part 'banner_button_config_model.g.dart';

@freezed
abstract class BannerButtonConfigModel with _$BannerButtonConfigModel {
  const BannerButtonConfigModel._();

  const factory BannerButtonConfigModel({
    @Default(false) bool enabled,
    @Default('Ver más') String text,
    @Default('#FFFFFF') String textColor,
    @Default('#0C700F') String backgroundColor,
    @Default(8.0) double borderRadius,
    @Default(12.0) double horizontalPadding,
    @Default(8.0) double verticalPadding,
    String? iconName,
    @Default(BannerActionType.none)
    @JsonKey(unknownEnumValue: BannerActionType.none)
    BannerActionType actionType,
    String? actionValue,
  }) = _BannerButtonConfigModel;

  factory BannerButtonConfigModel.fromJson(Map<String, dynamic> json) =>
      _$BannerButtonConfigModelFromJson(json);

  factory BannerButtonConfigModel.fromDomain(BannerButtonConfig e) =>
      BannerButtonConfigModel(
        enabled: e.enabled,
        text: e.text,
        textColor: e.textColor,
        backgroundColor: e.backgroundColor,
        borderRadius: e.borderRadius,
        horizontalPadding: e.horizontalPadding,
        verticalPadding: e.verticalPadding,
        iconName: e.iconName,
        actionType: e.actionType,
        actionValue: e.actionValue,
      );

  BannerButtonConfig toDomain() => BannerButtonConfig(
        enabled: enabled,
        text: text,
        textColor: textColor,
        backgroundColor: backgroundColor,
        borderRadius: borderRadius,
        horizontalPadding: horizontalPadding,
        verticalPadding: verticalPadding,
        iconName: iconName,
        actionType: actionType,
        actionValue: actionValue,
      );
}