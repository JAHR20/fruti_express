import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/repositories/branch_repository.dart';

class GetBranchesWithConfiguredShippingRatesUseCase {
  final BranchRepository _repository;

  GetBranchesWithConfiguredShippingRatesUseCase(this._repository);

  ResultTask<Set<String>> execute() => _repository.getBranchesWithConfiguredRates();
}