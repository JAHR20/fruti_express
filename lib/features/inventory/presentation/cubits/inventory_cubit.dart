import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/failure_translator.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/use_cases/get_inventory_by_branch_use_case.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/use_cases/increase_stock_use_case.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/use_cases/decrease_stock_use_case.dart';

import 'inventory_state.dart';

class InventoryCubit extends Cubit<InventoryState> {
  final GetInventoryByBranchUseCase _getInventoryByBranchUseCase;
  final IncreaseStockUseCase _increaseStockUseCase;
  final DecreaseStockUseCase _decreaseStockUseCase;

  InventoryCubit({
    required GetInventoryByBranchUseCase getInventoryByBranchUseCase,
    required IncreaseStockUseCase increaseStockUseCase,
    required DecreaseStockUseCase decreaseStockUseCase,
  }) : _getInventoryByBranchUseCase = getInventoryByBranchUseCase,
       _increaseStockUseCase = increaseStockUseCase,
       _decreaseStockUseCase = decreaseStockUseCase,
       super(const InventoryState());

  Future<void> loadInventory(String branchId) async {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        operationError: null,
        branchId: branchId,
      ),
    );

    final result = await _getInventoryByBranchUseCase
        .execute(branchId: branchId)
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false, 
            errorMessage: translateFailure(failure),
          ),
        );
      },
      (inventory) {
        emit(
          state.copyWith(
            isLoading: false,
            inventory: inventory,
            errorMessage: null,
            branchId: branchId,
          ),
        );
      },
    );
  }

  Future<void> adjustManualStock({
    required Profile currentUser,
    required String productId,
    required String branchId,
    required int quantity,
    required bool isIncrease, // esAumento -> isIncrease
  }) async {
    emit(
      state.copyWith(
        processingProductId: productId,
        operationError: null,
        operationSuccessful: false,
      ),
    );

    final result = isIncrease
        ? await _increaseStockUseCase
              .execute(
                currentUser: currentUser,
                productId: productId,
                branchId: branchId,
                quantity: quantity,
              )
              .run()
        : await _decreaseStockUseCase
              .execute(
                currentUser: currentUser,
                productId: productId,
                branchId: branchId,
                quantity: quantity,
              )
              .run();

    await result.fold(
      (failure) async {
        emit(
          state.copyWith(
            processingProductId: null,
            operationError: translateFailure(failure),
            operationSuccessful: false,
          ),
        );
      },

      (_) async {
        emit(
          state.copyWith(
            processingProductId: null,
            operationError: null,
            operationSuccessful: true,
          ),
        );

        await loadInventory(branchId);

        // Limpiamos la bandera de éxito para futuros eventos en la UI
        emit(state.copyWith(operationSuccessful: false));
      },
    );
  }

  void clearOperationError() {
    emit(state.copyWith(operationError: null));
  }

  void clearError() {
    emit(state.copyWith(errorMessage: null));
  }
}