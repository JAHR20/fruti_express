import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/logging/app_logger.dart';
import 'package:fruti_express_jahr_admin/core/utils/failure_translator.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_config.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/enums/shipping_strategy.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/save_shipping_config_use_case.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/get_shipping_config_use_case.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/use_cases/update_branch_coverage_use_case.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/use_cases/create_branch_use_case.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/use_cases/update_branch_use_case.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/use_cases/get_coverage_use_case.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/use_cases/get_location_by_postal_code_use_case.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';

import 'wizard_branch_state.dart';

class WizardBranchCubit extends Cubit<WizardBranchState> {
  final CreateBranchUseCase _createBranchUseCase;
  final UpdateBranchUseCase _updateBranchUseCase;
  final GetLocationByPostalCodeUseCase _getLocationByPostalCodeUseCase;
  final GetCoverageUseCase _getCoverageUseCase;
  final UpdateBranchCoverageUseCase _updateBranchCoverageUseCase;
  final GetShippingConfigUseCase _getShippingConfigUseCase;
  final SaveShippingConfigUseCase _saveShippingConfigUseCase;
  final AppLogger _logger;

  WizardBranchCubit({
    required CreateBranchUseCase createBranchUseCase,
    required UpdateBranchUseCase updateBranchUseCase,
    required GetLocationByPostalCodeUseCase getLocationByPostalCodeUseCase,
    required GetCoverageUseCase getCoverageUseCase,
    required UpdateBranchCoverageUseCase updateBranchCoverageUseCase,
    required GetShippingConfigUseCase getShippingConfigUseCase,
    required SaveShippingConfigUseCase saveShippingConfigUseCase,
    required AppLogger logger
  }) : _createBranchUseCase = createBranchUseCase,
       _updateBranchUseCase = updateBranchUseCase,
       _getLocationByPostalCodeUseCase = getLocationByPostalCodeUseCase,
       _getCoverageUseCase = getCoverageUseCase,
       _updateBranchCoverageUseCase = updateBranchCoverageUseCase,
       _getShippingConfigUseCase = getShippingConfigUseCase,
       _saveShippingConfigUseCase = saveShippingConfigUseCase,
       _logger = logger,
       super(const WizardBranchState());

  static const _incompleteAddressMessage =
      'Debe ingresar o cargar un C.P. válido antes de guardar.';

  void changeStep(int newStep) {
    emit(state.copyWith(currentStep: newStep, errorMessage: null));
  }

  void updateField({
    String? name,
    String? street,
    String? exteriorNumber,
    String? neighborhood,
    double? latitude,
    double? longitude,
  }) {
    emit(
      state.copyWith(
        name: name ?? state.name,
        street: street ?? state.street,
        exteriorNumber: exteriorNumber ?? state.exteriorNumber,
        neighborhood: neighborhood ?? state.neighborhood,
        latitude: latitude ?? state.latitude,
        longitude: longitude ?? state.longitude,
        errorMessage: null,
      ),
    );
  }

  void updateShippingConfig({
    double? maxRadiusKm,
    bool? requirePostalCodeValidation,
    int? minAmountFreeShipping,
    ShippingStrategy? strategy,
  }) {
    final currentConfig =
        state.shippingConfig ??
        ShippingConfig(
          id: '',
          branchId: state.createdBranchId ?? '',
          strategy: ShippingStrategy.haversine,
          maxRadiusKm: 10.0,
          createdAt: DateTime.now(),
        );

    emit(
      state.copyWith(
        shippingConfig: currentConfig.copyWith(
          maxRadiusKm: maxRadiusKm ?? currentConfig.maxRadiusKm,
          requireZipCodeValidation:
              requirePostalCodeValidation ??
              currentConfig.requireZipCodeValidation,
          minAmountForFreeShipping:
              minAmountFreeShipping ?? currentConfig.minAmountForFreeShipping,
          strategy: strategy ?? currentConfig.strategy,
        ),
      ),
    );
  }

  Future<void> initializeEdition(Branch branch, int initialStep) async {
    emit(
      state.copyWith(
        isSearchingLocation: true,
        currentStep: initialStep,
        createdBranchId: branch.id,
        name: branch.name,
        street: branch.street,
        exteriorNumber: branch.exteriorNumber,
        postalCode: branch.postalCode,
        neighborhood: branch.neighborhood,
        state: branch.state,
        municipality: branch.municipality,
        latitude: branch.latitude,
        longitude: branch.longitude,
        availablePostalCodes: [],
        selectedPostalCodes: [],
        neighborhoodsByPostalCode: {},
        shippingConfig: null,

        errorMessage: null,
      ),
    );

    List<String> savedCodes = [];

    final coverageResult = await _getCoverageUseCase.execute(branch.id).run();

    coverageResult.fold(
      (failure) {
        savedCodes = [];
      },
      (codes) {
        savedCodes = codes;
      },
    );

    ShippingConfig? config;

    final configResult = await _getShippingConfigUseCase
        .execute(branch.id)
        .run();

    configResult.fold(
      (failure) {
        config = null;
      },
      (result) {
        config = result;
      },
    );

    if (branch.postalCode.isNotEmpty) {
      final locationResult = await _getLocationByPostalCodeUseCase
          .execute(branch.postalCode)
          .run();

      locationResult.fold(
        (failure) {
          emit(
            state.copyWith(
              isSearchingLocation: false,
              selectedPostalCodes: savedCodes,
              shippingConfig: config,
            ),
          );
        },
        (location) {
          emit(
            state.copyWith(
              isSearchingLocation: false,
              state: location.state,
              municipality: location.municipality,
              availablePostalCodes: location.availablePostalCodes,
              selectedPostalCodes: savedCodes,
              neighborhoodsByPostalCode: location.neighborhoodsByPostalCode,
              shippingConfig: config,
              errorMessage: null,
            ),
          );
        },
      );
    } else {
      emit(
        state.copyWith(
          isSearchingLocation: false,
          selectedPostalCodes: savedCodes,
          shippingConfig: config,
        ),
      );
    }
  }

  Future<void> saveStep1({
    required AppUser currentUser,
    Branch? branchToEdit,
  }) async {
    if (state.municipality == null || state.state == null) {
      emit(state.copyWith(errorMessage: _incompleteAddressMessage));
      return;
    }

    emit(
      state.copyWith(
        isSaving: true,
        errorMessage: null,
        isStep1Completed: false,
      ),
    );

    final result = branchToEdit == null
        ? await _createBranchUseCase
              .execute(
                currentUser: currentUser,
                name: state.name.trim(),
                street: state.street.trim(),
                exteriorNumber: state.exteriorNumber.trim(),
                postalCode: state.postalCode,
                neighborhood: state.neighborhood ?? "",
                municipality: state.municipality!,
                state: state.state!,
                latitude: state.latitude,
                longitude: state.longitude,
              )
              .run()
        : await _updateBranchUseCase
              .execute(
                currentUser: currentUser,
                modifiedBranch: branchToEdit.copyWith(
                  name: state.name.trim(),
                  street: state.street.trim(),
                  exteriorNumber: state.exteriorNumber.trim(),
                  postalCode: state.postalCode,
                  neighborhood: state.neighborhood ?? "",
                  municipality: state.municipality!,
                  state: state.state!,
                  latitude: state.latitude,
                  longitude: state.longitude,
                ),
              )
              .run();

    result.fold(
      (failure) => emit(
        state.copyWith(
          isSaving: false,
          errorMessage: translateFailure(failure),
        ),
      ),
      (savedBranch) => emit(
        state.copyWith(
          isSaving: false,
          isStep1Completed: true,
          createdBranchId: savedBranch.id,
        ),
      ),
    );
  }

  Future<void> finishWizard(AppUser currentUser) async {
    final branchId = state.createdBranchId;

    if (branchId == null) {
      _logger.error(
        'finishWizard() llamado sin createdBranchId en FormularioSucursalCubit',
      );
      emit(
        state.copyWith(
          errorMessage:
              'Ocurrió un error inesperado. Vuelve a intentar desde el inicio.',
        ),
      );
      return;
    }

    emit(state.copyWith(isSaving: true, errorMessage: null));

    final coverageResult = await _updateBranchCoverageUseCase
        .execute(
          currentUser: currentUser,
          branchId: branchId,
          postalCodes: state.selectedPostalCodes,
        )
        .run();

    final failure = coverageResult.fold((l) => l, (_) => null);
    if (failure != null) {
      emit(
        state.copyWith(
          isSaving: false,
          errorMessage: translateFailure(failure),
        ),
      );
      return;
    }

    final configToSave =
        (state.shippingConfig ??
                ShippingConfig(
                  id: '',
                  branchId: branchId,
                  strategy: ShippingStrategy.haversine,
                  maxRadiusKm: 10.0,
                  createdAt: DateTime.now(),
                ))
            .copyWith(
              branchId: branchId,
              allowedZipCodes: state.selectedPostalCodes,
            );

    final shippingResult = await _saveShippingConfigUseCase
        .execute(currentUser: currentUser, config: configToSave)
        .run();

    shippingResult.fold(
      (failure) => emit(
        state.copyWith(
          isSaving: false,
          errorMessage: translateFailure(failure),
        ),
      ),
      (_) => emit(state.copyWith(isSaving: false, isSaveSuccessful: true)),
    );
  }

  Future<void> searchByPostalCode(String postalCode) async {
    emit(state.copyWith(postalCode: postalCode));
    if (postalCode.length != 5) return;

    emit(state.copyWith(isSearchingLocation: true, errorMessage: null));
    final result = await _getLocationByPostalCodeUseCase
        .execute(postalCode)
        .run();

    result.fold(
      (failure) => emit(
        state.copyWith(
          isSearchingLocation: false,
          errorMessage: translateFailure(failure),
        ),
      ),
      (location) => emit(
        state.copyWith(
          isSearchingLocation: false,
          state: location.state,
          municipality: location.municipality,
          availablePostalCodes: location.availablePostalCodes,
          selectedPostalCodes: location.availablePostalCodes,
          neighborhoodsByPostalCode: location.neighborhoodsByPostalCode,
        ),
      ),
    );
  }

  void togglePostalCode(String code, bool isSelected) {
    final newList = List<String>.from(state.selectedPostalCodes);
    if (isSelected) {
      if (!newList.contains(code)) newList.add(code);
    } else {
      newList.remove(code);
    }
    emit(state.copyWith(selectedPostalCodes: newList));
  }
}
