import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/failure_translator.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_config.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/get_shipping_config_use_case.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart';

import 'customer_shipping_state.dart';

class CustomerShippingCubit extends Cubit<CustomerShippingState> { 
  final GetShippingConfigUseCase _getConfig; 

  CustomerShippingCubit({
    required GetShippingConfigUseCase getConfig,
  }) : _getConfig = getConfig,
       super(const CustomerShippingState());

  Future<void> loadBranchConfigurations(List<Branch> branches) async { 
    if (branches.isEmpty) return;

    emit(state.copyWith(isLoading: true, error: null));

    final List<ShippingConfig> downloadedConfigs = [];
    String? lastError; 

    for (var branch in branches) { 
      final result = await _getConfig.execute(branch.id).run();

      result.fold(
        (failure) {
          lastError = translateFailure(failure);
        },
        (config) {
          if (config != null) {
            downloadedConfigs.add(config);
          }
        },
      );
    }
    
    emit(
      state.copyWith(
        isLoading: false,
        configs: downloadedConfigs,
        error: lastError,
      ),
    );
  }
}