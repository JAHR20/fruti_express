import 'package:fruti_express_jahr_admin/features/productos/domain/enums/unidad_medida_producto.dart';
extension FormateadorUnidadMedida on UnidadMedida {
  String formatear(int cantidad) {
    switch (this) {
      case UnidadMedida.gramo:
        if (cantidad >= 1000) {
          return '${_limpiarDecimal(cantidad / 1000)} Kg';
        }
        return '$cantidad g';

      case UnidadMedida.mililitro:
        if (cantidad >= 1000) {
          return '${_limpiarDecimal(cantidad / 1000)} L';
        }
        return '$cantidad ml';

      case UnidadMedida.pieza:
        return '$cantidad Pza${cantidad != 1 ? 's' : ''}';

      case UnidadMedida.mazo:
        return '$cantidad Mazo${cantidad != 1 ? 's' : ''}';
    }
  }
}

// Convierte 1.0 → "1", 1.5 → "1.5", 1.25 → "1.25"
String _limpiarDecimal(double valor) {
  return valor == valor.truncateToDouble()
      ? valor.toInt().toString()
      : valor.toStringAsFixed(2).replaceAll(RegExp(r'\.?0+$'), '');
}