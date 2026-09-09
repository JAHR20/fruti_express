import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import '../entities/profile.dart';
import '../extensions/profile_permissions_extension.dart';
import '../repositories/user_repository.dart';

class ManagerExistsInBranchUseCase { 
  final UserRepository repository;
  
  ManagerExistsInBranchUseCase(this.repository);
  
  ResultTask<bool> execute({
    required Profile requester,
    required String branchId,
  }) {
    return TaskEither.Do(($) async {
      if (!requester.isAdmin) {
        return await $(
          TaskEither<Failure, bool>.left(
            const Failure.unauthorized(FailureCode.noPermissionToPerformAction),
          ),
        );
      }

      if (branchId.trim().isEmpty) {
        return await $(
          TaskEither<Failure, bool>.left(
            const Failure.validation(FailureCode.branchMustBeSpecified),
          ),
        );
      }

      return await $(repository.managerExistsInBranch(branchId));
    });
  }
}