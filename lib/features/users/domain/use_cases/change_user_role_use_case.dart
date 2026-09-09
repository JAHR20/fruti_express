import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/enums/user_role.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/repositories/user_repository.dart';

class ChangeUserRoleUseCase {
  final UserRepository repository;

  ChangeUserRoleUseCase(this.repository);

  ResultTask<Profile> execute({
    required Profile currentUser,
    required String targetUserId,
    required UserRole newRole,
    String? assignedBranchId,
  }) {
    return TaskEither.Do(($) async {
      final targetUser = await $(repository.getById(targetUserId));

      await $(_validateLastAdmin(targetUser, newRole));

      final updatedProfile = await $(
        _processRoleChange(
          editor: currentUser,
          target: targetUser,
          newRole: newRole,
          branchId: assignedBranchId,
        ),
      );

      return await $(repository.update(updatedProfile));
    });
  }

  ResultTask<Unit> _validateLastAdmin(Profile target, UserRole newRole) {
    if (target.isAdmin && newRole != UserRole.admin) {
      return repository.countActiveAdmins().flatMap(
        (total) => total > 1
            ? TaskEither.right(unit)
            : TaskEither.left(
                const Failure.validation(FailureCode.mustHaveOneActiveAdmin),
              ),
      );
    }
    return TaskEither.right(unit);
  }

  ResultTask<Profile> _processRoleChange({
    required Profile editor,
    required Profile target,
    required UserRole newRole,
    String? branchId,
  }) {
    switch (newRole) {
      case UserRole.admin:
        return _assignAdmin(editor, target);
      case UserRole.manager:
        return _assignManager(editor, target, branchId);
      case UserRole.deliveryPerson:
        return _assignDeliveryPerson(editor, target, branchId);
      default:
        return _assignBasicRole(editor, target, newRole);
    }
  }

  ResultTask<Profile> _assignAdmin(Profile editor, Profile target) =>
      editor.canMakeUserAdmin
      ? TaskEither.right(target.copyWith(role: UserRole.admin, branchId: null))
      : TaskEither.left(
          const Failure.unauthorized(FailureCode.onlyAdminCanAssignRole),
        );

  ResultTask<Profile> _assignManager(
    Profile editor,
    Profile target,
    String? branchId,
  ) {
    if (!editor.canMakeUserManager) {
      return TaskEither.left(
        const Failure.unauthorized(FailureCode.onlyAdminCanAssignManagers),
      );
    }
    if (branchId == null) {
      return TaskEither.left(
        const Failure.validation(FailureCode.branchMustBeSpecified),
      );
    }

    return repository
        .managerExistsInBranch(branchId)
        .flatMap(
          (exists) => exists
              ? TaskEither.left(
                  const Failure.alreadyExists(
                    FailureCode.branchAlreadyHasManager,
                  ),
                )
              : TaskEither.right(
                  target.copyWith(role: UserRole.manager, branchId: branchId),
                ),
        );
  }

  ResultTask<Profile> _assignDeliveryPerson(
    Profile editor,
    Profile target,
    String? branchId,
  ) {
    if (branchId == null) {
      return TaskEither.left(
        const Failure.validation(FailureCode.branchMissingForDeliveryPerson),
      );
    }

    return editor.canAssignDeliveryPersonToBranch(branchId)
        ? TaskEither.right(
            target.copyWith(role: UserRole.deliveryPerson, branchId: branchId),
          )
        : TaskEither.left(
            const Failure.unauthorized(FailureCode.noPermissionInBranch),
          );
  }

  ResultTask<Profile> _assignBasicRole(
    Profile editor,
    Profile target,
    UserRole role,
  ) => editor.isAdmin
      ? TaskEither.right(target.copyWith(role: role, branchId: null))
      : TaskEither.left(
          const Failure.unauthorized(FailureCode.noPermissionToAssignRole),
        );
}
