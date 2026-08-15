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
  }) : _obtenerBannersActivosUseCase = obtenerBannersActivos,
       _obtenerTodosLosBannersUseCase = obtenerTodosLosBanners,
       _crearBannerUseCase = crearBanner,
       _actualizarBannerUseCase = actualizarBanner,
       _cambiarEstadoBannerUseCase = cambiarEstadoBanner,
       _eliminarBannerUseCase = eliminarBanner,
       super(const BannerState());

  Future<void> cargarBannersActivos() async {
    emit(
      state.copyWith(isLoading: true, errorMessage: null, operacionError: null),
    );

    final result = await _obtenerBannersActivosUseCase.ejecutar().run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(isLoading: false, errorMessage: failure.errorMessage),
        );
      },
      (banners) {
        emit(
          state.copyWith(
            isLoading: false,
            banners: banners,
            errorMessage: null,
          ),
        );
      },
    );
  }

  Future<void> cargarTodosLosBanners({required Perfil usuarioActual}) async {
    emit(
      state.copyWith(isLoading: true, errorMessage: null, operacionError: null),
    );

    final result = await _obtenerTodosLosBannersUseCase
        .ejecutar(usuarioActual: usuarioActual)
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(isLoading: false, errorMessage: failure.errorMessage),
        );
      },
      (banners) {
        emit(
          state.copyWith(
            isLoading: false,
            banners: banners,
            errorMessage: null,
          ),
        );
      },
    );
  }

  Future<void> crearBanner({
    required Perfil usuarioActual,
    required Banner banner,
    File? imagenArchivo,
  }) async {
    emit(state.copyWith(operacionError: null, operacionExitosa: false));

    final result = await _crearBannerUseCase
        .ejecutar(
          usuarioActual: usuarioActual,
          banner: banner,
          imagenArchivo: imagenArchivo,
        )
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            operacionError: failure.errorMessage,
            operacionExitosa: false,
          ),
        );
      },
      (_) {
        emit(state.copyWith(operacionError: null, operacionExitosa: true));

        cargarTodosLosBanners(usuarioActual: usuarioActual);
      },
    );
  }

  Future<void> actualizarBanner({
    required Perfil usuarioActual,
    required Banner banner,
    File? imagenArchivo,
  }) async {
    emit(
      state.copyWith(
        bannerProcesandoId: banner.id,
        operacionError: null,
        operacionExitosa: false,
      ),
    );

    final result = await _actualizarBannerUseCase
        .ejecutar(
          usuarioActual: usuarioActual,
          banner: banner,
          imagenArchivo: imagenArchivo,
        )
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            bannerProcesandoId: null,
            operacionError: failure.errorMessage,
            operacionExitosa: false,
          ),
        );
      },
      (bannerActualizado) {
        final nuevosBanners = state.banners.map((bannerActual) {
          if (bannerActual.id == bannerActualizado.id) {
            return bannerActualizado;
          }

          return bannerActual;
        }).toList();

        emit(
          state.copyWith(
            banners: nuevosBanners,
            bannerProcesandoId: null,
            operacionError: null,
            operacionExitosa: true,
          ),
        );
      },
    );
  }

  Future<void> cambiarEstadoBanner({
    required Perfil usuarioActual,
    required String id,
    required bool activo,
  }) async {
    emit(
      state.copyWith(
        bannerProcesandoId: id,
        operacionError: null,
        operacionExitosa: false,
      ),
    );

    final result = await _cambiarEstadoBannerUseCase
        .ejecutar(usuarioActual: usuarioActual, id: id, activo: activo)
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            bannerProcesandoId: null,
            operacionError: failure.errorMessage,
            operacionExitosa: false,
          ),
        );
      },
      (_) {
        final nuevosBanners = state.banners.map((banner) {
          if (banner.id == id) {
            return banner.copyWith(activo: activo);
          }

          return banner;
        }).toList();

        emit(
          state.copyWith(
            banners: nuevosBanners,
            bannerProcesandoId: null,
            operacionError: null,
            operacionExitosa: true,
          ),
        );
      },
    );
  }

  Future<void> eliminarBanner({
    required Perfil usuarioActual,
    required String id,
  }) async {
    emit(
      state.copyWith(
        bannerProcesandoId: id,
        operacionError: null,
        operacionExitosa: false,
      ),
    );

    final result = await _eliminarBannerUseCase
        .ejecutar(usuarioActual: usuarioActual, id: id)
        .run();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            bannerProcesandoId: null,
            operacionError: failure.errorMessage,
            operacionExitosa: false,
          ),
        );
      },
      (_) {
        final nuevosBanners = state.banners
            .where((banner) => banner.id != id)
            .toList();

        emit(
          state.copyWith(
            banners: nuevosBanners,
            bannerProcesandoId: null,
            operacionError: null,
            operacionExitosa: true,
          ),
        );
      },
    );
  }

  void limpiarResultadoOperacion() {
    emit(state.copyWith(operacionError: null, operacionExitosa: false));
  }
}
