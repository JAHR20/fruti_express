import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/failure_translator.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/use_cases/get_branches_with_configured_shipping_rates_use_case.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/get_branches_with_configured_shipping_use_case.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/use_cases/change_branch_status_use_case.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/use_cases/get_all_branches_use_case.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/use_cases/watch_branches_use_case.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'branch_state.dart';

class BranchCubit extends Cubit<BranchState> {
  final GetAllBranchesUseCase _getAllBranchesUseCase;
  final ChangeBranchStatusUseCase _changeBranchStatusUseCase;
  final GetBranchesWithConfiguredShippingUseCase
  _getBranchesWithConfiguredShippingUseCase;
  final WatchBranchesUseCase _watchBranchesUseCase;
  final GetBranchesWithConfiguredShippingRatesUseCase
  _getBranchesWithConfiguredShippingRatesUseCase;
  StreamSubscription? _realtimeSubscription;

  BranchCubit({
    required GetAllBranchesUseCase getAllBranchesUseCase,
    required ChangeBranchStatusUseCase changeBranchStatusUseCase,
    required GetBranchesWithConfiguredShippingUseCase
    getBranchesWithConfiguredShippingUseCase,
    required WatchBranchesUseCase watchBranchesUseCase,
    required GetBranchesWithConfiguredShippingRatesUseCase
    getBranchesWithConfiguredShippingRatesUseCase,
  }) : _changeBranchStatusUseCase = changeBranchStatusUseCase,
       _getAllBranchesUseCase = getAllBranchesUseCase,
       _getBranchesWithConfiguredShippingUseCase =
           getBranchesWithConfiguredShippingUseCase,
       _watchBranchesUseCase = watchBranchesUseCase,
       _getBranchesWithConfiguredShippingRatesUseCase =
           getBranchesWithConfiguredShippingRatesUseCase,
       super(const BranchState());

  void startRealtime() {
    if (_realtimeSubscription != null) {
      return;
    }

    _realtimeSubscription = _watchBranchesUseCase.execute().listen((result) {
      if (isClosed) return;

      result.fold(
        (failure) {
          emit(state.copyWith(errorMessage: translateFailure(failure)));
        },
        (branches) {
          emit(state.copyWith(branches: branches, errorMessage: null));
        },
      );
    });
  }

  Future<void> stopRealtime() async {
    await _realtimeSubscription?.cancel();
    _realtimeSubscription = null;
  }

  @override
  Future<void> close() async {
    await stopRealtime();
    return super.close();
  }

  Future<void> loadBranches() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final futureBranches = _getAllBranchesUseCase.execute().run();
    final futureShipments = _getBranchesWithConfiguredShippingUseCase
        .execute()
        .run();
    final futureRates = _getBranchesWithConfiguredShippingRatesUseCase
        .execute()
        .run();
    final resultsBranches = await futureBranches;
    final shippingResults = await futureShipments;
    final ratesResults = await futureRates;

    if (resultsBranches.isLeft()) {
      final message = resultsBranches.match(
        (failure) => translateFailure(failure),
        (_) => '',
      );
      emit(state.copyWith(isLoading: false, errorMessage: message));
      return;
    }

    final list = resultsBranches.getRight().toNullable() ?? [];

    final branchesWithShipping =
        shippingResults.getRight().toNullable() ?? <String>{};

    final branchesWithRates =
        ratesResults.getRight().toNullable() ?? <String>{};

    emit(
      state.copyWith(
        branches: list,
        branchesWithShippingConfigured: branchesWithShipping,
        branchesWithRatesConfigured: branchesWithRates,
        isLoading: false,
        errorMessage: null,
      ),
    );
  }

  Future<void> changeBranchStatus({
    required AppUser currentUser,
    required String branchId,
    required bool newState,
  }) async {
    emit(state.copyWith(branchProcessingId: branchId, errorMessage: null));

    final result = await _changeBranchStatusUseCase
        .execute(
          currentUser: currentUser,
          branchId: branchId,
          newState: newState,
        )
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            branchProcessingId: null,
            errorMessage: translateFailure(failure),
          ),
        );
      },
      (updatedBranch) {
        final newBranches = state.branches.map((branch) {
          if (branch.id == updatedBranch.id) {
            return updatedBranch;
          }
          return branch;
        }).toList();

        emit(
          state.copyWith(
            branches: newBranches,
            branchProcessingId: null,
            errorMessage: null,
          ),
        );
      },
    );
  }
}
