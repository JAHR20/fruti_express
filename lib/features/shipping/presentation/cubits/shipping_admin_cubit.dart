import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/failure_translator.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_config.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_rate.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart'; 

import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/get_shipping_config_use_case.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/get_shipping_rates_use_case.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/save_shipping_config_use_case.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/save_shipping_rate_use_case.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/delete_shipping_rate_use_case.dart';

import 'shipping_admin_state.dart';

class ShippingAdminCubit extends Cubit<ShippingAdminState> { 
  final GetShippingConfigUseCase _getConfig;
  final GetShippingRatesUseCase _getRates;
  final SaveShippingConfigUseCase _saveConfig;
  final SaveShippingRateUseCase _saveRate;
  final DeleteShippingRateUseCase _deleteRate;

  ShippingAdminCubit({
    required GetShippingConfigUseCase getConfig,
    required GetShippingRatesUseCase getRates,
    required SaveShippingConfigUseCase saveConfig,
    required SaveShippingRateUseCase saveRate,
    required DeleteShippingRateUseCase deleteRate,
  }) : _getConfig = getConfig,
       _getRates = getRates,
       _saveConfig = saveConfig,
       _saveRate = saveRate,
       _deleteRate = deleteRate,
       super(const ShippingAdminState());

  Future<void> loadData(String branchId) async {
    emit(state.copyWith(isLoading: true, error: null, successMessage: null));

    final configResult = await _getConfig.execute(branchId).run();
    final ratesResult = await _getRates.execute(branchId).run();

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
    required Profile currentUser, 
    required ShippingConfig config,
  }) async {
    emit(state.copyWith(isLoading: true, error: null, successMessage: null));

    final result = await _saveConfig.execute(
      currentUser: currentUser,
      config: config,
    ).run();

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: translateFailure(failure))),
      (_) => emit(
        state.copyWith(
          isLoading: false,
          config: config,
          successMessage: 'Configuración guardada correctamente.',
        ),
      ),
    );
  }

  Future<void> saveRate({
    required Profile currentUser,
    required ShippingRate rate, 
  }) async {
    emit(
      state.copyWith(
        processingRateId: rate.id,
        error: null,
        successMessage: null,
      ),
    );

    final result = await _saveRate.execute(
      currentUser: currentUser,
      rate: rate,
    ).run();

    result.fold(
      (failure) => emit(
        state.copyWith(processingRateId: null, error: translateFailure(failure)),
      ),
      (_) {
        final index = state.rates.indexWhere((t) => t.id == rate.id);
        final newRates = List<ShippingRate>.from(state.rates);

        if (index >= 0) {
          newRates[index] = rate;
        } else {
          newRates.add(rate);
        }

        newRates.sort(
          (a, b) => a.minDistanceKm.compareTo(b.minDistanceKm),
        );

        emit(
          state.copyWith(
            processingRateId: null,
            rates: newRates,
            successMessage: 'Tarifa guardada correctamente.',
          ),
        );
      },
    );
  }

  Future<void> deleteRate({ 
    required Profile currentUser,
    required String rateId,
  }) async {
    emit(state.copyWith(isLoading: true, error: null, successMessage: null));

    final result = await _deleteRate.execute(
      currentUser: currentUser,
      rateId: rateId,
    ).run();

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: translateFailure(failure))),
      (_) {
        final newRates = state.rates
            .where((t) => t.id != rateId)
            .toList();

        emit(
          state.copyWith(
            isLoading: false,
            rates: newRates,
            successMessage: 'Tarifa eliminada correctamente.',
          ),
        );
      },
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