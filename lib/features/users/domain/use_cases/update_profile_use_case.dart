import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/repositories/user_repository.dart';
import '../entities/profile.dart'; 

class UpdateProfileUseCase {
  final UserRepository repository;
  
  UpdateProfileUseCase(this.repository);

  ResultTask<Profile> execute({ 
    required Profile requester, 
    required Profile profileToEdit,
  }) {
    return TaskEither.Do(($) async {
      
      final isOwner = requester.id == profileToEdit.id;

      if (!isOwner && !requester.isAdmin) { 
        return await $(
          TaskEither<Failure, Profile>.left(
            const Failure.unauthorized(FailureCode.noPermissionToPerformAction),
          ),
        );
      }

      return await $(repository.update(profileToEdit)); 
    });
  }
}