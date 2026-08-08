import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/enums/tipo_usuario.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/use_cases/actualizar_perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/use_cases/buscar_usuarios.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/use_cases/cambiar_estado_usuario.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/use_cases/cambiar_rol_usuario.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/use_cases/contar_admins_activos.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/use_cases/existe_encargado_en_sucursal.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/use_cases/obtener_clientes.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/use_cases/obtener_repartidores.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/use_cases/obtener_usuario_por_id.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/use_cases/obtener_usuarios.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/presentation/cubits/usuarios_state.dart';

class UsuariosCubit extends Cubit<UsuariosState> {
  final ActualizarPerfil _actualizarPerfilUseCase;
  final BuscarUsuarios _buscarUsuariosUseCase;
  final CambiarEstadoUsuario _cambiarEstadoUsuarioUseCase;
  final CambiarRolUsuario _cambiarRolUseCase;
  final ExisteEncargadoEnSucursal _existeEncargadoActivoUseCase;
  final ObtenerClientes _obtenerClientesUseCase;
  final ObtenerRepartidores _obtenerRepartidoresUseCase;
  final ObtenerUsuarioPorId _obtenerUsuarioPorIdUseCase;
  final ObtenerUsuarios _obtenerUsuariosUseCase;

  UsuariosCubit({
    required ActualizarPerfil actualizarPerfilUseCase,
    required BuscarUsuarios buscarUsuariosUseCase,
    required CambiarEstadoUsuario cambiarEstadoUsuarioUseCase,
    required CambiarRolUsuario cambiarRolUseCase,
    required ContarAdminsActivos contarAdminsActivosUseCase,
    required ExisteEncargadoEnSucursal existeEncargadoActivoUseCase,
    required ObtenerClientes obtenerClientesUseCase,
    required ObtenerRepartidores obtenerRepartidoresUseCase,
    required ObtenerUsuarioPorId obtenerUsuarioPorIdUseCase,
    required ObtenerUsuarios obtenerUsuariosUseCase,
  })  : _obtenerUsuariosUseCase = obtenerUsuariosUseCase,
        _obtenerUsuarioPorIdUseCase = obtenerUsuarioPorIdUseCase,
        _obtenerRepartidoresUseCase = obtenerRepartidoresUseCase,
        _obtenerClientesUseCase = obtenerClientesUseCase,
        _existeEncargadoActivoUseCase = existeEncargadoActivoUseCase,
        _cambiarRolUseCase = cambiarRolUseCase,
        _cambiarEstadoUsuarioUseCase = cambiarEstadoUsuarioUseCase,
        _buscarUsuariosUseCase = buscarUsuariosUseCase,
        _actualizarPerfilUseCase = actualizarPerfilUseCase,
        super(const UsuariosState.initial()); // ← corregido

  Future<void> cargarUsuarios(Perfil usuarioActual) async {
    emit(const UsuariosState.loading()); // ← corregido
    final result = await _obtenerUsuariosUseCase.ejecutar(usuarioActual).run();
    result.fold(
      (failure) => emit(UsuariosState.error(failure.errorMessage)), // ← corregido
      (lista) => emit(UsuariosState.loaded(lista)), // ← corregido
    );
  }

  Future<void> actualizarPerfil({
    required Perfil usuarioActual,
    required Perfil perfilAEditar,
  }) async {
    emit(const UsuariosState.loading());
    final result = await _actualizarPerfilUseCase.ejecutar(
      solicitante: usuarioActual,
      perfilAEditar: perfilAEditar,
    ).run();
    result.fold(
      (failure) => emit(UsuariosState.error(failure.errorMessage)),
      (_) => cargarUsuarios(usuarioActual),
    );
  }

  Future<void> buscarUsuarios({
    required Perfil usuarioActual,
    required String query,
  }) async {
    if (query.trim().isEmpty) return cargarUsuarios(usuarioActual);
    emit(const UsuariosState.loading());
    final result = await _buscarUsuariosUseCase.ejecutar(
      usuarioActual: usuarioActual,
      query: query,
    ).run();
    result.fold(
      (failure) => emit(UsuariosState.error(failure.errorMessage)),
      (lista) => emit(UsuariosState.loaded(lista)),
    );
  }

  Future<void> cambiarEstadoUsuario({
    required Perfil usuarioActual,
    required String usuarioId,
    required bool activar,
  }) async {
    emit(const UsuariosState.loading());
    final result = await _cambiarEstadoUsuarioUseCase.ejecutar(
      usuarioActual: usuarioActual,
      usuarioId: usuarioId,
      activar: activar,
    ).run();
    result.fold(
      (failure) => emit(UsuariosState.error(failure.errorMessage)),
      (_) => cargarUsuarios(usuarioActual),
    );
  }

  Future<void> cambiarRol({
    required Perfil usuarioActual,
    required String usuarioId,
    required TipoUsuario nuevoRol,
    String? sucursalAsignadaId,
  }) async {
    emit(const UsuariosState.loading());
    final result = await _cambiarRolUseCase.ejecutar(
      usuarioActual: usuarioActual,
      usuarioId: usuarioId,
      nuevoRol: nuevoRol,
      sucursalAsignadaId: sucursalAsignadaId,
    ).run();
    result.fold(
      (failure) => emit(UsuariosState.error(failure.errorMessage)),
      (_) => cargarUsuarios(usuarioActual),
    );
  }


  Future<void> verificarEncargadoSucursal({
    required Perfil usuarioActual,
    required String sucursalId,
  }) async {
    final result = await _existeEncargadoActivoUseCase.ejecutar(
      solicitante: usuarioActual,
      sucursalId: sucursalId,
    ).run();
    result.fold(
      (failure) => emit(UsuariosState.error(failure.errorMessage)),
      (yaTieneEncargado) {
        if (yaTieneEncargado) {
          emit(const UsuariosState.error("Esta sucursal ya tiene un encargado asignado."));
        } else {
          state.maybeWhen( // ← corregido, sin cast manual
            loaded: (usuarios) => emit(UsuariosState.loaded(usuarios)),
            orElse: () {},
          );
        }
      },
    );
  }

  Future<void> cargarClientes(Perfil usuarioActual) async {
    emit(const UsuariosState.loading());
    final result = await _obtenerClientesUseCase.ejecutar(usuarioActual).run();
    result.fold(
      (failure) => emit(UsuariosState.error(failure.errorMessage)),
      (lista) => emit(UsuariosState.loaded(lista)),
    );
  }

  Future<void> cargarRepartidores({
    required Perfil usuarioActual,
    String? sucursalIdFiltro,
  }) async {
    emit(const UsuariosState.loading());
    final result = await _obtenerRepartidoresUseCase(
      solicitante: usuarioActual,
      sucursalIdOpcional: sucursalIdFiltro,
    ).run();
    result.fold(
      (failure) => emit(UsuariosState.error(failure.errorMessage)),
      (lista) => emit(UsuariosState.loaded(lista)),
    );
  }

  Future<void> cargarUsuarioPorId({
    required Perfil usuarioActual,
    required String idABuscar,
  }) async {
    emit(const UsuariosState.loading());
    final result = await _obtenerUsuarioPorIdUseCase.ejecutar(
      solicitante: usuarioActual,
      idABuscar: idABuscar,
    ).run();
    result.fold(
      (failure) => emit(UsuariosState.error(failure.errorMessage)),
      (perfil) => emit(UsuariosState.loaded([perfil])),
    );
  }
}