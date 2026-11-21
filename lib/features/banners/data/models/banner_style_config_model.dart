import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_style_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_format.dart';
import 'banner_format_config_model.dart';

part 'banner_style_config_model.freezed.dart';
part 'banner_style_config_model.g.dart';

class BannerFormatsConverter
    implements
        JsonConverter<Map<BannerFormat, BannerFormatConfigModel>,
            Map<String, dynamic>> {
  const BannerFormatsConverter();

  @override
  Map<BannerFormat, BannerFormatConfigModel> fromJson(
    Map<String, dynamic> json,
  ) {
    final result = <BannerFormat, BannerFormatConfigModel>{};
    for (final entry in json.entries) {
      final format =
          BannerFormat.values.where((f) => f.name == entry.key).firstOrNull;
      final value = entry.value;
      if (format == null || value is! Map) continue;
      result[format] = BannerFormatConfigModel.fromJson(
        Map<String, dynamic>.from(value),
      );
    }
    return result;
  }

  @override
  Map<String, dynamic> toJson(Map<BannerFormat, BannerFormatConfigModel> object) {
    return {
      for (final entry in object.entries) entry.key.name: entry.value.toJson(),
    };
  }
}

@freezed
abstract class BannerStyleConfigModel with _$BannerStyleConfigModel {
  const BannerStyleConfigModel._();

  const factory BannerStyleConfigModel({
    @Default(1) int version,
    @Default(BannerFormat.carouselCard)
    @JsonKey(unknownEnumValue: BannerFormat.carouselCard)
    BannerFormat defaultFormat,
    @BannerFormatsConverter()
    @Default({})
    Map<BannerFormat, BannerFormatConfigModel> formats,
  }) = _BannerStyleConfigModel;

  factory BannerStyleConfigModel.fromJson(Map<String, dynamic> json) =>
      _$BannerStyleConfigModelFromJson(json);

  factory BannerStyleConfigModel.fromDomain(BannerStyleConfig e) =>
      BannerStyleConfigModel(
        version: e.version,
        defaultFormat: e.defaultFormat,
        formats: {
          for (final entry in e.formats.entries)
            entry.key: BannerFormatConfigModel.fromDomain(entry.value),
        },
      );

  BannerStyleConfig toDomain() {
    final domainFormats = {
      for (final entry in formats.entries) entry.key: entry.value.toDomain(),
    };

    final effectiveDefault = domainFormats.containsKey(defaultFormat)
        ? defaultFormat
        : (domainFormats.keys.firstOrNull ?? defaultFormat);

    return BannerStyleConfig(
      version: version,
      defaultFormat: effectiveDefault,
      formats: domainFormats,
    );
  }
}