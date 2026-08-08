import 'package:flutter/material.dart';

class SelectorChipsCpWidget extends StatelessWidget {
  final List<String> codigosDisponibles;
  final List<String> codigosSeleccionados;
  final Function(String cp, bool seleccionado) onToggle;

  const SelectorChipsCpWidget({
    super.key,
    required this.codigosDisponibles,
    required this.codigosSeleccionados,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Selecciona los Códigos Postales con cobertura:',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: codigosDisponibles.map((cp) {
              final estaSeleccionado = codigosSeleccionados.contains(cp);

              return FilterChip(
                label: Text(
                  cp,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: estaSeleccionado ? Colors.blue.shade900 : Colors.black87,
                  ),
                ),
                selected: estaSeleccionado,
                selectedColor: Colors.blue.withValues(alpha: 0.3),
                checkmarkColor: Colors.blue.shade900,
                onSelected: (bool nuevoValor) {
                  // 🌟 Avisamos hacia afuera qué chip se tocó
                  onToggle(cp, nuevoValor);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}