import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

class CheckAuthStatusUseCase {
  final AuthRepository repository;

  CheckAuthStatusUseCase(this.repository);

  ResultTask<Perfil?> call() {
    return repository.obtenerUsuarioActual();
  }
}
