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
    required UbicacionService
    ubicacionService, // 🌟 Lo pedimos en el constructor
    required ObtenerStockActual obtenerStockActual,
  }) : _obtenerCarrito = obtenerCarrito,
       _guardarCarrito = guardarCarrito,
       _vaciarCarritoUseCase = vaciarCarritoUseCase,
       _ubicacionService = ubicacionService,
       _obtenerStockActual = obtenerStockActual,
       super(const CarritoState.initial());

  /// Carga el carrito desde la memoria del celular al arrancar la app
  Future<void> cargarCarrito() async {
    emit(const CarritoState.loading());
    try {
      final items = await _obtenerCarrito();
      // 🌟 Usamos parámetro nombrado: items:
      emit(CarritoState.loaded(items: items));
    } catch (e) {
      emit(const CarritoState.error('Error al cargar el carrito local'));
    }
  }

  /// Agrega un producto o suma cantidad si ya existe
  /// Agrega un producto evaluando el stock real.
  /// Retorna un texto con el error, o [null] si fue exitoso.
  Future<String?> agregarProducto(CarritoItem nuevoItem) async {
    String? mensajeError;

    await state.maybeMap(
      loaded: (currentState) async {
        final sucursalId = currentState.sucursalId;

        if (sucursalId == null) {
          mensajeError = 'Selecciona una sucursal de entrega primero.';
          return;
        }

        // 🌟 1. DELEGAMOS AL CASO DE USO (Clean Architecture)
        final result = await _obtenerStockActual
            .ejecutar(nuevoItem.productoId, sucursalId)
            .run();

        // 🌟 2. EVALUAMOS EL RESULTADO (Programación Funcional)
        await result.fold(
          (failure) async {
            // Error de conexión o base de datos
            mensajeError =
                'No se pudo verificar el stock: ${failure.errorMessage}';
          },
          (stockReal) async {
            // 🌟 3. LÓGICA DE NEGOCIO DEL CARRITO
            final List<CarritoItem> itemsActuales = List.from(
              currentState.items,
            );
            final index = itemsActuales.indexWhere(
              (item) => item.productoId == nuevoItem.productoId,
            );

            final cantidadActualEnCarrito = index != -1
                ? itemsActuales[index].cantidad
                : 0;
            final cantidadTotalDeseada =
                cantidadActualEnCarrito + nuevoItem.cantidad;

            if (cantidadTotalDeseada > stockReal) {
              mensajeError =
                  'Stock insuficiente. Solo quedan $stockReal disponibles.';
              return;
            }

            // Si hay stock, actualizamos el estado
            if (index != -1) {
              final itemExistente = itemsActuales[index];
              itemsActuales[index] = itemExistente.copyWith(
                cantidad: cantidadTotalDeseada,
              );
            } else {
              itemsActuales.add(nuevoItem);
            }

            await _guardarCarrito(itemsActuales);
            emit(currentState.copyWith(items: itemsActuales));
          },
        );
      },
      orElse: () {
        mensajeError = 'El carrito aún no está listo.';
      },
    );

    return mensajeError;
  }

  /// Actualiza la cantidad exacta desde los botones + y - del carrito
  Future<void> actualizarCantidad(String productoId, int nuevaCantidad) async {
    if (nuevaCantidad <= 0) {
      return eliminarProducto(productoId);
    }

    state.maybeMap(
      loaded: (currentState) async {
        final List<CarritoItem> itemsActuales = List.from(currentState.items);
        final index = itemsActuales.indexWhere(
          (item) => item.productoId == productoId,
        );

        if (index != -1) {
          itemsActuales[index] = itemsActuales[index].copyWith(
            cantidad: nuevaCantidad,
          );
          await _guardarCarrito(itemsActuales);

          // 🌟 Conservamos modo de entrega
          emit(
            CarritoState.loaded(
              items: itemsActuales,
              modoEntrega: currentState.modoEntrega,
            ),
          );
        }
      },
      orElse: () {},
    );
  }

  /// Quita un producto completamente del carrito
  Future<void> eliminarProducto(String productoId) async {
    state.maybeMap(
      loaded: (currentState) async {
        final itemsActuales = currentState.items
            .where((item) => item.productoId != productoId)
            .toList();

        await _guardarCarrito(itemsActuales);
        // 🌟 Conservamos modo de entrega
        emit(
          CarritoState.loaded(
            items: itemsActuales,
            modoEntrega: currentState.modoEntrega,
          ),
        );
      },
      orElse: () {},
    );
  }

  /// Borra todo al confirmar compra o vaciar manualmente
  Future<void> vaciarCarrito() async {
    await _vaciarCarritoUseCase();
    emit(const CarritoState.loaded(items: []));
  }

  // =========================================================================
  // 🌟 NUEVAS FUNCIONES DE COBERTURA Y MODO DE ENTREGA
  // =========================================================================

  /// Cambia entre A Domicilio y Pick-Up sin perder los productos
  void establecerModoEntrega(ModoEntrega modo) {
    state.maybeMap(
      loaded: (currentState) {
        emit(currentState.copyWith(modoEntrega: modo));
      },
      orElse: () {
        emit(CarritoState.loaded(items: [], modoEntrega: modo));
      },
    );
  }

  /// Evalúa si la dirección está en rango de alguna sucursal.
  Sucursal? validarCoberturaDireccion({
    required Direccion direccion,
    required List<Sucursal> sucursales,
    required List<ConfiguracionEnvio> configuraciones, // 🌟 AHORA RECIBE LA LISTA COMPLETA
  }) {
    Sucursal? sucursalGanadora;
    double distanciaMinima = double.infinity;

    for (var sucursal in sucursales) {
      if (sucursal.latitud == null || sucursal.longitud == null) continue;

      // 🌟 1. Buscamos la configuración específica de esta sucursal
      final configIndex = configuraciones.indexWhere((c) => c.sucursalId == sucursal.id);
      if (configIndex == -1) continue; // Si no tiene config, la saltamos

      final config = configuraciones[configIndex];

      // 🌟 2. Validamos el Código Postal (Solo si la sucursal lo requiere)
      if (config.requerirValidacionCP &&
          !config.codigosPostalesPermitidos.contains(direccion.codigoPostal)) {
        continue; // No cubre este C.P., evaluamos la siguiente sucursal
      }

      // 🌟 3. Calculamos la distancia
      final distanciaKm = _ubicacionService.calcularDistancia(
        lat1: direccion.latitud,
        lon1: direccion.longitud,
        lat2: sucursal.latitud!,
        lon2: sucursal.longitud!,
      );

      // 🌟 4. Evaluamos contra el radio ESPECÍFICO de esta sucursal
      if (distanciaKm <= config.radioMaximoKm && distanciaKm < distanciaMinima) {
        distanciaMinima = distanciaKm;
        sucursalGanadora = sucursal;
      }
    }

    return sucursalGanadora;
  }

  void establecerDireccionEntrega(Direccion direccion) {
    state.maybeMap(
      loaded: (currentState) {
        emit(currentState.copyWith(direccionSeleccionada: direccion));
      },
      orElse: () {},
    );
  }

  void establecerSucursalActiva(String sucursalId) {
    state.maybeMap(
      loaded: (currentState) {
        emit(currentState.copyWith(sucursalId: sucursalId));
      },
      orElse: () {},
    );
  }
}
