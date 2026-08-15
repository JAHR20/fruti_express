import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/enums/tipo_usuario.dart';
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
  final BuscarUsuarios _buscarUsuariosUseCase;
  final CambiarEstadoUsuario _cambiarEstadoUsuarioUseCase;
  final CambiarRolUsuario _cambiarRolUseCase;
  final ContarAdminsActivos _contarAdminsActivosUseCase;
  final ExisteEncargadoEnSucursal _existeEncargadoActivoUseCase;
  final ObtenerClientes _obtenerClientesUseCase;
  final ObtenerRepartidores _obtenerRepartidoresUseCase;
  final ObtenerUsuarioPorId _obtenerUsuarioPorIdUseCase;
  final ObtenerUsuarios _obtenerUsuariosUseCase;

  UsuariosCubit({
    required BuscarUsuarios buscarUsuariosUseCase,
    required CambiarEstadoUsuario cambiarEstadoUsuarioUseCase,
    required CambiarRolUsuario cambiarRolUseCase,
    required ContarAdminsActivos contarAdminsActivosUseCase,
    required ExisteEncargadoEnSucursal existeEncargadoActivoUseCase,
    required ObtenerClientes obtenerClientesUseCase,
    required ObtenerRepartidores obtenerRepartidoresUseCase,
    required ObtenerUsuarioPorId obtenerUsuarioPorIdUseCase,
    required ObtenerUsuarios obtenerUsuariosUseCase,
  }) : _obtenerUsuariosUseCase = obtenerUsuariosUseCase,
       _obtenerUsuarioPorIdUseCase = obtenerUsuarioPorIdUseCase,
       _obtenerRepartidoresUseCase = obtenerRepartidoresUseCase,
       _obtenerClientesUseCase = obtenerClientesUseCase,
       _existeEncargadoActivoUseCase = existeEncargadoActivoUseCase,
       _cambiarRolUseCase = cambiarRolUseCase,
       _cambiarEstadoUsuarioUseCase = cambiarEstadoUsuarioUseCase,
       _contarAdminsActivosUseCase = contarAdminsActivosUseCase,
       _buscarUsuariosUseCase = buscarUsuariosUseCase,
       super(const UsuariosState());

  Future<void> cargarUsuarios(Perfil usuarioActual) async {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        tab: UsuariosTab.todos,
      ),
    );
    final result = await _obtenerUsuariosUseCase.ejecutar(usuarioActual).run();
    result.fold(
      (failure) => emit(
        state.copyWith(isLoading: false, errorMessage: failure.errorMessage),
      ),
      (lista) => emit(
        state.copyWith(
          usuarios: lista,
          isLoading: false,
          errorMessage: null,
          tab: UsuariosTab.todos,
        ),
      ),
    );
  }

  Future<void> cargarClientes(Perfil usuarioActual) async {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        tab: UsuariosTab.clientes,
      ),
    );
    final result = await _obtenerClientesUseCase.ejecutar(usuarioActual).run();
    result.fold(
      (failure) => emit(
        state.copyWith(isLoading: false, errorMessage: failure.errorMessage),
      ),
      (lista) => emit(
        state.copyWith(
          usuarios: lista,
          isLoading: false,
          errorMessage: null,
          tab: UsuariosTab.clientes,
        ),
      ),
    );
  }

  Future<void> cargarRepartidores({
    required Perfil usuarioActual,
    String? sucursalIdFiltro,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        tab: UsuariosTab.repartidores,
      ),
    );
    final result = await _obtenerRepartidoresUseCase(
      solicitante: usuarioActual,
      sucursalIdOpcional: sucursalIdFiltro,
    ).run();
    result.fold(
      (failure) => emit(
        state.copyWith(isLoading: false, errorMessage: failure.errorMessage),
      ),
      (lista) => emit(
        state.copyWith(
          usuarios: lista,
          isLoading: false,
          errorMessage: null,
          tab: UsuariosTab.repartidores,
        ),
      ),
    );
  }

  Future<void> buscarUsuarios({
    required Perfil usuarioActual,
    required String query,
  }) async {
    final queryLimpia = query.trim();

    if (queryLimpia.isEmpty) {
      emit(state.copyWith(searchQuery: '')); 
      switch (state.tab) {
        case UsuariosTab.todos:
          return cargarUsuarios(usuarioActual);
        case UsuariosTab.repartidores:
          return cargarRepartidores(usuarioActual: usuarioActual);
        case UsuariosTab.clientes:
          return cargarClientes(usuarioActual);
      }
    }

    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        searchQuery: queryLimpia,
      ),
    );
    final result = await _buscarUsuariosUseCase
        .ejecutar(usuarioActual: usuarioActual, query: queryLimpia)
        .run();
    result.fold(
      (failure) => emit(
        state.copyWith(isLoading: false, errorMessage: failure.errorMessage),
      ),
      (lista) => emit(
        state.copyWith(
          usuarios: lista,
          isLoading: false,
          errorMessage: null,
          searchQuery: queryLimpia,
        ),
      ),
    );
  }

  Future<void> cambiarEstadoUsuario({
    required Perfil usuarioActual,
    required String usuarioId,
    required bool activar,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        usuarioProcesandoId: usuarioId,
      ),
    );
    final result = await _cambiarEstadoUsuarioUseCase
        .ejecutar(
          usuarioActual: usuarioActual,
          usuarioId: usuarioId,
          activar: activar,
        )
        .run();
    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: failure.errorMessage,
          usuarioProcesandoId: null,
        ),
      ),
      (_) {
        emit(state.copyWith(usuarioProcesandoId: null));
        cargarUsuarios(usuarioActual);
      },
    );
  }

  Future<void> cambiarRol({
    required Perfil usuarioActual,
    required String usuarioId,
    required TipoUsuario nuevoRol,
    String? sucursalAsignadaId,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        usuarioProcesandoId: usuarioId,
      ),
    );
    final result = await _cambiarRolUseCase
        .ejecutar(
          usuarioActual: usuarioActual,
          usuarioId: usuarioId,
          nuevoRol: nuevoRol,
          sucursalAsignadaId: sucursalAsignadaId,
        )
        .run();
    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: failure.errorMessage,
          usuarioProcesandoId: null,
        ),
      ),
      (_) {
        emit(state.copyWith(usuarioProcesandoId: null));
        cargarUsuarios(usuarioActual);
      },
    );
  }

  Future<void> verificarEncargadoSucursal({
    required Perfil usuarioActual,
    required String sucursalId,
  }) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _existeEncargadoActivoUseCase
        .ejecutar(solicitante: usuarioActual, sucursalId: sucursalId)
        .run();
    result.fold(
      (failure) => emit(
        state.copyWith(isLoading: false, errorMessage: failure.errorMessage),
      ),
      (yaTieneEncargado) {
        if (yaTieneEncargado) {
          emit(
            state.copyWith(
              isLoading: false,
              errorMessage: "Esta sucursal ya tiene un encargado asignado.",
            ),
          );
        } else {
          emit(state.copyWith(isLoading: false, errorMessage: null));
        }
      },
    );
  }

  Future<void> cargarUsuarioPorId({
    required Perfil usuarioActual,
    required String idABuscar,
  }) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _obtenerUsuarioPorIdUseCase
        .ejecutar(solicitante: usuarioActual, idABuscar: idABuscar)
        .run();
    result.fold(
      (failure) => emit(
        state.copyWith(isLoading: false, errorMessage: failure.errorMessage),
      ),
      (perfil) => emit(
        state.copyWith(
          usuarios: [perfil],
          isLoading: false,
          errorMessage: null,
        ),
      ),
    );
  }

  Future<bool> verificarSiEsUltimoAdmin({required Perfil usuarioActual}) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _contarAdminsActivosUseCase
        .ejecutar(usuarioActual)
        .run();

    return result.fold(
      (failure) {
        emit(
          state.copyWith(isLoading: false, errorMessage: failure.errorMessage),
        );
        return false;
      },
      (cantidadAdmins) {
        emit(state.copyWith(isLoading: false));
        return cantidadAdmins <= 1;
      },
    );
  }
}
