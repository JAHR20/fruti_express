import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/repositories/promo_banner_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart'; // Perfil -> Profile
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';

class DeletePromoBannerUseCase { // EliminarBanner -> DeletePromoBannerUseCase
  final PromoBannerRepository _repository;
  DeletePromoBannerUseCase(this._repository);

  ResultTask<Unit> execute({ // ejecutar -> execute
    required Profile currentUser, // usuarioActual -> currentUser
    required String id,
  }) {
    return TaskEither.Do(($) async {
      // validamos que solo el admin pueda Eliminar el banner
      if (!currentUser.isAdmin) { // esAdmin -> isAdmin
        return await $(TaskEither.left(
          // Sugerencia: Usa un código específico para Admin
          const Failure.unauthorized(FailureCode.adminRoleRequired), 
        ));
      }
      return await $(_repository.delete(id)); // eliminar -> delete
    });
  }
}