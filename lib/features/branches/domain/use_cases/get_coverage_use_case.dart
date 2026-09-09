import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/repositories/branch_repository.dart';

class GetCoverageUseCase {
  final BranchRepository repository;

  GetCoverageUseCase(this.repository);

  ResultTask<List<String>> execute(String branchId) {
    return repository.getCoverage(branchId);
  }
}