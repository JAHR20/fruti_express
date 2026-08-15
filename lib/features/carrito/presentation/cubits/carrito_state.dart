import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/core/enums/modo_entrega.dart';
import 'package:fruti_express_jahr_admin/features/carrito/domain/entities/carrito_item.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart';

part 'carrito_state.freezed.dart';

@freezed
abstract class CarritoState with _$CarritoState {
  const factory CarritoState({
    @Default(<CarritoItem>[]) List<CarritoItem> items,
    ModoEntrega? modoEntrega,
    Direccion? direccionSeleccionada,
    String? sucursalId,
    @Default(false) bool isLoading,
    String? productoProcesandoId,
    String? errorMessage,
    String? operacionError,
    @Default(false) bool operacionExitosa,
  }) = _CarritoState;

  const CarritoState._();

  int get total {
    return items.fold(0, (suma, item) => suma + item.subtotal);
  }

  int get cantidadArticulos => items.length;

  bool get estaVacio => items.isEmpty;

  bool get tieneProductos => items.isNotEmpty;

  bool get tieneModoEntrega => modoEntrega != null;

  bool get esEntregaADomicilio => modoEntrega == ModoEntrega.aDomicilio;

  bool get esPickup => modoEntrega == ModoEntrega.pickUp;
}