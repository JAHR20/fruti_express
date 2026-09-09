import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/promo_banner.dart';

part 'promo_banner_state.freezed.dart';

@freezed
abstract class PromoBannerState with _$PromoBannerState {
  const factory PromoBannerState({
    @Default(<PromoBanner>[]) List<PromoBanner> banners,
    @Default(false) bool isLoading,
    String? processingBannerId, 
    String? errorMessage, 
    String? operationError, 
    @Default(false) bool isOperationSuccessful, 
  }) = _PromoBannerState;
  
  const PromoBannerState._(); 
}