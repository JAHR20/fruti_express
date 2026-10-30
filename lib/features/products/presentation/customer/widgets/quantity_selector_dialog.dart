import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart'; 

class QuantitySelectorDialog extends StatefulWidget { 
  final String productName; 
  final int pricePerKilo; // Viene en centavos (ej. $50.00 = 5000)

  const QuantitySelectorDialog({
    super.key,
    required this.productName,
    required this.pricePerKilo,
  });

  @override
  State<QuantitySelectorDialog> createState() => _QuantitySelectorDialogState();
}

class _QuantitySelectorDialogState extends State<QuantitySelectorDialog> {
  final TextEditingController _controller = TextEditingController();
  int _currentGrams = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _quickSelect(int grams) { 
    setState(() {
      _currentGrams = grams;
      _controller.text = grams.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // Cálculo limpio usando centavos: (Precio por kilo en centavos / 1000g) * gramos deseados
    final int calculatedPriceCents = ((widget.pricePerKilo / 1000.0) * _currentGrams).round(); 

    return AlertDialog(
      backgroundColor: colorScheme.surface,
      surfaceTintColor: colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        '¿Cuánto deseas de ${widget.productName}?',
        style: TextStyle(
          fontSize: 18, 
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _QuickSelectButton( 
                label: '250g', 
                onTap: () => _quickSelect(250),
              ),
              _QuickSelectButton(
                label: '500g',
                onTap: () => _quickSelect(500),
              ),
              _QuickSelectButton(
                label: '1 Kg',
                onTap: () => _quickSelect(1000),
              ),
            ],
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: TextStyle(color: colorScheme.onSurface),
            decoration: InputDecoration(
              labelText: 'Gramos exactos (ej. 150)',
              labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
              suffixText: 'g',
              suffixStyle: TextStyle(color: colorScheme.onSurfaceVariant),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: colorScheme.outline),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: colorScheme.outlineVariant),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: colorScheme.primary, width: 2),
              ),
              prefixIcon: Icon(Icons.scale, color: colorScheme.secondaryContainer),
            ),
            onChanged: (value) { 
              setState(() {
                _currentGrams = int.tryParse(value) ?? 0;
              });
            },
          ),
          const SizedBox(height: 16),
          if (_currentGrams > 0)
            Text(
              // Usamos la extensión limpia de tu utilidad de moneda
              'Total estimado: ${calculatedPriceCents.toCurrencyFormat}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                // Usamos el color primario o un verde semántico coherente con el sistema
                color: colorScheme.primary,
              ),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Cancelar', 
            style: TextStyle(color: colorScheme.error, fontWeight: FontWeight.w700),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            disabledBackgroundColor: colorScheme.onSurface.withValues(alpha: 0.12),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: _currentGrams > 0
              ? () => Navigator.of(context).pop(_currentGrams)
              : null,
          child: Text(
            'Agregar', 
            style: TextStyle(
              color: _currentGrams > 0 
                  ? colorScheme.onPrimary 
                  : colorScheme.onSurface.withValues(alpha: 0.38),
                  fontWeight: FontWeight.w700
            ),
          ),
        ),
      ],
    );
  }
}

class _QuickSelectButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _QuickSelectButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ActionChip(
      label: Text(label),
      labelStyle: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.bold),
      backgroundColor: colorScheme.secondaryFixed,
      side: BorderSide(color: colorScheme.secondary),
      onPressed: onTap,
    );
  }
}