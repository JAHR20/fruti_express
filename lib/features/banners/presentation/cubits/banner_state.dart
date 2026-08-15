import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner.dart';

part 'banner_state.freezed.dart';

@freezed
abstract class BannerState with _$BannerState {
  const factory BannerState({
    @Default(<Banner>[]) List<Banner> banners,
    @Default(false) bool isLoading,
    String? bannerProcesandoId,
    String? errorMessage,
    String? operacionError,
    @Default(false) bool operacionExitosa,
  }) = _BannerState;
  const BannerState._(); 
}