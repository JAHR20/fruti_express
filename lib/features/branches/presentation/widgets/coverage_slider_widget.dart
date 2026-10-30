import 'package:flutter/material.dart';

class CoverageSliderWidget extends StatelessWidget {
  final double radiusKmCurrent;
  final ValueChanged<double> onChanged;

  const CoverageSliderWidget({
    super.key,
    required this.radiusKmCurrent,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Icon(Icons.radar, color: colorScheme.onSurfaceVariant),
        Expanded(
          child: Slider(
            value: radiusKmCurrent,
            min: 1.0,
            max: 30.0,
            divisions: 58,
            activeColor: colorScheme.primary,
            onChanged: onChanged,
          ),
        ),
        SizedBox(
          width: 60,
          child: Text(
            '${radiusKmCurrent.toStringAsFixed(1)} km',
            style: TextStyle(fontWeight: FontWeight.bold, color: colorScheme.onSurface),
          ),
        ),
      ],
    );
  }
}