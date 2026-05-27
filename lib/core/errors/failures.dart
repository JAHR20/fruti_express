import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  // --- 🌐 ERRORES TÉCNICOS ---

  /// Error cuando el servidor responde con un error (500, 404, etc) o Firebase falla.
  const factory Failure.server(String message) = ServerFailure;

  /// Error de conexión a internet.
  const factory Failure.network() = NetworkFailure;

  /// Error al leer o escribir en la base de datos local (Cache).
  const factory Failure.cache() = CacheFailure;

  // --- 🛡️ ERRORES DE ACCESO Y SEGURIDAD ---

  /// Error de permisos: "No tienes permisos para editar el catálogo", etc.
  const factory Failure.unauthorized(String message) = UnauthorizedFailure;

  // --- 📦 ERRORES DE RECURSOS (PRODUCTOS, CATEGORÍAS, USUARIOS) ---

  /// Cuando buscas algo que no existe: "Producto no encontrado", "Sucursal no existe".
  const factory Failure.notFound(String message) = NotFoundFailure;

  /// Cuando intentas crear algo que ya existe: "El nombre del producto ya está en uso".
  const factory Failure.alreadyExists(String message) = AlreadyExistsFailure;

  // --- 🍎 ERRORES DE LÓGICA DE NEGOCIO (EL "CORAZÓN") ---

  /// Específico para Inventarios: "No hay stock suficiente para esta fruta".
  const factory Failure.insufficientStock(String message) =
      InsufficientStockFailure;

  /// Específico para Pedidos y Estados: "No puedes pasar de Pendiente a Entregado directamente".
  const factory Failure.invalidState(String message) = InvalidStateFailure;

  /// Específico para Validación de Entradas: "El precio no puede ser negativo", "Dirección inválida".
  const factory Failure.validation(String message) = ValidationFailure;
}
