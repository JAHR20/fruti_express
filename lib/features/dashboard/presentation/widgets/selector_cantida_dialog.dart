import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruti_express_jahr_admin/core/utils/formato_moneda.dart';

class SelectorCantidadDialog extends StatefulWidget {
  final String nombreProducto;
  final int precioKilo;

  const SelectorCantidadDialog({
    super.key,
    required this.nombreProducto,
    required this.precioKilo,
  });

  @override
  State<SelectorCantidadDialog> createState() => _SelectorCantidadDialogState();
}

class _SelectorCantidadDialogState extends State<SelectorCantidadDialog> {
  final TextEditingController _controller = TextEditingController();
  int _gramosActuales = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _seleccionarRapido(int gramos) {
    setState(() {
      _gramosActuales = gramos;
      _controller.text = gramos.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final int precioCalculado = ((widget.precioKilo / 1000) * _gramosActuales)
        .round();

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        '¿Cuánto deseas de ${widget.nombreProducto}?',
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _BotonRapido(
                etiqueta: '250g',
                onTap: () => _seleccionarRapido(250),
              ),
              _BotonRapido(
                etiqueta: '500g',
                onTap: () => _seleccionarRapido(500),
              ),
              _BotonRapido(
                etiqueta: '1 Kg',
                onTap: () => _seleccionarRapido(1000),
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
            onChanged: (valor) {
              setState(() {
                _gramosActuales = int.tryParse(valor) ?? 0;
              });
            },
          ),
          const SizedBox(height: 16),
          if (_gramosActuales > 0)
            Text(
              'Total estimado: ${FormatoMoneda.formatear(precioCalculado)}',
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
          onPressed: _gramosActuales > 0
              ? () => Navigator.of(context).pop(_gramosActuales)
              : null,
          child: const Text('Agregar', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}

class _BotonRapido extends StatelessWidget {
  final String etiqueta;
  final VoidCallback onTap;

  const _BotonRapido({required this.etiqueta, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(etiqueta),
      backgroundColor: Colors.orange[50],
      side: const BorderSide(color: Color(0xFFF9A826)),
      onPressed: onTap,
    );
  }
}
