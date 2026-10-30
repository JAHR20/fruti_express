import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_rate.dart';

class CoverageProgressBar extends StatelessWidget {
  final List<ShippingRate> rates;
  final double maxLimitKm;

  const CoverageProgressBar({
    super.key,
    required this.rates,
    this.maxLimitKm = 10.0,
  });

  /// 🎨 Obtiene un color dinámico basado en el Theme del contexto
  static Color getColor(BuildContext context, int index) {
    final colorScheme = Theme.of(context).colorScheme;
    final List<Color> rateColors = [
      colorScheme.primary,
      colorScheme.secondary,
      colorScheme.tertiary,
      colorScheme.primaryContainer,
      colorScheme.secondaryContainer,
      colorScheme.tertiaryContainer,
    ];
    return rateColors[index % rateColors.length];
  }

  /// 🔤 Determina el color de texto adecuado para contrastar con el fondo
  static Color getTextColor(BuildContext context, Color backgroundColor) {
    final colorScheme = Theme.of(context).colorScheme;
    if (backgroundColor == colorScheme.primaryContainer ||
        backgroundColor == colorScheme.secondaryContainer ||
        backgroundColor == colorScheme.tertiaryContainer) {
      return colorScheme.onPrimaryContainer;
    }
    if (backgroundColor == colorScheme.secondary) {
      return colorScheme.onSecondary;
    }
    if (backgroundColor == colorScheme.tertiary) {
      return colorScheme.onTertiary;
    }
    return colorScheme.onPrimary;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // Ordenamos las tarifas por distancia mínima
    final sortedRates = List<ShippingRate>.from(rates)
      ..sort((a, b) => a.minDistanceKm.compareTo(b.minDistanceKm));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Mapa de Cobertura de Tarifas',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              'Límite: ${maxLimitKm.toStringAsFixed(1)} km',
              style: TextStyle(
                color: colorScheme.onSurfaceVariant,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        
        Container(
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colorScheme.errorContainer, // Contenedor de error para huecos
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final totalWidth = constraints.maxWidth;
                List<Widget> segments = [];
                double currentPosition = 0.0;
                int index = 0;

                for (var rate in sortedRates) {
                  // Si hay un espacio (hueco) antes de la tarifa
                  if (rate.minDistanceKm > currentPosition) {
                    final gapWidth = ((rate.minDistanceKm - currentPosition) / maxLimitKm) * totalWidth;
                    segments.add(
                      Container(
                        width: gapWidth.clamp(0.0, totalWidth),
                        color: colorScheme.error,
                        child: Center(
                          child: Text(
                            '!', 
                            style: TextStyle(
                              color: colorScheme.onError, 
                              fontSize: 10, 
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }

                  // Obtenemos color y texto sincronizados con el tema
                  final rateColor = getColor(context, index);
                  final textColor = getTextColor(context, rateColor);

                  // Pintamos el tramo cubierto por la tarifa
                  final rateRange = rate.maxDistanceKm - rate.minDistanceKm;
                  final rateWidth = (rateRange / maxLimitKm) * totalWidth;
                  
                  segments.add(
                    Container(
                      width: rateWidth.clamp(0.0, totalWidth),
                      color: rateColor,
                      alignment: Alignment.center,
                      child: Text(
                        '${rate.maxDistanceKm}km',
                        style: TextStyle(
                          color: textColor, 
                          fontSize: 10, 
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );

                  currentPosition = rate.maxDistanceKm;
                  index++;
                }

                // Si queda espacio libre al final hasta el límite máximo
                if (currentPosition < maxLimitKm) {
                  final remainingWidth = ((maxLimitKm - currentPosition) / maxLimitKm) * totalWidth;
                  segments.add(
                    Container(
                      width: remainingWidth.clamp(0.0, totalWidth),
                      color: colorScheme.surfaceContainerHighest,
                    ),
                  );
                }

                return Row(children: segments);
              },
            ),
          ),
        ),
      ],
    );
  }
}