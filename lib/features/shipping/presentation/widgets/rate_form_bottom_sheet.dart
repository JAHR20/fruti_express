import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_rate.dart';

class RateFormBottomSheet extends StatefulWidget {
  final ShippingRate? rateToEdit;
  final bool isSaving;
  final double defaultMinDistance;
  final double maxRadiusKm;
  final double minAllowedKm;
  final double maxAllowedKm;
  final String? errorMessage;

  final void Function(String name, double minKm, double maxKm, int costInCents)
  onSave;

  const RateFormBottomSheet({
    super.key,
    this.rateToEdit,
    required this.isSaving,
    this.defaultMinDistance = 0.0,
    this.maxRadiusKm = 15.0,
    this.errorMessage,
    this.minAllowedKm = 0.0,
    this.maxAllowedKm = 15.0,
    required this.onSave,
  });

  @override
  State<RateFormBottomSheet> createState() => _RateFormBottomSheetState();
}

class _RateFormBottomSheetState extends State<RateFormBottomSheet> {
  static const double _distanceStepKm = 0.1;

  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameCtrl;
  late final TextEditingController _costCtrl;

  late double _minKm;
  late double _maxKm;


  double get _lowerLimit => widget.minAllowedKm;

  double get _upperLimit => widget.maxAllowedKm;

  int _getDivisions(double min, double max) {
    final steps = ((max - min) / _distanceStepKm).round();
    return steps.clamp(1, 100000);
  }

  @override
  void initState() {
    super.initState();

    _nameCtrl = TextEditingController(text: widget.rateToEdit?.name ?? '');

    _costCtrl = TextEditingController(
      text: widget.rateToEdit != null
          ? (widget.rateToEdit!.cost / 100).toStringAsFixed(2)
          : '',
    );

    final lowerLimit = widget.minAllowedKm;
    final upperLimit = widget.maxAllowedKm;

    _minKm = (widget.rateToEdit?.minDistanceKm ?? lowerLimit).clamp(
      lowerLimit,
      upperLimit,
    );

    _maxKm = (widget.rateToEdit?.maxDistanceKm ?? upperLimit).clamp(
      lowerLimit,
      upperLimit,
    );

    if (_minKm >= _maxKm) {
      _minKm = lowerLimit;
      _maxKm = upperLimit;
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _costCtrl.dispose();
    super.dispose();
  }

  String _formatKm(double value) => '${value.toStringAsFixed(1)} km';

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final colorScheme = Theme.of(context).colorScheme;

    if (_minKm >= _maxKm) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'La distancia mínima debe ser menor que la máxima.',
          ),
          backgroundColor: colorScheme.error,
        ),
      );
      return;
    }

    final costInCents = _costCtrl.text.toCents;

    if (costInCents < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('El costo no puede ser negativo.'),
          backgroundColor: colorScheme.error,
        ),
      );
      return;
    }

    widget.onSave(
      _nameCtrl.text.trim(),
      double.parse(_minKm.toStringAsFixed(1)),
      double.parse(_maxKm.toStringAsFixed(1)),
      costInCents,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isEditing = widget.rateToEdit != null;
    final radius = widget.maxRadiusKm;

    final minSliderMax = (_maxKm - _distanceStepKm)
        .clamp(_lowerLimit, _upperLimit)
        .toDouble();

    final maxSliderMin = (_minKm + _distanceStepKm)
        .clamp(_lowerLimit, _upperLimit)
        .toDouble();

    final canChangeMin = minSliderMax > _lowerLimit;
    final canChangeMax = _upperLimit > maxSliderMin;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isEditing ? 'Editar tarifa' : 'Nueva tarifa',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: widget.isSaving
                          ? null
                          : () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                if (widget.errorMessage != null) ...[
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorScheme.errorContainer,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: colorScheme.error),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: colorScheme.onErrorContainer,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            widget.errorMessage!,
                            style: TextStyle(
                              color: colorScheme.onErrorContainer,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],

                TextFormField(
                  controller: _nameCtrl,
                  enabled: !widget.isSaving,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                    labelText: 'Nombre de la tarifa',
                    hintText: 'Ej. Envío Centro, Zona Norte, etc.',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.label_outline),
                  ),
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'Ingresa un nombre para identificarla'
                      : null,
                ),
                const SizedBox(height: 24),

                Text(
                  'Rango de distancia',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Distancia mínima'),
                    Text(
                      _formatKm(_minKm),
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Slider(
                  value: _minKm.clamp(_lowerLimit, minSliderMax).toDouble(),
                  min: _lowerLimit,
                  max: minSliderMax,
                  divisions: _getDivisions(_lowerLimit, minSliderMax),
                  label: _formatKm(_minKm),
                  onChanged: widget.isSaving || !canChangeMin
                      ? null
                      : (value) {
                          setState(() {
                            _minKm =
                                (value / _distanceStepKm).round() *
                                _distanceStepKm;
                          });
                        },
                ),

                const SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Distancia máxima'),
                    Text(
                      _formatKm(_maxKm),
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Slider(
                  value: _maxKm.clamp(maxSliderMin, _upperLimit).toDouble(),
                  min: maxSliderMin,
                  max: _upperLimit,
                  divisions: _getDivisions(maxSliderMin, _upperLimit),
                  label: _formatKm(_maxKm),
                  onChanged: widget.isSaving || !canChangeMax
                      ? null
                      : (value) {
                          setState(() {
                            _maxKm =
                                (value / _distanceStepKm).round() *
                                _distanceStepKm;
                          });
                        },
                ),

                Text(
                  'Radio máximo de la sucursal: ${_formatKm(radius)}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 24),

                TextFormField(
                  controller: _costCtrl,
                  enabled: !widget.isSaving,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Costo del envío (\$)',
                    prefixIcon: Icon(Icons.attach_money),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Ingresa el costo del envío';
                    }

                    final cost = double.tryParse(
                      value.trim().replaceAll(',', '.'),
                    );

                    if (cost == null || !cost.isFinite || cost < 0) {
                      return 'Ingresa un costo válido';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: widget.isSaving ? null : _submit,
                    child: widget.isSaving
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: colorScheme.onPrimary,
                            ),
                          )
                        : Text(
                            isEditing ? 'Guardar cambios' : 'Agregar tarifa',
                            style: const TextStyle(fontSize: 16),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
