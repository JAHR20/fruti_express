import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/validators.dart';
import 'package:fruti_express_jahr_admin/features/coupons/domain/enums/discount_type.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/coupon.dart';
import '../cubits/coupon_cubit.dart';
import '../cubits/coupon_state.dart';

class CouponForm extends StatefulWidget {
  final Coupon? coupon;
  final Profile currentUser;

  const CouponForm({super.key, this.coupon, required this.currentUser});

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
    _minAmountCtrl = TextEditingController(
      text: c?.minPurchaseAmount.toString() ?? '0',
    );
    _usageLimitCtrl = TextEditingController(
      text: c?.usageLimit?.toString() ?? '',
    );

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

    final currentUser = widget.currentUser;
    final isEditing = widget.coupon != null;

    final newCoupon = Coupon(
      id: isEditing ? widget.coupon!.id : '',
      code: _codeCtrl.text.trim().toUpperCase(),
      discountType: _discountType,
      discountValue: int.parse(_valueCtrl.text),
      minPurchaseAmount: int.parse(_minAmountCtrl.text),
      validFrom: _validFrom,
      validUntil: _validUntil,
      usageLimit: _usageLimitCtrl.text.isEmpty
          ? null
          : int.parse(_usageLimitCtrl.text),
      usedCount: isEditing ? widget.coupon!.usedCount : 0,
      isActive: _isActive,
      createdAt: isEditing ? widget.coupon!.createdAt : DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final cubit = context.read<CouponCubit>();

    if (isEditing) {
      cubit.updateCoupon(currentUser: currentUser, coupon: newCoupon);
    } else {
      cubit.createCoupon(currentUser: currentUser, coupon: newCoupon);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: BlocConsumer<CouponCubit, CouponState>(
        listenWhen: (previous, current) =>
            previous.operationSuccessful != current.operationSuccessful ||
            previous.operationError != current.operationError,
        listener: (context, state) {
          // Si hubo éxito, cerramos el modal
          if (state.operationSuccessful == true) {
            Navigator.pop(context);
          }
          // Si hubo error, mostramos el SnackBar traducido
          if (state.operationError != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.operationError!),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final isSaving =
              state.isSavingOperation ||
              (state.processingCouponId != null &&
                  state.processingCouponId == widget.coupon?.id);

          return Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  widget.coupon == null ? 'Nuevo Cupón' : 'Editar Cupón',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _codeCtrl,
                  enabled: !isSaving, // Bloqueamos si está guardando
                  decoration: const InputDecoration(
                    labelText: 'Código (Ej. VERANO26)',
                  ),
                  textCapitalization: TextCapitalization.characters,
                  validator: (v) => v!.isEmpty ? 'Requerido' : null,
                ),

                DropdownButtonFormField<DiscountType>(
                  initialValue: _discountType,
                  decoration: const InputDecoration(
                    labelText: 'Tipo de Descuento',
                  ),
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
                  onChanged: isSaving
                      ? null
                      : (val) => setState(() => _discountType = val!),
                ),

                TextFormField(
                  controller: _valueCtrl,
                  enabled: !isSaving,
                  decoration: const InputDecoration(
                    labelText: 'Valor del Descuento',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: Validators.positiveNumber,
                ),

                TextFormField(
                  controller: _minAmountCtrl,
                  enabled: !isSaving,
                  decoration: const InputDecoration(
                      labelText: 'Monto mínimo de compra',
                      helperText: 'Dejar en 0 si no hay mínimo',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  // 🌟 Usamos tu validador directamente
                  validator: Validators.positiveNumber,
                ),

                TextFormField(
                  controller: _usageLimitCtrl,
                  enabled: !isSaving,
                  decoration: const InputDecoration(
                    labelText: 'Límite de usos totales (Opcional)',
                    helperText: 'Dejar vacío para usos ilimitados',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: Validators.optionalPositiveNumber,
                ),

                if (widget.coupon != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                    child: Text(
                      'Este cupón se ha usado ${widget.coupon!.usedCount} veces.',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),

                ListTile(
                  title: const Text('Válido Desde'),
                  subtitle: Text(DateFormat('dd/MM/yyyy').format(_validFrom)),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: isSaving ? null : () => _pickDate(true),
                ),

                ListTile(
                  title: const Text('Válido Hasta (Opcional)'),
                  subtitle: Text(
                    _validUntil != null
                        ? DateFormat('dd/MM/yyyy').format(_validUntil!)
                        : 'Sin caducidad',
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: isSaving
                        ? null
                        : () => setState(() => _validUntil = null),
                  ),
                  onTap: isSaving ? null : () => _pickDate(false),
                ),

                SwitchListTile(
                  title: const Text('Cupón Activo'),
                  value: _isActive,
                  onChanged: isSaving
                      ? null
                      : (val) => setState(() => _isActive = val),
                ),

                const SizedBox(height: 16),

                ElevatedButton(
                  onPressed: isSaving ? null : _submit,
                  child: isSaving
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Guardar'),
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        },
      ),
    );
  }
}
