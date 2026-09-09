import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_config.dart'; 

part 'wizard_branch_state.freezed.dart';

@freezed
abstract class WizardBranchState with _$WizardBranchState {
  const factory WizardBranchState({
    @Default(0) int currentStep, 
    @Default('') String name,
    @Default('') String street,
    @Default('') String exteriorNumber,
    @Default('') String postalCode,
    String? neighborhood,
    String? state,
    String? municipality,
    double? latitude,
    double? longitude,

    @Default(<String>[]) List<String> availablePostalCodes,
    @Default(<String>[]) List<String> selectedPostalCodes,
    @Default(<String, List<String>>{}) Map<String, List<String>> neighborhoodsByPostalCode,

    ShippingConfig? shippingConfig,

    @Default(false) bool isSearchingLocation,
    @Default(false) bool isSaving,
    @Default(false) bool isLoadingConfig,
    String? errorMessage,
    @Default(false) bool isSaveSuccessful,
    @Default(false) bool isStep1Completed,
    String? createdBranchId,
  }) = _WizardBranchState;
}