import 'package:flutter/material.dart' hide Banner;
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner.dart';

class TarjetaBanner extends StatelessWidget {
  final Banner banner;
  final VoidCallback onEditar;
  final VoidCallback onEliminar;
  final Function(bool nuevoEstado) onEstadoCambiado;

  const TarjetaBanner({
    super.key,
    required this.banner,
    required this.onEditar,
    required this.onEliminar,
    required this.onEstadoCambiado,
  });

  // 🎨 Función auxiliar para convertir el "#Hex" de la BD a Color de Flutter
  Color _hexToColor(String hexString) {
    try {
      final buffer = StringBuffer();
      if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
      buffer.write(hexString.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {
      return Colors.grey.shade300; // Color de respaldo en caso de error
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorInicio = _hexToColor(banner.colorInicio);
    final colorFin = _hexToColor(banner.colorFin);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 👁️ 1. MINI VISTA PREVIA DEL BANNER (Tal cual lo verá el cliente)
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              gradient: LinearGradient(
                colors: [colorInicio, colorFin],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                // Imagen de fondo si existe
                if (banner.imagenUrl != null && banner.imagenUrl!.isNotEmpty)
                  Positioned(
                    right: -10,
                    bottom: -10,
                    child: Opacity(
                      opacity: 0.3,
                      child: Image.network(
                        banner.imagenUrl!,
                        height: 100,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => const Icon(
                          Icons.broken_image,
                          size: 40,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),

                // Textos promocionales
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      banner.titulo,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      banner.descuento,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      banner.subtitulo,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.black54,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 🛠️ 2. PANEL DE CONTROLES ADMINISTRATIVOS
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Información de Orden y Estado
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Text(
                        'Posición: ${banner.orden}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      banner.activo ? 'Visible' : 'Oculto',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: banner.activo
                            ? Colors.green.shade700
                            : Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        value: banner.activo,
                        activeThumbColor: const Color(0xFF1E3A8A),
                        onChanged: onEstadoCambiado,
                      ),
                    ),
                  ],
                ),

                // Botones de Acción (Editar y Eliminar)
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.edit_outlined,
                        color: Colors.blueAccent,
                      ),
                      tooltip: 'Editar Banner',
                      onPressed: onEditar,
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.redAccent,
                      ),
                      tooltip: 'Eliminar Banner',
                      onPressed: onEliminar,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
