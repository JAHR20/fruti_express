import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/coupon.dart';

part 'coupon_state.freezed.dart';

enum CouponsTab { all, active, inactive }

@freezed
abstract class CouponState with _$CouponState {
  const factory CouponState({
    @Default([]) List<Coupon> coupons,
    @Default(false) bool isLoading,
    @Default(false) bool isSavingOperation,
    @Default(CouponsTab.all) CouponsTab tab,
    String? processingCouponId,
    bool? operationSuccessful, 
    String? operationError,    
    String? errorMessage,      
    @Default('') String searchQuery,
  }) = _CouponState;
}