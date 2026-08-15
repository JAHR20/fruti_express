import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/data/models/perfil_model.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/repositories/usuario_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/data/datasources/usuario_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/enums/tipo_usuario.dart';

class UsuarioRepositoryImpl with SupabaseHandleException implements UsuarioRepository {
  final UsuarioRemoteDatasource remoteDatasource;

  UsuarioRepositoryImpl(this.remoteDatasource);

  @override
  ResultTask<List<Perfil>> obtenerTodos() {
    return TaskEither.tryCatch(() async {
      final models = await remoteDatasource.obtenerTodos();
      return models.map((m) => m.toDomain()).toList();
    }, handleException);
  }

  @override
  ResultTask<Perfil> obtenerPorId(String id) {
    return TaskEither.tryCatch(() async {
      final model = await remoteDatasource.obtenerPorId(id);
      if (model == null) {
        throw const PostgrestException(message: 'No encontrado', code: '404');
      }
      return model.toDomain();
    }, handleException);
  }

  @override
  ResultTask<List<Perfil>> buscarUsuarios(String query) {
    return TaskEither.tryCatch(() async {
      final models = await remoteDatasource.buscarUsuarios(query);
      return models.map((m) => m.toDomain()).toList();
    }, handleException);
  }

  @override
  ResultTask<List<Perfil>> obtenerRepartidores({String? sucursalId}) {
    return TaskEither.tryCatch(() async {
      final models = await remoteDatasource.obtenerRepartidores(
        sucursalId: sucursalId,
      );
      return models.map((m) => m.toDomain()).toList();
    }, handleException);
  }

  @override
  ResultTask<int> contarAdminsActivos() {
    return TaskEither.tryCatch(
      () async =>
          remoteDatasource.contarPorRolYEstado(rol: 'admin', activo: true),
      handleException,
    );
  }

  @override
  ResultTask<bool> existeEncargadoEnSucursal(String sucursalId) {
    return TaskEither.tryCatch(
      () async => remoteDatasource.existeEncargadoEnSucursal(sucursalId),
      handleException,
    );
  }

  @override
  ResultTask<List<Perfil>> obtenerClientesQueHanCompradoEnSucursal(
    String sucursalId,
  ) {
    return TaskEither.tryCatch(() async {
      final models = await remoteDatasource.obtenerPorSucursal(sucursalId);
      return models.map((m) => m.toDomain()).toList();
    }, handleException);
  }

  @override
  ResultTask<Perfil> actualizar(Perfil usuario) {
    return TaskEither.tryCatch(() async {
      final model = PerfilModelX.fromDomain(usuario);
      final updated = await remoteDatasource.actualizarPerfil(model);
      return updated.toDomain();
    }, handleException);
  }

  @override
  ResultTask<Perfil> cambiarEstado({required String id, required bool activo}) {
    return TaskEither.tryCatch(() async {
      final model = await remoteDatasource.cambiarEstado(
        id: id,
        activo: activo,
      );
      return model.toDomain();
    }, handleException);
  }

  @override
  ResultTask<Perfil> cambiarRol({
    required String id,
    required TipoUsuario nuevoRol,
  }) {
    return TaskEither.tryCatch(() async {
      final model = await remoteDatasource.cambiarRol(
        id: id,
        rol: nuevoRol.name,
      );
      return model.toDomain();
    }, handleException);
  }
}
