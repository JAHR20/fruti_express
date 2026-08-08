import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner.dart';

part 'banner_state.freezed.dart';

@freezed
class BannerState with _$BannerState {
  const factory BannerState.initial() = BannerInitial;
  const factory BannerState.loading() = BannerLoading;
  const factory BannerState.loaded(List<Banner> banners) = BannerLoaded;
  const factory BannerState.error(String message) = BannerError;
}