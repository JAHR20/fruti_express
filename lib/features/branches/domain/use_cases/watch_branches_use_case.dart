import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/repositories/branch_repository.dart';

class WatchBranchesUseCase {
  final BranchRepository repository;

  WatchBranchesUseCase(this.repository);

  ResultStream<List<Branch>> execute() => repository.watchAll();
}