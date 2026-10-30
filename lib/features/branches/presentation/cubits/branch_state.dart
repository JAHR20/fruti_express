import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart';

part 'branch_state.freezed.dart';

@freezed
abstract class BranchState with _$BranchState {
  const factory BranchState({
    @Default([]) List<Branch> branches,
    @Default(false) bool isLoading,
    String? errorMessage,
    String? branchProcessingId, 
    @Default(<String>{}) Set<String> branchesWithShippingConfigured,
    @Default(<String>{}) Set<String> branchesWithRatesConfigured,
  }) = _BranchState;
}