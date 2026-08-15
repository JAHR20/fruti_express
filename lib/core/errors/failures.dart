import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  
  const Failure._(); 

  // --- ERRORES TÉCNICOS ---

  const factory Failure.server(String message) = ServerFailure;

  /// Error de conexión a internet.
  const factory Failure.network() = NetworkFailure;

  /// Error al leer o escribir en la base de datos local (Cache).
  const factory Failure.cache() = CacheFailure;

  // --- 🛡️ ERRORES DE ACCESO Y SEGURIDAD ---

  /// Error de permisos.
  const factory Failure.unauthorized(String message) = UnauthorizedFailure;

  // --- ERRORES DE RECURSOS (PRODUCTOS, CATEGORÍAS, USUARIOS) ---

  /// Cuando buscas algo que no existe: "Producto no encontrado", "Sucursal no existe".
  const factory Failure.notFound(String message) = NotFoundFailure;

  /// Cuando intentas crear algo que ya existe: "El nombre del producto ya está en uso".
  const factory Failure.alreadyExists(String message) = AlreadyExistsFailure;

  // --- ERRORES DE LÓGICA DE NEGOCIO ---

  /// Específico para Inventarios: "No hay stock suficiente para esta fruta".
  const factory Failure.insufficientStock(String message) =
      InsufficientStockFailure;

  /// Específico para Pedidos y Estados: "No puedes pasar de Pendiente a Entregado directamente".
  const factory Failure.invalidState(String message) = InvalidStateFailure;

  /// Específico para Validación de Entradas: "El precio no puede ser negativo", "Dirección inválida".
  const factory Failure.validation(String message) = ValidationFailure;

  String get errorMessage => when(
        server: (message) => message,
        network: () => 'No hay conexión a internet. Revisa tu red.',
        cache: () => 'Error al acceder a los datos locales.',
        unauthorized: (message) => message,
        notFound: (message) => message,
        alreadyExists: (message) => message,
        insufficientStock: (message) => message,
        invalidState: (message) => message,
        validation: (message) => message,
      );
      
}
