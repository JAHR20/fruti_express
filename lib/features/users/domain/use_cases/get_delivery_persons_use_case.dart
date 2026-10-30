import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';
import '../repositories/user_repository.dart';

class GetDeliveryPersonsUseCase { 
  final UserRepository repository;
  
  GetDeliveryPersonsUseCase(this.repository);

  ResultTask<List<AppUser>> call({
    required AppUser requester,
    String? optionalBranchId,
  }) {
    if (!requester.isStaff) {
      return TaskEither.left(
        const Failure.unauthorized(FailureCode.noPermissionToViewDeliveryPersons),
      );
    }

    if (requester.isManager) {
      final myBranch = requester.branchId;

      if (myBranch == null || myBranch.isEmpty) {
        return TaskEither.left(
          const Failure.validation(FailureCode.managerProfileHasNoBranch),
        );
      }
      return repository.getDeliveryPersons(branchId: myBranch);
    }

    return repository.getDeliveryPersons(branchId: optionalBranchId);
  }
}