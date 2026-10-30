import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/promo_banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/repositories/promo_banner_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';

class CreatePromoBannerUseCase { 
  final PromoBannerRepository _repository;
  CreatePromoBannerUseCase(this._repository);

  ResultTask<PromoBanner> execute({
    required AppUser currentUser,
    required PromoBanner banner,
    File? imageFile,
  }) {
    return TaskEither.Do(($) async {
      // 1. Validar permisos
      if (!currentUser.isStaff) {
        return await $(TaskEither.left(
          const Failure.unauthorized(FailureCode.permissionDenied),
        ));
      }

      String? finalImageUrl = banner.imageUrl;

      if (imageFile != null) {
        final realExtension = imageFile.path.split('.').last.toLowerCase();
        final uniqueName = 'banner_${DateTime.now().millisecondsSinceEpoch}.$realExtension';
        final url = await $(_repository.uploadImage(imageFile, uniqueName));
        finalImageUrl = url;
      }
      final finalBanner = banner.copyWith(imageUrl: finalImageUrl);

      return await $(_repository.create(finalBanner)); 
    });
  }
}