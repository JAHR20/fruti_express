import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/carrito/domain/entities/carrito_item.dart';
import 'package:fruti_express_jahr_admin/core/enums/modo_entrega.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart'; // 🌟 Importar enum

part 'carrito_state.freezed.dart';

@freezed
class CarritoState with _$CarritoState {
  const CarritoState._();

  const factory CarritoState.initial() = _Initial;
  const factory CarritoState.loading() = _Loading;
  
  // 🌟 Transformamos loaded a parámetros nombrados para poder guardar más cosas
  const factory CarritoState.loaded({
    @Default([]) List<CarritoItem> items,
    ModoEntrega? modoEntrega, // 🌟 Aquí vive la decisión del usuario
    Direccion? direccionSeleccionada,
    final String? sucursalId,
  }) = _Loaded;
  
  const factory CarritoState.error(String mensaje) = _Error;

  // 🌟 Usamos maybeMap para acceder fácilmente a state.items
  int get total => maybeMap(
        loaded: (state) => state.items.fold(0, (suma, item) => suma + item.subtotal),
        orElse: () => 0,
      );

  int get cantidadArticulos => maybeMap(
        loaded: (state) => state.items.length,
        orElse: () => 0,
      );
}