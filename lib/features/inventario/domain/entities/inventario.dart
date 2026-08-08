import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';

part 'inventario.freezed.dart';

@freezed
abstract class Inventario with _$Inventario {
  // 🌟 Constructor privado para habilitar lógica interna
  const Inventario._();

  const factory Inventario({
    required String productoId,
    required String sucursalId,
    required int stockDisponible,
    required int stockReservado,
    int? precioLocal, // 🌟 CORRECCIÓN CRÍTICA: int en lugar de double para los centavos
    required DateTime fechaActualizacion,
  }) = _Inventario;

  // ─── LÓGICA DE NEGOCIO (EL CEREBRO DEL INVENTARIO) ─────────────────────

  // 1. ¿La sucursal le puso su propio precio de remate?
  bool get tieneRemateLocal => precioLocal != null;

  // 2. ¿Cuál es el precio que realmente se le va a cobrar al cliente?
  int precioFinal(Producto producto) => 
      precioLocal ?? producto.precioActual;

  // 3. ¿Tiene descuento desde el catálogo general? 
  bool tieneDescuentoGlobal(Producto producto) =>
      !tieneRemateLocal && producto.tieneDescuento;

  // 4. Lógica de stock crítico
  bool esStockCritico(Producto producto) {
    return stockDisponible <= 5;
  }
}