// lib/features/banners/domain/enums/banner_schedule_status.dart

/// Estado de un banner según su ventana de fechas (sin contar el interruptor
/// manual `isActive`).
enum BannerScheduleStatus {
  /// Sin fechas: no tiene programación.
  always,

  /// Todavía no llega su fecha de inicio.
  scheduled,

  /// Dentro de su ventana.
  live,

  /// Ya pasó su fecha de fin.
  expired,
}