import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/repositories/user_repository.dart';

class ChangeUserStatusUseCase {
  final UserRepository repository;

  ChangeUserStatusUseCase(this.repository);

  ResultTask<Profile> execute({
    required Profile currentUser,
    required String targetUserId,
    required bool activate,
  }) {
    return TaskEither.Do(($) async {
      final targetUser = await $(repository.getById(targetUserId));

      await $(_validatePermissions(currentUser, targetUser));

      await $(_validateStatusChange(targetUser, activate));

      final updatedUser = targetUser.copyWith(active: activate);

      return await $(repository.update(updatedUser));
    });
  }

  ResultTask<Unit> _validatePermissions(Profile actor, Profile target) =>
      actor.canDeactivateReactivateUser(target)
      ? TaskEither.right(unit)
      : TaskEither.left(
          const Failure.unauthorized(FailureCode.noPermissionToPerformAction),
        );

  ResultTask<Unit> _validateStatusChange(Profile target, bool newState) {
    if (target.active == newState) {
      return TaskEither.left(
        Failure.validation(
          newState
              ? FailureCode.userAlreadyActive
              : FailureCode.userAlreadyDeactivated,
        ),
      );
    }
    return TaskEither.right(unit);
  }
}
