import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/promo_banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/repositories/promo_banner_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';

class GetAllPromoBannersUseCase { 
  final PromoBannerRepository _repository;
  GetAllPromoBannersUseCase(this._repository);

  ResultTask<List<PromoBanner>> execute({required Profile currentUser}) {
    return TaskEither.Do(($) async {
      if (!currentUser.isStaff) { 
        return await $(TaskEither.left(
          const Failure.unauthorized(FailureCode.permissionDenied),
        ));
      }
      return await $(_repository.getAllBanners()); 
    });
  }
}
