import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruti_express_jahr_admin/core/utils/validators.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart';

class StockAdjustmentDialog extends StatefulWidget {
  final bool isIncrease; 
  final MeasurementUnit measurementUnit; 
  final int currentStock; 
  final void Function(int quantity) onConfirm; 

  const StockAdjustmentDialog({
    super.key,
    required this.isIncrease,
    required this.measurementUnit,
    required this.currentStock, 
    required this.onConfirm,
  });

  @override
  State<StockAdjustmentDialog> createState() => _StockAdjustmentDialogState();
}

class _StockAdjustmentDialogState extends State<StockAdjustmentDialog> {
  final _quantityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  bool get _acceptsDecimals =>
      widget.measurementUnit == MeasurementUnit.gram ||
      widget.measurementUnit == MeasurementUnit.milliliter;

  String get _unitSuffix {
    switch (widget.measurementUnit) {
      case MeasurementUnit.gram:
        return 'Kg';
      case MeasurementUnit.milliliter:
        return 'L';
      case MeasurementUnit.piece:
        return 'Pzas';
      case MeasurementUnit.bunch: 
        return 'Mazos';
    }
  }

  void _processConfirmation() { 
    if (!_formKey.currentState!.validate()) return;

    final text = _quantityController.text.trim();
    if (_acceptsDecimals) {
      final quantityUI = double.parse(text);
      final baseQuantity = (quantityUI * 1000).toInt();
      widget.onConfirm(baseQuantity);
    } else {
      final baseQuantity = int.parse(text);
      widget.onConfirm(baseQuantity);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = widget.isIncrease ? Colors.green : Colors.orange;
    final icon = widget.isIncrease
        ? Icons.add_circle_outline
        : Icons.remove_circle_outline;
    final title = widget.isIncrease
        ? 'Entrada de Stock'
        : 'Retirar del Inventario';
        
    final displayedStockUI = _acceptsDecimals
        ? (widget.currentStock / 1000).toStringAsFixed(2)
        : widget.currentStock.toString();

    return AlertDialog(
      title: Row(
        children: [
          Icon(icon, color: themeColor),
          const SizedBox(width: 8),
          Text(title, style: TextStyle(color: themeColor, fontSize: 18)),
        ],
      ),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _quantityController,
          decoration: InputDecoration(
            labelText: widget.isIncrease
                ? 'Cantidad a agregar'
                : 'Cantidad a restar',
            suffixText: _unitSuffix,
            border: const OutlineInputBorder(),
            helperText: 'Stock actual: $displayedStockUI $_unitSuffix',
          ),
          keyboardType: TextInputType.numberWithOptions(
            decimal: _acceptsDecimals,
          ),
          inputFormatters: _acceptsDecimals
              ? [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))]
              : [FilteringTextInputFormatter.digitsOnly],
          autofocus: true,
          validator: Validators.inventoryAdjustment( 
            isIncrease: widget.isIncrease,
            acceptsDecimals: _acceptsDecimals,
            baseCurrentStock: widget.currentStock,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar', style: TextStyle(color: Colors.grey)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: themeColor),
          onPressed: _processConfirmation,
          child: const Text('Confirmar', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}