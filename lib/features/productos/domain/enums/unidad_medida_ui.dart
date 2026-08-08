import 'package:fruti_express_jahr_admin/features/productos/domain/enums/unidad_medida_producto.dart';

extension UnidadMedidaUI on UnidadMedida {
  String get nombreUI {
    switch (this) {
      case UnidadMedida.gramo:
        return 'Kilogramo (Kg)';
      case UnidadMedida.mililitro:
        return 'Litro (L)';
      case UnidadMedida.pieza:
        return 'Pieza (Pza)';
      case UnidadMedida.mazo:
      return 'Mazo (Mz)';
      }
  }
}