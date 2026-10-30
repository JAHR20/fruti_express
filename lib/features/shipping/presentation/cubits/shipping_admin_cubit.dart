import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/failure_translator.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_config.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_rate.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/delete_and_merge_shipping_rate_use_case.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/edit_shipping_rate_use_case.dart';

import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/get_shipping_config_use_case.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/get_shipping_rates_use_case.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/save_shipping_config_use_case.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/save_shipping_rates_use_case.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/split_shipping_rate_use_case.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';

import 'shipping_admin_state.dart';

class ShippingAdminCubit extends Cubit<ShippingAdminState> {
  final GetShippingConfigUseCase _getConfigUseCase;
  final GetShippingRatesUseCase _getRatesUseCase;
  final SaveShippingConfigUseCase _saveConfigUseCase;
  final SaveShippingRatesUseCase _saveRatesUseCase;
  final SplitShippingRateUseCase _splitRateUseCase;
  final DeleteAndMergeShippingRateUseCase _deleteAndMergeRateUseCase;
  final EditShippingRateUseCase _editRateUseCase;

  ShippingAdminCubit({
    required GetShippingConfigUseCase getConfigUseCase,
    required GetShippingRatesUseCase getRatesUseCase,
    required SaveShippingConfigUseCase saveConfigUseCase,
    required SaveShippingRatesUseCase saveRatesUseCase,
    required SplitShippingRateUseCase splitRateUseCase,
    required DeleteAndMergeShippingRateUseCase deleteAndMergeRateUseCase,
    required EditShippingRateUseCase editRateUseCase,
  }) : _getConfigUseCase = getConfigUseCase,
       _getRatesUseCase = getRatesUseCase,
       _saveConfigUseCase = saveConfigUseCase,
       _saveRatesUseCase = saveRatesUseCase,
       _splitRateUseCase = splitRateUseCase,
       _deleteAndMergeRateUseCase = deleteAndMergeRateUseCase,
       _editRateUseCase = editRateUseCase,
       super(const ShippingAdminState());

  Future<void> loadData(String branchId) async {
    emit(state.copyWith(isLoading: true, error: null, successMessage: null));

    final configResult = await _getConfigUseCase.execute(branchId).run();
    final ratesResult = await _getRatesUseCase.execute(branchId).run();

    if (configResult.isLeft()) {
      final errorMessage = configResult.match(
        (failure) => translateFailure(failure),
        (_) => '',
      );
      emit(
        state.copyWith(isLoading: false, error: 'Error Config: $errorMessage'),
      );
      return;
    }

    if (ratesResult.isLeft()) {
      final errorMessage = ratesResult.match(
        (failure) => translateFailure(failure),
        (_) => '',
      );
      emit(
        state.copyWith(isLoading: false, error: 'Error Tarifas: $errorMessage'),
      );
      return;
    }

    final config = configResult.getRight().toNullable();
    final rates = ratesResult.getRight().toNullable() ?? [];

    emit(
      state.copyWith(
        isLoading: false,
        config: config,
        rates: rates,
        tempRadiusKm: config?.maxRadiusKm ?? 10.0,
        tempRequireZipCode: config?.requireZipCodeValidation ?? false,
        tempFreeShippingAmount: config?.minAmountForFreeShipping,
      ),
    );
  }

  Future<void> saveConfig({
    required AppUser currentUser,
    required ShippingConfig config,
  }) async {
    emit(state.copyWith(isLoading: true, error: null, successMessage: null));

    final result = await _saveConfigUseCase
        .execute(currentUser: currentUser, config: config)
        .run();

    result.fold(
      (failure) {
        debugPrint('SAVE SHIPPING CONFIG ERROR: $failure'); // 👈 temporal
        emit(
          state.copyWith(isLoading: false, error: translateFailure(failure)),
        );
      },
      (_) => emit(
        state.copyWith(
          isLoading: false,
          config: config,
          successMessage: 'Configuración guardada correctamente.',
        ),
      ),
    );
  }


  Future<void> saveRates({
    required AppUser currentUser,
    required String branchId,
    required List<ShippingRate> rates,
  }) async {
    if (state.processingRateId != null || state.isLoading) return;

    final maxRadiusKm = state.config?.maxRadiusKm ?? state.tempRadiusKm;

    emit(state.copyWith(isLoading: true, error: null, successMessage: null));

    final result = await _saveRatesUseCase
        .execute(
          currentUser: currentUser,
          branchId: branchId,
          rates: rates,
          maxRadiusKm: maxRadiusKm,
        )
        .run();

    // 1. Si falla el guardado, detener el flujo.
    if (result.isLeft()) {
      final message = result.match(
        (failure) => translateFailure(failure),
        (_) => '',
      );

      emit(
        state.copyWith(isLoading: false, error: message, successMessage: null),
      );

      return;
    }

    // 2. Recargar y esperar a que termine.
    await loadData(branchId);

    // 3. No mostrar éxito si falló la recarga.
    if (state.error != null) {
      return;
    }

    // 4. Confirmar la operación.
    emit(
      state.copyWith(
        isLoading: false,
        error: null,
        successMessage: 'Tarifas guardadas correctamente.',
      ),
    );
  }

  Future<void> splitRate({
    required AppUser currentUser,
    required String branchId,
    required String rateId,
    required String name,
    required double minKm,
    required double maxKm,
    required int costInCents,
  }) async {
    if (state.isLoading || state.processingRateId != null) return;

    emit(state.copyWith(error: null, successMessage: null));

    final result = await _splitRateUseCase
        .execute(
          currentUser: currentUser,
          branchId: branchId,
          rates: state.rates,
          rateId: rateId,
          name: name,
          minKm: minKm,
          maxKm: maxKm,
          costInCents: costInCents,
        )
        .run();

    if (result.isLeft()) {
      final message = result.match(
        (failure) => translateFailure(failure),
        (_) => '',
      );

      emit(state.copyWith(error: message, successMessage: null));
      return;
    }

    final updatedRates = result.getRight().toNullable();

    if (updatedRates == null) {
      emit(
        state.copyWith(error: 'No se pudieron preparar las nuevas tarifas.'),
      );
      return;
    }

    await saveRates(
      currentUser: currentUser,
      branchId: branchId,
      rates: updatedRates,
    );
  }

  Future<void> deleteAndMergeRate({
    required AppUser currentUser,
    required String branchId,
    required String rateId,
  }) async {
    if (state.isLoading || state.processingRateId != null) return;

    emit(state.copyWith(error: null, successMessage: null));

    final result = await _deleteAndMergeRateUseCase
        .execute(
          currentUser: currentUser,
          branchId: branchId,
          rates: state.rates,
          rateId: rateId,
        )
        .run();

    if (result.isLeft()) {
      final message = result.match(
        (failure) => translateFailure(failure),
        (_) => '',
      );

      emit(state.copyWith(error: message, successMessage: null));

      return;
    }

    final updatedRates = result.getRight().toNullable();

    if (updatedRates == null) {
      emit(
        state.copyWith(
          error: 'No se pudieron reorganizar las tarifas.',
          successMessage: null,
        ),
      );
      return;
    }

    await saveRates(
      currentUser: currentUser,
      branchId: branchId,
      rates: updatedRates,
    );
  }

  Future<void> editRate({
    required AppUser currentUser,
    required String branchId,
    required String rateId,
    required String name,
    required double minKm,
    required double maxKm,
    required double maxRadiusKm,
    required int costInCents,
  }) async {
    if (state.isLoading || state.processingRateId != null) return;

    emit(state.copyWith(error: null, successMessage: null));

    final result = await _editRateUseCase
        .execute(
          currentUser: currentUser,
          branchId: branchId,
          rates: state.rates,
          rateId: rateId,
          name: name,
          minKm: minKm,
          maxKm: maxKm,
          maxRadiusKm: maxRadiusKm,
          costInCents: costInCents,
        )
        .run();

    if (result.isLeft()) {
      final message = result.match(
        (failure) => translateFailure(failure),
        (_) => '',
      );

      emit(state.copyWith(error: message, successMessage: null));

      return;
    }

    final updatedRates = result.getRight().toNullable();

    if (updatedRates == null) {
      emit(
        state.copyWith(
          error: 'No se pudieron actualizar los datos de la tarifa.',
          successMessage: null,
        ),
      );
      return;
    }

    await saveRates(
      currentUser: currentUser,
      branchId: branchId,
      rates: updatedRates,
    );
  }

  void changeRadius(double newRadius) {
    emit(state.copyWith(tempRadiusKm: newRadius));
  }

  void toggleZipCodeValidation(bool value) {
    emit(state.copyWith(tempRequireZipCode: value));
  }

  void changeFreeShippingAmount(int? amount) {
    emit(state.copyWith(tempFreeShippingAmount: amount));
  }

  void initializeWithExistingConfig(ShippingConfig? config) {
    if (config == null) return;
    emit(
      state.copyWith(
        config: config,
        tempRequireZipCode: config.requireZipCodeValidation,
        tempRadiusKm: config.maxRadiusKm,
        tempFreeShippingAmount: config.minAmountForFreeShipping,
      ),
    );
  }
}
