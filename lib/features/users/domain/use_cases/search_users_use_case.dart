import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/repositories/user_repository.dart';

class SearchUsersUseCase {
  final UserRepository repository;
  
  SearchUsersUseCase(this.repository);

  ResultTask<List<AppUser>> execute({
    required AppUser currentUser,
    required String query,
  }) {
    if (!currentUser.isStaff) { 
      return TaskEither<Failure, List<AppUser>>.left(
        const Failure.unauthorized(FailureCode.accessDenied),
      );
    }

    if (query.trim().isEmpty) {
      return TaskEither<Failure, List<AppUser>>.right([]);
    }

    return repository.searchUsers(query); 
  }
}