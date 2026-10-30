import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/user_profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/repositories/user_repository.dart';

class UpdateProfileUseCase {
  final UserRepository repository;

  UpdateProfileUseCase(this.repository);

  ResultTask<UserProfile> execute({
    required AppUser requester,        // 👈 antes era UserProfile, ahora AppUser (para checar rol)
    required UserProfile profileToEdit,
  }) {
    return TaskEither.Do(($) async {
      final isOwner = requester.id == profileToEdit.id; // AppUser.id == UserProfile.id, coinciden por diseño

      if (!isOwner && !requester.isAdmin) { // 👈 ahora sí existe, porque requester es AppUser
        return await $(
          TaskEither<Failure, UserProfile>.left(
            const Failure.unauthorized(FailureCode.noPermissionToPerformAction),
          ),
        );
      }

      return await $(repository.update(profileToEdit));
    });
  }
}