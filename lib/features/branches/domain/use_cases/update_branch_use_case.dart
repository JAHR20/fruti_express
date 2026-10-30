import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/repositories/branch_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';

class UpdateBranchUseCase {
  final BranchRepository repository;

  UpdateBranchUseCase(this.repository);

  ResultTask<Branch> execute({
    required AppUser currentUser,
    required Branch modifiedBranch,
  }) {
    return TaskEither.Do(($) async {
      if (!currentUser.isAdmin) {
        return await $(
          TaskEither.left(const Failure.unauthorized(FailureCode.noPermissionToPerformAction)),
        );
      }

      final original = await $(repository.getById(modifiedBranch.id));
      if (original == null) {
        return await $(
          TaskEither.left(const Failure.server(FailureCode.branchNotFound)),
        );
      }

      if (modifiedBranch.latitude == null || modifiedBranch.longitude == null) {
        return await $(
          TaskEither.left(const Failure.validation(FailureCode.locationCoordinatesRequired)),
        );
      }

      return await $(repository.update(modifiedBranch));
    });
  }
}