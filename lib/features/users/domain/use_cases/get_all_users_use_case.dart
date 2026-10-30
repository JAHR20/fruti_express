import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/repositories/user_repository.dart';

class GetAllUsersUseCase {
  final UserRepository repository;

  GetAllUsersUseCase(this.repository);

  ResultTask<List<AppUser>> execute(AppUser currentUser) {
    return TaskEither.Do(($) async {
      if (!currentUser.isAdmin) {
        return await $(
          TaskEither<Failure, List<AppUser>>.left(
            const Failure.unauthorized(FailureCode.accessDeniedAdminOnlyGlobalList), 
          ),
        );
      }

      return await $(repository.getAll()); 
    });
  }
}