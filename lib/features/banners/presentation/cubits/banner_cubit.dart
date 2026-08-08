import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/use_cases/actualizar_banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/use_cases/cambiar_estado_banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/use_cases/crear_banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/use_cases/eliminar_banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/use_cases/obtener_banners_activos.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/use_cases/obtener_todos_los_banners.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  final ObtenerBannersActivos _obtenerBannersActivosUseCase;
  final ObtenerTodosLosBanners _obtenerTodosLosBannersUseCase;
  final CrearBanner _crearBannerUseCase;
  final ActualizarBanner _actualizarBannerUseCase;
  final CambiarEstadoBanner _cambiarEstadoBannerUseCase;
  final EliminarBanner _eliminarBannerUseCase;

  BannerCubit({
    required ObtenerBannersActivos obtenerBannersActivos,
    required ObtenerTodosLosBanners obtenerTodosLosBanners,
    required CrearBanner crearBanner,
    required ActualizarBanner actualizarBanner,
    required CambiarEstadoBanner cambiarEstadoBanner,
    required EliminarBanner eliminarBanner,
  })  : _obtenerBannersActivosUseCase = obtenerBannersActivos,
        _obtenerTodosLosBannersUseCase = obtenerTodosLosBanners,
        _crearBannerUseCase = crearBanner,
        _actualizarBannerUseCase = actualizarBanner,
        _cambiarEstadoBannerUseCase = cambiarEstadoBanner,
        _eliminarBannerUseCase = eliminarBanner,
        super(const BannerState.initial());

  // --- 🔍 CONSULTAS ---

  /// Para la UI del cliente — no requiere usuario
  Future<void> cargarBannersActivos() async {
    emit(const BannerState.loading());
    final result = await _obtenerBannersActivosUseCase.ejecutar().run();
    result.fold(
      (failure) => emit(BannerState.error(failure.errorMessage)),
      (banners) => emit(BannerState.loaded(banners)),
    );
  }

  /// Para el panel admin — requiere usuario con permisos
  Future<void> cargarTodosLosBanners({required Perfil usuarioActual}) async {
    emit(const BannerState.loading());
    final result = await _obtenerTodosLosBannersUseCase
        .ejecutar(usuarioActual: usuarioActual)
        .run();
    result.fold(
      (failure) => emit(BannerState.error(failure.errorMessage)),
      (banners) => emit(BannerState.loaded(banners)),
    );
  }

  // --- ✍️ ESCRITURA ---

  Future<void> crearBanner({
    required Perfil usuarioActual,
    required Banner banner,
    File? imagenArchivo
  }) async {
    emit(const BannerState.loading());
    final result = await _crearBannerUseCase
        .ejecutar(usuarioActual: usuarioActual, banner: banner, imagenArchivo: imagenArchivo)
        .run();
    result.fold(
      (failure) => emit(BannerState.error(failure.errorMessage)),
      (_) => cargarTodosLosBanners(usuarioActual: usuarioActual), // ← recarga la lista
    );
  }

  Future<void> actualizarBanner({
    required Perfil usuarioActual,
    required Banner banner,
    File? imagenArchivo
  }) async {
    emit(const BannerState.loading());
    final result = await _actualizarBannerUseCase
        .ejecutar(usuarioActual: usuarioActual, banner: banner, imagenArchivo: imagenArchivo)
        .run();
    result.fold(
      (failure) => emit(BannerState.error(failure.errorMessage)),
      (_) => cargarTodosLosBanners(usuarioActual: usuarioActual),
    );
  }

  Future<void> cambiarEstadoBanner({
    required Perfil usuarioActual,
    required String id,
    required bool activo,
  }) async {
    final result = await _cambiarEstadoBannerUseCase
        .ejecutar(usuarioActual: usuarioActual, id: id, activo: activo)
        .run();
    result.fold(
      (failure) => emit(BannerState.error(failure.errorMessage)),
      (_) => cargarTodosLosBanners(usuarioActual: usuarioActual),
    );
  }

  Future<void> eliminarBanner({
    required Perfil usuarioActual,
    required String id,
  }) async {
    final result = await _eliminarBannerUseCase
        .ejecutar(usuarioActual: usuarioActual, id: id)
        .run();
    result.fold(
      (failure) => emit(BannerState.error(failure.errorMessage)),
      (_) => cargarTodosLosBanners(usuarioActual: usuarioActual),
    );
  }
}