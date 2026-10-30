import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/promo_banner.dart';

class PromoBannerCard extends StatelessWidget { 
  final PromoBanner banner;
  final VoidCallback onEdit; 
  final VoidCallback onDelete; 
  final Function(bool newStatus) onStatusChanged; 

  const PromoBannerCard({
    super.key,
    required this.banner,
    required this.onEdit,
    required this.onDelete,
    required this.onStatusChanged,
  });

  // 👇 Ahora recibe un fallback color dinámico basado en el tema
  Color _hexToColor(String hexString, Color fallback) {
    try {
      final buffer = StringBuffer();
      if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
      buffer.write(hexString.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {
      return fallback;
    }
  }

  @override
  Widget build(BuildContext context) {
    // 👇 Extraemos el esquema de colores general
    final colors = Theme.of(context).colorScheme;
    
    // Pasamos surfaceContainerHighest como color por defecto si el HEX falla
    final startColor = _hexToColor(banner.startColor, colors.surfaceContainerHighest); 
    final endColor = _hexToColor(banner.endColor, colors.surfaceContainerHighest); 

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: colors.surface, // 👈 Reemplaza Colors.white
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colors.shadow.withValues(alpha: 0.2), // 👈 Usa el color de sombra nativo del tema
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                colors: [startColor, endColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                if (banner.imageUrl != null && banner.imageUrl!.isNotEmpty) 
                  Positioned(
                    right: -10,
                    bottom: -10,
                    child: Opacity(
                      opacity: 0.3,
                      child: Image.network(
                        banner.imageUrl!,
                        height: 100,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => Icon(
                          Icons.broken_image,
                          size: 40,
                          color: colors.onSurfaceVariant, // 👈 Reemplaza Colors.grey
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
                      banner.title,
                      style: TextStyle(
                        color: colors.onSurfaceVariant, // 👈 Reemplaza Colors.black54
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      banner.discount,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: colors.onSurface, // 👈 Reemplaza Colors.black87
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      banner.subtitle, 
                      style: TextStyle(
                        fontSize: 11,
                        color: colors.onSurfaceVariant, // 👈 Reemplaza Colors.black54
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: colors.surfaceContainer, // 👈 Reemplaza Colors.grey.shade100
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: colors.outlineVariant), // 👈 Reemplaza Colors.grey.shade300
                      ),
                      child: Text(
                        'Posición: ${banner.sortOrder}', 
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: colors.onSurface, // 👈 Reemplaza Colors.black
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      banner.isActive ? 'Visible' : 'Oculto',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: banner.isActive
                            ? colors.primary 
                            : colors.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        value: banner.isActive,
                        onChanged: onStatusChanged,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.edit_outlined,
                        color: colors.primary,
                      ),
                      tooltip: 'Editar Banner',
                      onPressed: onEdit,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete_outline_rounded,
                        color: colors.error, // 👈 Reemplaza Colors.redAccent
                      ),
                      tooltip: 'Eliminar Banner',
                      onPressed: onDelete,
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