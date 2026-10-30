import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/repositories/branch_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';

class ChangeBranchStatusUseCase {
  final BranchRepository repository;

  ChangeBranchStatusUseCase(this.repository);

  ResultTask<Branch> execute({
    required AppUser currentUser,
    required String branchId,
    required bool newState,
  }) {
    return TaskEither.Do(($) async {
      if (!currentUser.isAdmin) {
        return await $(
          TaskEither.left(const Failure.unauthorized(FailureCode.noPermissionToPerformAction)),
        );
      }

      final branch = await $(repository.getById(branchId));
      if (branch == null) {
        return await $(
          TaskEither.left(const Failure.server(FailureCode.branchNotFound)),
        );
      }

      if (branch.active == newState) {
        return await $(
          TaskEither.left(const Failure.validation(FailureCode.branchAlreadyInRequestedState)),
        );
      }

      final updatedBranch = branch.copyWith(active: newState);

      return await $(repository.update(updatedBranch));
    });
  }
}