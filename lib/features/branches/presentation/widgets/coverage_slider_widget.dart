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
    return Row(
      children: [
        const Icon(Icons.radar, color: Colors.grey),
        Expanded(
          child: Slider(
            value: radiusKmCurrent,
            min: 1.0,
            max: 30.0,
            divisions: 58,
            activeColor: Colors.blue,
            onChanged: onChanged,
          ),
        ),
        SizedBox(
          width: 60,
          child: Text(
            '${radiusKmCurrent.toStringAsFixed(1)} km',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}