import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruti_express_jahr_admin/core/utils/validators.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/enums/unidad_medida_producto.dart';

class DialogoAjusteStock extends StatefulWidget {
  final bool esAumento;
  final UnidadMedida unidadMedida;
  final int stockActual;
  final void Function(int cantidad) onConfirmar;

  const DialogoAjusteStock({
    super.key,
    required this.esAumento,
    required this.unidadMedida,
    required this.stockActual, // 🌟 NUEVO
    required this.onConfirmar,
  });

  @override
  State<DialogoAjusteStock> createState() => _DialogoAjusteStockState();
}

class _DialogoAjusteStockState extends State<DialogoAjusteStock> {
  final _cantidadController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _cantidadController.dispose();
    super.dispose();
  }

  bool get _aceptaDecimales =>
      widget.unidadMedida == UnidadMedida.gramo ||
      widget.unidadMedida == UnidadMedida.mililitro;

  String get _sufijoUnidad {
    switch (widget.unidadMedida) {
      case UnidadMedida.gramo:
        return 'Kg';
      case UnidadMedida.mililitro:
        return 'L';
      case UnidadMedida.pieza:
        return 'Pzas';
      case UnidadMedida.mazo:
        return 'Mazos';
    }
  }

  void _procesarConfirmacion() {
    if (!_formKey.currentState!.validate()) return;

    final texto = _cantidadController.text.trim();
    if (_aceptaDecimales) {
      final cantidadUI = double.parse(texto);
      final cantidadBase = (cantidadUI * 1000).toInt();
      widget.onConfirmar(cantidadBase);
    } else {
      final cantidadBase = int.parse(texto);
      widget.onConfirmar(cantidadBase);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final colorTema = widget.esAumento ? Colors.green : Colors.orange;
    final icono = widget.esAumento
        ? Icons.add_circle_outline
        : Icons.remove_circle_outline;
    final titulo = widget.esAumento
        ? 'Entrada de Stock'
        : 'Retirar del Inventario';
    final stockMostradoUI = _aceptaDecimales
        ? (widget.stockActual / 1000).toStringAsFixed(2)
        : widget.stockActual.toString();

    return AlertDialog(
      title: Row(
        children: [
          Icon(icono, color: colorTema),
          const SizedBox(width: 8),
          Text(titulo, style: TextStyle(color: colorTema, fontSize: 18)),
        ],
      ),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _cantidadController,
          decoration: InputDecoration(
            labelText: widget.esAumento
                ? 'Cantidad a agregar'
                : 'Cantidad a restar',
            suffixText: _sufijoUnidad,
            border: const OutlineInputBorder(),
            helperText: 'Stock actual: $stockMostradoUI $_sufijoUnidad',
          ),
          keyboardType: TextInputType.numberWithOptions(
            decimal: _aceptaDecimales,
          ),
          inputFormatters: _aceptaDecimales
              ? [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))]
              : [FilteringTextInputFormatter.digitsOnly],
          autofocus: true,
          // 🌟 NUEVO: Conectamos tu validador
          validator: Validators.ajusteInventario(
            esAumento: widget.esAumento,
            aceptaDecimales: _aceptaDecimales,
            stockActualBase: widget.stockActual,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar', style: TextStyle(color: Colors.grey)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: colorTema),
          onPressed: _procesarConfirmacion,
          child: const Text('Confirmar', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
