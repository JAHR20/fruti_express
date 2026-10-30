import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/repositories/branch_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';

class CreateBranchUseCase {
  final BranchRepository repository;

  CreateBranchUseCase(this.repository);

  ResultTask<Branch> execute({
    required AppUser currentUser,
    required String name,
    required String street,
    required String exteriorNumber,
    required String postalCode,
    required String neighborhood,
    required String municipality,
    required String state,
    required double? latitude,
    required double? longitude,
  }) {
    final cleanName = name.trim();

    return TaskEither.Do(($) async {
      if (!currentUser.isAdmin) {
        return await $(
          TaskEither.left(const Failure.unauthorized(FailureCode.noPermissionToPerformAction)),
        );
      }

      if (cleanName.isEmpty ||
          street.trim().isEmpty ||
          exteriorNumber.trim().isEmpty ||
          postalCode.trim().isEmpty ||
          neighborhood.trim().isEmpty ||
          municipality.trim().isEmpty ||
          state.trim().isEmpty) {
        return await $(
          TaskEither.left(const Failure.validation(FailureCode.missingRequiredFields)),
        );
      }

      if (latitude == null || longitude == null) {
        return await $(
          TaskEither.left(const Failure.validation(FailureCode.locationCoordinatesRequired)),
        );
      }

      final existing = await $(repository.getByName(cleanName));
      if (existing != null) {
        return await $(
          TaskEither.left(const Failure.alreadyExists(FailureCode.branchNameAlreadyExists)),
        );
      }

      final newBranch = Branch(
        id: '',
        name: cleanName,
        street: street.trim(),
        exteriorNumber: exteriorNumber.trim(),
        postalCode: postalCode.trim(),
        neighborhood: neighborhood.trim(),
        municipality: municipality.trim(),
        state: state.trim(),
        active: true,
        creationDate: DateTime.now(),
        latitude: latitude,
        longitude: longitude,
      );

      return await $(repository.create(newBranch));
    });
  }
}