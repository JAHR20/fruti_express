import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/promo_banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_format.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_schedule_status.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/utils/banner_date_format.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/widgets/promo_banner_renderer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  String? _scheduleLabel() {
    switch (banner.scheduleStatusAt(DateTime.now())) {
      case BannerScheduleStatus.scheduled:
        return 'Empieza ${formatBannerDate(banner.startsAt!)}';
      case BannerScheduleStatus.expired:
        return 'Venció ${formatBannerDate(banner.endsAt!)}';
      case BannerScheduleStatus.live:
        return banner.endsAt == null
            ? null
            : 'Vence ${formatBannerDate(banner.endsAt!)}';
      case BannerScheduleStatus.always:
        return null;
    }
  }

  Color _scheduleColor(ColorScheme colors) {
    switch (banner.scheduleStatusAt(DateTime.now())) {
      case BannerScheduleStatus.expired:
        return colors.error;
      case BannerScheduleStatus.scheduled:
        return colors.tertiary;
      default:
        return colors.onSurfaceVariant;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colors.shadow.withValues(alpha: 0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Center(
              child: SizedBox(
                width: 280,
                child: PromoBannerRenderer(
                  banner: banner,
                  format: BannerFormat.carouselCard,
                  resolveImageUrl: (path) => sl<SupabaseClient>().storage
                      .from('imagenes_banners')
                      .getPublicUrl(path),
                ),
              ),
            ),
          ),
          if (_scheduleLabel() != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.schedule, size: 16, color: _scheduleColor(colors)),
                  const SizedBox(width: 6),
                  Text(
                    _scheduleLabel()!,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: _scheduleColor(colors),
                    ),
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
                        color: colors.surfaceContainer,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: colors.outlineVariant),
                      ),
                      child: Text(
                        'Posición: ${banner.sortOrder}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: colors.onSurface,
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
                      icon: Icon(Icons.edit_outlined, color: colors.primary),
                      tooltip: 'Editar Banner',
                      onPressed: onEdit,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete_outline_rounded,
                        color: colors.error,
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
