
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/enums/modo_entrega.dart';
import 'package:fruti_express_jahr_admin/core/services/ubicacion/ubicacion_service.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/configuracion_envio.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/use_cases/obtener_stock_actual.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';

import 'package:fruti_express_jahr_admin/features/carrito/domain/entities/carrito_item.dart';
import 'package:fruti_express_jahr_admin/features/carrito/domain/use_cases/guardar_carrito_usecase.dart';
import 'package:fruti_express_jahr_admin/features/carrito/domain/use_cases/obtener_carrito_usecase.dart';
import 'package:fruti_express_jahr_admin/features/carrito/domain/use_cases/vaciar_carrito_usecase.dart';
import 'carrito_state.dart';

class CarritoCubit extends Cubit<CarritoState> {
  final ObtenerCarritoUseCase _obtenerCarrito;
  final GuardarCarritoUseCase _guardarCarrito;
  final VaciarCarritoUseCase _vaciarCarritoUseCase;
  final UbicacionService _ubicacionService;
  final ObtenerStockActual _obtenerStockActual;

  CarritoCubit({
    required ObtenerCarritoUseCase obtenerCarrito,
    required GuardarCarritoUseCase guardarCarrito,
    required VaciarCarritoUseCase vaciarCarritoUseCase,
    required UbicacionService ubicacionService,
    required ObtenerStockActual obtenerStockActual,
  }) : _obtenerCarrito = obtenerCarrito,
       _guardarCarrito = guardarCarrito,
       _vaciarCarritoUseCase = vaciarCarritoUseCase,
       _ubicacionService = ubicacionService,
       _obtenerStockActual = obtenerStockActual,
       super(const CarritoState());

  Future<void> cargarCarrito() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final items = await _obtenerCarrito();
      emit(state.copyWith(isLoading: false, items: items, errorMessage: null));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Error al cargar el carrito local',
        ),
      );
    }
  }

  Future<String?> agregarProducto(CarritoItem nuevoItem) async {
    final sucursalId = state.sucursalId;

    if (sucursalId == null) {
      return 'Selecciona una sucursal de entrega primero.';
    }

    emit(state.copyWith(productoProcesandoId: nuevoItem.productoId));

    final result = await _obtenerStockActual
        .ejecutar(nuevoItem.productoId, sucursalId)
        .run();

    String? mensajeError;

    await result.fold(
      (failure) async {
        mensajeError = 'No se pudo verificar el stock: ${failure.errorMessage}';
      },
      (stockReal) async {
        final List<CarritoItem> itemsActuales = List.from(state.items);
        final index = itemsActuales.indexWhere(
          (item) => item.productoId == nuevoItem.productoId,
        );

        final cantidadActualEnCarrito =
            index != -1 ? itemsActuales[index].cantidad : 0;
        final cantidadTotalDeseada =
            cantidadActualEnCarrito + nuevoItem.cantidad;

        if (cantidadTotalDeseada > stockReal) {
          mensajeError = 'Stock insuficiente. Solo quedan $stockReal disponibles.';
          return;
        }

        if (index != -1) {
          final itemExistente = itemsActuales[index];
          itemsActuales[index] = itemExistente.copyWith(
            cantidad: cantidadTotalDeseada,
          );
        } else {
          itemsActuales.add(nuevoItem);
        }

        await _guardarCarrito(itemsActuales);
        emit(state.copyWith(items: itemsActuales));
      },
    );

    emit(state.copyWith(productoProcesandoId: null));

    return mensajeError;
  }

  Future<void> actualizarCantidad(String productoId, int nuevaCantidad) async {
    if (nuevaCantidad <= 0) {
      return eliminarProducto(productoId);
    }

    final List<CarritoItem> itemsActuales = List.from(state.items);
    final index = itemsActuales.indexWhere(
      (item) => item.productoId == productoId,
    );

    if (index == -1) return;

    emit(state.copyWith(productoProcesandoId: productoId));

    itemsActuales[index] = itemsActuales[index].copyWith(
      cantidad: nuevaCantidad,
    );
    await _guardarCarrito(itemsActuales);

    emit(state.copyWith(items: itemsActuales, productoProcesandoId: null));
  }

  Future<void> eliminarProducto(String productoId) async {
    emit(state.copyWith(productoProcesandoId: productoId));

    final itemsActuales = state.items
        .where((item) => item.productoId != productoId)
        .toList();

    await _guardarCarrito(itemsActuales);

    emit(state.copyWith(items: itemsActuales, productoProcesandoId: null));
  }


  Future<void> vaciarCarrito() async {
    await _vaciarCarritoUseCase();
    emit(state.copyWith(items: const []));
  }

  void establecerModoEntrega(ModoEntrega modo) {
    emit(state.copyWith(modoEntrega: modo));
  }

  Sucursal? validarCoberturaDireccion({
    required Direccion direccion,
    required List<Sucursal> sucursales,
    required List<ConfiguracionEnvio> configuraciones,
  }) {
    Sucursal? sucursalGanadora;
    double distanciaMinima = double.infinity;

    for (var sucursal in sucursales) {
      if (sucursal.latitud == null || sucursal.longitud == null) continue;

      final configIndex =
          configuraciones.indexWhere((c) => c.sucursalId == sucursal.id);
      if (configIndex == -1) continue;

      final config = configuraciones[configIndex];

      if (config.requerirValidacionCP &&
          !config.codigosPostalesPermitidos.contains(direccion.codigoPostal)) {
        continue;
      }

      final distanciaKm = _ubicacionService.calcularDistancia(
        lat1: direccion.latitud,
        lon1: direccion.longitud,
        lat2: sucursal.latitud!,
        lon2: sucursal.longitud!,
      );

      if (distanciaKm <= config.radioMaximoKm && distanciaKm < distanciaMinima) {
        distanciaMinima = distanciaKm;
        sucursalGanadora = sucursal;
      }
    }

    return sucursalGanadora;
  }

  void establecerDireccionEntrega(Direccion direccion) {
    emit(state.copyWith(direccionSeleccionada: direccion));
  }

  void establecerSucursalActiva(String sucursalId) {
    emit(state.copyWith(sucursalId: sucursalId));
  }
}