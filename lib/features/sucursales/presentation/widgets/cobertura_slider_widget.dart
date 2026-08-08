import 'package:flutter/material.dart';

class CoberturaSliderWidget extends StatelessWidget {
  final double radioActualKm;
  final ValueChanged<double> onChanged;

  const CoberturaSliderWidget({
    super.key,
    required this.radioActualKm,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.radar, color: Colors.grey),
        Expanded(
          child: Slider(
            value: radioActualKm,
            min: 1.0,
            max: 30.0,
            divisions: 58, // (30 - 1) / 0.5 para saltos de medio km
            activeColor: Colors.blue,
            onChanged: onChanged,
          ),
        ),
        SizedBox(
          width: 60,
          child: Text(
            '${radioActualKm.toStringAsFixed(1)} km',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}