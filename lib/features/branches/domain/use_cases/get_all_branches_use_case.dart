import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/repositories/branch_repository.dart';

class GetAllBranchesUseCase {
  final BranchRepository repository;

  GetAllBranchesUseCase(this.repository);

  ResultTask<List<Branch>> execute() {
    return repository.getAll();
  }
}