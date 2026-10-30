import 'package:fruti_express_jahr_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';

class AuthStateChangesUseCase {
  final AuthRepository repository;
  AuthStateChangesUseCase(this.repository);

  Stream<AppUser?> call() => repository.authStateChanges;
}