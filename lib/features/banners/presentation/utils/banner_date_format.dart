// lib/features/banners/presentation/utils/banner_date_format.dart

/// Fecha y hora local con el formato "28/11/2026 18:30".
String formatBannerDate(DateTime date) {
  final local = date.toLocal();
  String two(int n) => n.toString().padLeft(2, '0');
  return '${two(local.day)}/${two(local.month)}/${local.year} '
      '${two(local.hour)}:${two(local.minute)}';
}

const _weekdayNames = {
  1: 'lunes',
  2: 'martes',
  3: 'miércoles',
  4: 'jueves',
  5: 'viernes',
  6: 'sábado',
  7: 'domingo',
};

/// "Solo miércoles", "Solo lunes y viernes", "Solo lunes, miércoles y viernes".
/// Null si no hay días o son los siete (se muestra todos los días).
String? weekdaysLabel(List<int> weekdays) {
  final days = weekdays.where((d) => d >= 1 && d <= 7).toSet().toList()..sort();
  if (days.isEmpty || days.length == 7) return null;

  final names = days.map((d) => _weekdayNames[d]!).toList();
  if (names.length == 1) return 'Solo ${names.first}';
  return 'Solo ${names.sublist(0, names.length - 1).join(', ')} y ${names.last}';
}