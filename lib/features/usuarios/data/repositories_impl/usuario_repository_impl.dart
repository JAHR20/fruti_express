import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/repositories/usuario_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/data/datasources/usuario_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/enums/tipo_usuario.dart';

class UsuarioRepositoryImpl implements UsuarioRepository {
  final UsuarioRemoteDatasource remoteDatasource;

  UsuarioRepositoryImpl(this.remoteDatasource);

  @override
  ResultTask<List<Perfil>> obtenerTodos() {
    return TaskEither.tryCatch(
      () async => await remoteDatasource.obtenerTodos(),
      _handleException,
    );
  }

  @override
  ResultTask<Perfil> obtenerPorId(String id) {
    return TaskEither.tryCatch(() async {
      final res = await remoteDatasource.obtenerPorId(id);
      if (res == null) {
        throw const PostgrestException(message: 'No encontrado', code: '404');
      }
      return res;
    }, _handleException);
  }

  @override
  ResultTask<List<Perfil>> buscarUsuarios(String query) {
    return TaskEither.tryCatch(
      () async => await remoteDatasource.buscarUsuarios(query),
      _handleException,
    );
  }

  @override
  ResultTask<List<Perfil>> obtenerRepartidores({String? sucursalId}) {
    return TaskEither.tryCatch(
      () async =>
          await remoteDatasource.obtenerRepartidores(sucursalId: sucursalId),
      _handleException,
    );
  }

  @override
  ResultTask<int> contarAdminsActivos() {
    return TaskEither.tryCatch(
      () async => await remoteDatasource.contarPorRolYEstado(
        rol: 'admin',
        activo: true,
      ),
      _handleException,
    );
  }

  @override
  ResultTask<bool> existeEncargadoEnSucursal(String sucursalId) {
    return TaskEither.tryCatch(
      () async => await remoteDatasource.existeEncargadoEnSucursal(sucursalId),
      _handleException,
    );
  }

  @override
  ResultTask<List<Perfil>> obtenerClientesQueHanCompradoEnSucursal(
    String sucursalId,
  ) {
    return TaskEither.tryCatch(
      () async => await remoteDatasource.obtenerPorSucursal(sucursalId),
      _handleException,
    );
  }

  @override
  ResultTask<Perfil> actualizar(Perfil usuario) {
    return TaskEither.tryCatch(
      () async => await remoteDatasource.actualizarPerfil(usuario),
      _handleException,
    );
  }

  @override
  ResultTask<Perfil> cambiarEstado({required String id, required bool activo}) {
    return TaskEither.tryCatch(
      () async => await remoteDatasource.cambiarEstado(id: id, activo: activo),
      _handleException,
    );
  }

  @override
  ResultTask<Perfil> cambiarRol({
    required String id,
    required TipoUsuario nuevoRol,
  }) {
    return TaskEither.tryCatch(
      () async => await remoteDatasource.cambiarRol(id: id, rol: nuevoRol.name),
      _handleException,
    );
  }

  // --- 🛠️ MANEJO DE ERRORES ---
  Failure _handleException(Object error, StackTrace stackTrace) {
    if (error is PostgrestException) {
      if (error.code == '404') {
        return const Failure.notFound("El usuario no existe.");
      }
      if (error.code == '42501') {
        return const Failure.unauthorized(
          "No tienes permisos para esta acción.",
        );
      }
      if (error.code == '23505') {
        return const Failure.alreadyExists("Este registro ya existe.");
      }
      return Failure.server("Error de base de datos: ${error.message}");
    }
    return Failure.server("Ocurrió un error inesperado: $error");
  }
}
