// lib/features/banners/presentation/utils/banner_date_format.dart

/// Fecha y hora local con el formato "28/11/2026 18:30".
String formatBannerDate(DateTime date) {
  final local = date.toLocal();
  String two(int n) => n.toString().padLeft(2, '0');
  return '${two(local.day)}/${two(local.month)}/${local.year} '
      '${two(local.hour)}:${two(local.minute)}';
}