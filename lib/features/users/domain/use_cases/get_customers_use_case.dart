import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/enums/user_role.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/repositories/user_repository.dart';

class GetCustomersUseCase {
  final UserRepository repository;

  GetCustomersUseCase(this.repository);

  ResultTask<List<AppUser>> execute(AppUser currentUser) {
    return TaskEither.Do(($) async {
      if (!currentUser.isStaff) {
        return await $(
          TaskEither<Failure, List<AppUser>>.left(
            const Failure.unauthorized(FailureCode.noPermissionToViewCustomers),
          ),
        );
      }

      if (currentUser.isAdmin) {
        final allUsers = await $(repository.getAll());
        final customersOnly = allUsers
            .where((user) => user.role == UserRole.customer)
            .toList();

        return customersOnly;
      }

      if (currentUser.isManager) {
        final branchId = currentUser.branchId;

        if (branchId == null) {
          return await $(
            TaskEither<Failure, List<AppUser>>.left(
              const Failure.validation(FailureCode.managerProfileHasNoBranch),
            ),
          );
        }

        return await $(repository.getCustomersWhoBoughtInBranch(branchId));
      }

      return await $(
        TaskEither<Failure, List<AppUser>>.left(
          const Failure.unauthorized(FailureCode.accessDenied),
        ),
      );
    });
  }
}
