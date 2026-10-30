import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import '../extensions/profile_permissions_extension.dart';
import '../repositories/user_repository.dart';

class GetUserByIdUseCase {
  final UserRepository repository;
  
  GetUserByIdUseCase(this.repository);

  ResultTask<AppUser> execute({ 
    required AppUser requester, 
    required String targetId, 
  }) {
    return TaskEither.Do(($) async {
      final isOwner = requester.id == targetId; 

      if (!isOwner && !requester.isStaff) { 
        return await $(
          TaskEither<Failure, AppUser>.left(
            const Failure.unauthorized(FailureCode.noPermissionToViewOtherProfiles),
          ),
        );
      }

      // Data validation
      if (targetId.trim().isEmpty) {
        return await $(
          TaskEither<Failure, AppUser>.left(
            const Failure.validation(FailureCode.emptySearchId),
          ),
        );
      }

      return await $(repository.getById(targetId));
    });
  }
}