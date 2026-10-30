import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:fruti_express_jahr_admin/core/widgets/form_bottom_sheet_shell.dart';
import 'package:fruti_express_jahr_admin/core/widgets/bottom_sheet_header.dart';
import 'package:fruti_express_jahr_admin/core/widgets/bottom_sheet_form_actions.dart';
import 'package:fruti_express_jahr_admin/core/widgets/custom_dropdown_field.dart';
import 'package:fruti_express_jahr_admin/core/widgets/custom_text_field.dart';
import 'package:fruti_express_jahr_admin/core/utils/validators.dart';
import 'package:fruti_express_jahr_admin/features/coupons/domain/enums/discount_type.dart';
import '../../domain/entities/coupon.dart';

class CouponForm extends StatefulWidget {
  final Coupon? coupon;
  final bool isSaving; // Recibe el estado de carga desde afuera
  
  // Callback que devuelve los datos listos para ser guardados
  final void Function(
    String code,
    DiscountType discountType,
    int discountValue,
    int minPurchaseAmount,
    int? usageLimit,
    DateTime validFrom,
    DateTime? validUntil,
    bool isActive,
  ) onSave;

  const CouponForm({
    super.key,
    this.coupon,
    required this.isSaving,
    required this.onSave,
  });

  @override
  State<CouponForm> createState() => _CouponFormState();
}

class _CouponFormState extends State<CouponForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _codeCtrl;
  late TextEditingController _valueCtrl;
  late TextEditingController _minAmountCtrl;
  late TextEditingController _usageLimitCtrl;

  DiscountType _discountType = DiscountType.percentage;
  DateTime _validFrom = DateTime.now();
  DateTime? _validUntil;
  bool _isActive = true;

  @override
  void initState() {
    super.initState();
    final c = widget.coupon;
    _codeCtrl = TextEditingController(text: c?.code ?? '');
    _valueCtrl = TextEditingController(text: c?.discountValue.toString() ?? '');
    _minAmountCtrl = TextEditingController(text: c?.minPurchaseAmount.toString() ?? '0');
    _usageLimitCtrl = TextEditingController(text: c?.usageLimit?.toString() ?? '');

    if (c != null) {
      _discountType = c.discountType;
      _validFrom = c.validFrom;
      _validUntil = c.validUntil;
      _isActive = c.isActive;
    }
  }

  @override
  void dispose() {
    _codeCtrl.dispose();
    _valueCtrl.dispose();
    _minAmountCtrl.dispose();
    _usageLimitCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDate(bool isStart) async {
    final firstDateAllowed = isStart ? DateTime(2020) : _validFrom;

    final initialDate = isStart
        ? _validFrom
        : (_validUntil != null && !_validUntil!.isBefore(_validFrom)
            ? _validUntil!
            : _validFrom);

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDateAllowed,
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          _validFrom = picked;
          if (_validUntil != null && _validUntil!.isBefore(_validFrom)) {
            _validUntil = null;
          }
        } else {
          _validUntil = picked;
        }
      });
    }
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    widget.onSave(
      _codeCtrl.text.trim().toUpperCase(),
      _discountType,
      int.parse(_valueCtrl.text),
      int.parse(_minAmountCtrl.text),
      _usageLimitCtrl.text.isEmpty ? null : int.parse(_usageLimitCtrl.text),
      _validFrom,
      _validUntil,
      _isActive,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormBottomSheetShell(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BottomSheetHeader(
              title: widget.coupon == null ? 'Nuevo Cupón' : 'Editar Cupón',
              isDisabled: widget.isSaving,
            ),
            const SizedBox(height: 24),

            CustomTextField(
              label: 'Código',
              hintText: 'Ejemp. VERANO26',
              controller: _codeCtrl,
              enabled: !widget.isSaving,
              textCapitalization: TextCapitalization.characters,
              validator: Validators.required(),
            ),
            const SizedBox(height: 16),

            CustomDropdownField<DiscountType>(
              value: _discountType,
              label: 'Tipo de descuento',
              items: const [
                DropdownMenuItem(
                  value: DiscountType.percentage,
                  child: Text('Porcentaje (%)'),
                ),
                DropdownMenuItem(
                  value: DiscountType.fixed,
                  child: Text('Monto Fijo (\$)'),
                ),
              ],
              onChanged: widget.isSaving
                  ? null
                  : (val) => setState(() => _discountType = val!),
            ),
            const SizedBox(height: 16),

            CustomTextField(
              label: 'Valor de descuento',
              controller: _valueCtrl,
              enabled: !widget.isSaving,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: Validators.positiveNumber,
            ),
            const SizedBox(height: 16),

            CustomTextField(
              label: 'Monto minimo de compra',
              helperText: const Text('Dejar en 0 si no hay mínimo'),
              controller: _minAmountCtrl,
              enabled: !widget.isSaving,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: Validators.positiveNumber,
            ),
            const SizedBox(height: 16),

            CustomTextField(
              label: 'Límite de usos totales (Opcional)',
              helperText: const Text('Dejar vacío para usos ilimitados'),
              controller: _usageLimitCtrl,
              enabled: !widget.isSaving,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: Validators.optionalPositiveNumber,
            ),

            if (widget.coupon != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                child: Text(
                  'Este cupón se ha usado ${widget.coupon!.usedCount} veces.',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),

            const SizedBox(height: 8),

            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Válido Desde'),
              subtitle: Text(DateFormat('dd/MM/yyyy').format(_validFrom)),
              trailing: const Icon(Icons.calendar_today),
              onTap: widget.isSaving ? null : () => _pickDate(true),
            ),

            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Válido Hasta (Opcional)'),
              subtitle: Text(
                _validUntil != null
                    ? DateFormat('dd/MM/yyyy').format(_validUntil!)
                    : 'Sin caducidad',
              ),
              trailing: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: widget.isSaving
                    ? null
                    : () => setState(() => _validUntil = null),
              ),
              onTap: widget.isSaving ? null : () => _pickDate(false),
            ),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Cupón Activo'),
              value: _isActive,
              onChanged: widget.isSaving
                  ? null
                  : (val) => setState(() => _isActive = val),
            ),
            const SizedBox(height: 32),

            BottomSheetFormActions(
              isSaving: widget.isSaving,
              saveLabel: 'Guardar',
              onSave: _submit,
            ),
          ],
        ),
      ),
    );
  }
}