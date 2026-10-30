import 'package:flutter/material.dart';

class SelectorChipsCpWidget extends StatelessWidget {
  final List<String> availableCodes;
  final List<String> selectedCodes;
  final Map<String, List<String>> neighborhoodsByPostalCode;
  final Function(String cp, bool seleccionado) onToggle;

  const SelectorChipsCpWidget({
    super.key,
    required this.availableCodes,
    required this.selectedCodes,
    required this.neighborhoodsByPostalCode,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme; 

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.surface, 
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colorScheme.outlineVariant), 
          ),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 12),
            childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            initiallyExpanded: false,
            shape: const RoundedRectangleBorder(side: BorderSide.none),
            collapsedShape: const RoundedRectangleBorder(side: BorderSide.none),
            title: Text(
              'Códigos Postales con cobertura',
              style: TextStyle(
                fontSize: 13, 
                fontWeight: FontWeight.bold, 
                color: colorScheme.onSurface, 
              ),
            ),
            subtitle: Text(
              '${selectedCodes.length} de ${availableCodes.length} seleccionados · Toca para ver/editar',
              style: TextStyle(
                fontSize: 11, 
                color: colorScheme.onSurfaceVariant, 
              ),
            ),
            children: [
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: availableCodes.map((cp) {
                  final estaSeleccionado = selectedCodes.contains(cp);
                  final neighborhoods = neighborhoodsByPostalCode[cp] ?? [];

                  return FilterChip(
                    label: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cp,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: estaSeleccionado 
                                ? colorScheme.primaryContainer
                                : colorScheme.onSurface,
                          ),
                        ),
                        if (neighborhoods.isNotEmpty)
                          Text(
                            neighborhoods.length > 3
                                ? '${neighborhoods.take(3).join(', ')} +${neighborhoods.length - 3}'
                                : neighborhoods.join(', '),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: estaSeleccionado 
                                  ? colorScheme.primary 
                                  : colorScheme.onSurfaceVariant,
                            ),
                          ),
                      ],
                    ),
                    selected: estaSeleccionado,
                    selectedColor: colorScheme.primary.withValues(alpha: 0.12), 
                    checkmarkColor: colorScheme.primary, 
                    onSelected: (bool nuevoValor) {
                      onToggle(cp, nuevoValor);
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}