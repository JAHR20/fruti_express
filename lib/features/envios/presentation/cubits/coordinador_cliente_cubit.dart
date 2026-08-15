import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/enums/modo_entrega.dart';
import 'package:fruti_express_jahr_admin/features/carrito/presentation/cubits/carrito_cubit.dart';
import 'package:fruti_express_jahr_admin/features/productos/presentation/cubits/productos_cubit.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/presentation/cubits/direcciones_cubit.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/sucursal_cubit.dart';
import 'package:fruti_express_jahr_admin/features/envios/presentation/cubits/envio_cliente_cubit.dart';

import 'coordinador_cliente_state.dart';

class CoordinadorClienteCubit extends Cubit<CoordinadorClienteState> {
  final CarritoCubit _carritoCubit;
  final ProductosCubit _productosCubit;
  final SucursalCubit _sucursalCubit;
  final EnvioClienteCubit _envioClienteCubit;
  final DireccionesCubit _direccionesCubit;

  StreamSubscription? _sucursalSub;
  StreamSubscription? _envioSub;
  StreamSubscription? _direccionesSub;

  bool _autoSeleccionRealizada = false;

  CoordinadorClienteCubit({
    required CarritoCubit carritoCubit,
    required ProductosCubit productosCubit,
    required SucursalCubit sucursalCubit,
    required EnvioClienteCubit envioClienteCubit,
    required DireccionesCubit direccionesCubit,
  }) : _carritoCubit = carritoCubit,
       _productosCubit = productosCubit,
       _sucursalCubit = sucursalCubit,
       _envioClienteCubit = envioClienteCubit,
       _direccionesCubit = direccionesCubit,
       super(const CoordinadorClienteState.idle()) {
    _sucursalSub = _sucursalCubit.stream.listen((state) {
      if (state.sucursales.isNotEmpty) {
        _envioClienteCubit.cargarConfiguracionesDeSucursales(state.sucursales);
      }
    });

    _direccionesSub = _direccionesCubit.stream.listen(
      (_) => _intentarAutoSeleccion(),
    );
    _envioSub = _envioClienteCubit.stream.listen(
      (_) => _intentarAutoSeleccion(),
    );

    if (_sucursalCubit.state.sucursales.isNotEmpty) {
      _envioClienteCubit.cargarConfiguracionesDeSucursales(
        _sucursalCubit.state.sucursales,
      );
    }

    _intentarAutoSeleccion();
  }

  @override
  Future<void> close() {
    _sucursalSub?.cancel();
    _envioSub?.cancel();
    _direccionesSub?.cancel();
    return super.close();
  }

  void _intentarAutoSeleccion() {
    if (_autoSeleccionRealizada) return;

    final direcciones = _direccionesCubit.state.direcciones;

    final sucursales = _sucursalCubit.state.sucursales;
    final configuraciones = _envioClienteCubit.state.configuraciones;

    if (direcciones.isEmpty || sucursales.isEmpty || configuraciones.isEmpty) {
      return;
    }

    final yaTieneUbicacion =
        _carritoCubit.state.direccionSeleccionada != null ||
        _carritoCubit.state.modoEntrega == ModoEntrega.pickUp;

    if (yaTieneUbicacion) {
      _autoSeleccionRealizada = true;
      return;
    }

    final direccionDefault = direcciones.firstWhere(
      (d) => d.esPrincipal,
      orElse: () => direcciones.first,
    );

    _ejecutarValidacion(direccion: direccionDefault, esAutomatico: true);
    _autoSeleccionRealizada = true;
  }

  void cambiarDireccionManual(Direccion direccion) {
    emit(const CoordinadorClienteState.procesando());
    _ejecutarValidacion(direccion: direccion, esAutomatico: false);
  }

  void confirmarPickup(Direccion direccion) {
    _carritoCubit.establecerModoEntrega(ModoEntrega.pickUp);
    _carritoCubit.establecerDireccionEntrega(direccion);
    emit(const CoordinadorClienteState.idle());
  }

  void _ejecutarValidacion({
    required Direccion direccion,
    required bool esAutomatico,
  }) {
    final sucursales = _sucursalCubit.state.sucursales;
    final configuraciones = _envioClienteCubit.state.configuraciones;

    final sucursalGanadora = _carritoCubit.validarCoberturaDireccion(
      direccion: direccion,
      sucursales: sucursales,
      configuraciones: configuraciones,
    );

    if (sucursalGanadora != null) {
      _carritoCubit.establecerModoEntrega(ModoEntrega.aDomicilio);
      _carritoCubit.establecerDireccionEntrega(direccion);
      _carritoCubit.establecerSucursalActiva(sucursalGanadora.id);
      _productosCubit.cargarProductosPorSucursal(sucursalGanadora.id);

      emit(
        CoordinadorClienteState.cambioExitoso(sucursalGanadora, esAutomatico),
      );
    } else {
      emit(CoordinadorClienteState.sinCobertura(direccion));
    }
    emit(const CoordinadorClienteState.idle());
  }
}
