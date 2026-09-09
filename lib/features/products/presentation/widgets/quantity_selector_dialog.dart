import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart'; 

class QuantitySelectorDialog extends StatefulWidget { 
  final String productName; 
  final int pricePerKilo; 

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
    final int calculatedPrice = ((widget.pricePerKilo / 1000) * _currentGrams).round(); 

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        '¿Cuánto deseas de ${widget.productName}?',
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
            decoration: InputDecoration(
              labelText: 'Gramos exactos (ej. 150)',
              suffixText: 'g',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.scale),
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
              'Total estimado: ${CurrencyFormatter.format(calculatedPrice.toInt())}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4DB6AC),
              ),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar', style: TextStyle(color: Colors.grey)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF9A826),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: _currentGrams > 0
              ? () => Navigator.of(context).pop(_currentGrams)
              : null,
          child: const Text('Agregar', style: TextStyle(color: Colors.white)),
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
    return ActionChip(
      label: Text(label),
      backgroundColor: Colors.orange[50],
      side: const BorderSide(color: Color(0xFFF9A826)),
      onPressed: onTap,
    );
  }
}