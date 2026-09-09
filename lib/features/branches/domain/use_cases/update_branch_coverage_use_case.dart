import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/repositories/branch_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';

class UpdateBranchCoverageUseCase {
  final BranchRepository repository;

  UpdateBranchCoverageUseCase(this.repository);

  ResultTask<Unit> execute({
    required Profile currentUser,
    required String branchId,
    required List<String> postalCodes,
  }) {
    if (!currentUser.isAdmin) {
      return TaskEither.left(
        const Failure.unauthorized(FailureCode.noPermissionToPerformAction),
      );
    }

    return repository.updateCoverage(
      branchId: branchId,
      postalCodes: postalCodes,
    );
  }
}