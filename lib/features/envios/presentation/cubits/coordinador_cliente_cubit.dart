import 'dart:async'; // 🌟 IMPORTANTE PARA LOS STREAMS
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/enums/modo_entrega.dart';
import 'package:fruti_express_jahr_admin/features/carrito/presentation/cubits/carrito_cubit.dart';
import 'package:fruti_express_jahr_admin/features/carrito/presentation/cubits/carrito_state.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/presentation/cubits/direcciones_state.dart';
import 'package:fruti_express_jahr_admin/features/productos/presentation/cubits/productos_cubit.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/presentation/cubits/direcciones_cubit.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/sucursal_cubit.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/sucursal_state.dart';
import 'package:fruti_express_jahr_admin/features/envios/presentation/cubits/envio_cliente_cubit.dart';

import 'coordinador_cliente_state.dart';

class CoordinadorClienteCubit extends Cubit<CoordinadorClienteState> {
  final CarritoCubit _carritoCubit;
  final ProductosCubit _productosCubit;
  final SucursalCubit _sucursalCubit;
  final EnvioClienteCubit _envioClienteCubit;
  final DireccionesCubit _direccionesCubit;

  // 🌟 CABLES PARA ESCUCHAR A LOS OTROS CUBITS
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
  })  : _carritoCubit = carritoCubit,
        _productosCubit = productosCubit,
        _sucursalCubit = sucursalCubit,
        _envioClienteCubit = envioClienteCubit,
        _direccionesCubit = direccionesCubit,
        super(const CoordinadorClienteState.idle()) {
    
    // 🌟 MAGIA: CONECTAMOS LOS CABLES AL NACER
    // 1. Si cambian las sucursales, pedimos las configuraciones
    _sucursalSub = _sucursalCubit.stream.listen((state) {
      state.maybeWhen(
        loaded: (sucursales) => _envioClienteCubit.cargarConfiguracionesDeSucursales(sucursales),
        orElse: () {},
      );
    });

    // 2. Si cambian las direcciones o envíos, evaluamos si ya podemos auto-seleccionar
    _direccionesSub = _direccionesCubit.stream.listen((_) => _intentarAutoSeleccion());
    _envioSub = _envioClienteCubit.stream.listen((_) => _intentarAutoSeleccion());

    // 3. Revisamos el estado inicial por si los datos cargaron en main.dart antes de que este Cubit naciera
    _sucursalCubit.state.maybeWhen(
      loaded: (sucursales) => _envioClienteCubit.cargarConfiguracionesDeSucursales(sucursales),
      orElse: () {},
    );
    _intentarAutoSeleccion();
  }

  // 🌟 LIMPIEZA: Desconectamos los cables al destruir el Cubit (Salir de la pantalla)
  @override
  Future<void> close() {
    _sucursalSub?.cancel();
    _envioSub?.cancel();
    _direccionesSub?.cancel();
    return super.close();
  }

  // 🌟 LÓGICA INTERNA: Ya no necesita que la vista le mande las listas
  void _intentarAutoSeleccion() {
    if (_autoSeleccionRealizada) return;

    final direcciones = _direccionesCubit.state.maybeWhen(loaded: (d) => d, orElse: () => <Direccion>[]);
    final sucursales = _sucursalCubit.state.maybeWhen(loaded: (s) => s, orElse: () => <Sucursal>[]);
    final configuraciones = _envioClienteCubit.state.configuraciones;

    // Si falta algún dato, aborta y espera a que los streams le avisen
    if (direcciones.isEmpty || sucursales.isEmpty || configuraciones.isEmpty) return;

    final yaTieneUbicacion = _carritoCubit.state.maybeMap(
      loaded: (s) => s.direccionSeleccionada != null || s.modoEntrega == ModoEntrega.pickUp,
      orElse: () => false,
    );

    if (yaTieneUbicacion) {
      _autoSeleccionRealizada = true;
      return;
    }

    final direccionDefault = direcciones.firstWhere((d) => d.esPrincipal, orElse: () => direcciones.first);
    
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

  void _ejecutarValidacion({required Direccion direccion, required bool esAutomatico}) {
    final sucursales = _sucursalCubit.state.maybeWhen(loaded: (s) => s, orElse: () => <Sucursal>[]);
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
      
      emit(CoordinadorClienteState.cambioExitoso(sucursalGanadora, esAutomatico));
    } else {
      emit(CoordinadorClienteState.sinCobertura(direccion));
    }
    emit(const CoordinadorClienteState.idle());
  }
}