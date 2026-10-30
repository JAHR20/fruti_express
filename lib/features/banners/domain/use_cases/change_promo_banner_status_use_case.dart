import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/repositories/promo_banner_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';

class ChangePromoBannerStatusUseCase { 
  final PromoBannerRepository _repository;
  ChangePromoBannerStatusUseCase(this._repository);

  ResultTask<Unit> execute({
    required AppUser currentUser,
    required String id,
    required bool isActive, 
  }) {
    return TaskEither.Do(($) async {
      if (!currentUser.isStaff) {
        return await $(TaskEither.left(
          const Failure.unauthorized(FailureCode.permissionDenied),
        ));
      }
      return await $(_repository.changeStatus(id, isActive)); 
    });
  }
}