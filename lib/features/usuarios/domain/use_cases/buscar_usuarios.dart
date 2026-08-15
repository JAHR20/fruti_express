import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/repositories/usuario_repository.dart';

class BuscarUsuarios {
  final UsuarioRepository repository;
  BuscarUsuarios(this.repository);

  ResultTask<List<Perfil>> ejecutar({
    required Perfil usuarioActual,
    required String query,
  }) {
    if (!usuarioActual.esStaff) {
      return TaskEither<Failure, List<Perfil>>.left(
        const Failure.unauthorized("No tienes permiso para buscar usuarios"),
      );
    }

    if (query.trim().isEmpty) {
      return TaskEither<Failure, List<Perfil>>.right([]);
    }

    return repository.buscarUsuarios(query);
  }
}
