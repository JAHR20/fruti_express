import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:fruti_express_jahr_admin/core/widgets/custom_text_field.dart';
import 'package:fruti_express_jahr_admin/core/widgets/form_bottom_sheet_shell.dart';
import 'package:fruti_express_jahr_admin/core/widgets/bottom_sheet_header.dart';
import 'package:fruti_express_jahr_admin/core/widgets/bottom_sheet_form_actions.dart';
import 'package:fruti_express_jahr_admin/core/widgets/image_picker_field.dart';

import 'package:fruti_express_jahr_admin/core/utils/validators.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_style_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_template_settings.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/promo_banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/services/banner_style_config_builder.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/utils/banner_date_format.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/widgets/banner_template_editor.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/widgets/promo_banner_renderer.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';

class PromoBannerFormBottomSheet extends StatefulWidget {
  final PromoBanner? bannerToEdit;
  final bool isSaving;

  /// Categorías activas para elegir a dónde lleva el botón.
  final List<Category> categories;
  final Function(
    String title,
    String discount,
    String subtitle,
    String startColor,
    String endColor,
    int sortOrder,
    File? image,
    BannerStyleConfig? styleConfig,
    DateTime? startsAt,
    DateTime? endsAt,
    List<int> weekdays,
  ) onSave;

  const PromoBannerFormBottomSheet({
    super.key,
    this.bannerToEdit,
    this.categories = const [],
    required this.isSaving,
    required this.onSave,
  });

  @override
  State<PromoBannerFormBottomSheet> createState() =>
      _PromoBannerFormBottomSheetState();
}

class _PromoBannerFormBottomSheetState
    extends State<PromoBannerFormBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _titleCtrl;
  late TextEditingController _discountCtrl;
  late TextEditingController _subtitleCtrl;
  late TextEditingController _sortOrderCtrl;
  late Color _startColor;
  late Color _endColor;

  // Plantilla: null en el banner = diseño clásico.
  late bool _useTemplate;
  late BannerTemplateSettings _settings;

  // Programación (hora local; null = sin límite).
  DateTime? _startsAt;
  DateTime? _endsAt;
  String? _scheduleError;
  late Set<int> _weekdays;

  static const _weekdayOptions = [
    (1, 'L', 'Lunes'),
    (2, 'M', 'Martes'),
    (3, 'X', 'Miércoles'),
    (4, 'J', 'Jueves'),
    (5, 'V', 'Viernes'),
    (6, 'S', 'Sábado'),
    (7, 'D', 'Domingo'),
  ];

  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    final b = widget.bannerToEdit;
    _titleCtrl = TextEditingController(text: b?.title ?? '');
    _discountCtrl = TextEditingController(text: b?.discount ?? '');
    _subtitleCtrl = TextEditingController(text: b?.subtitle ?? '');
    _sortOrderCtrl = TextEditingController(
      text: b?.sortOrder.toString() ?? '0',
    );
    _startColor = _hexToColor(b?.startColor ?? '#E8F5E9');
    _endColor = _hexToColor(b?.endColor ?? '#C8E6C9');

    _useTemplate = b?.styleConfig != null;
    _settings = BannerTemplateSettings.fromConfig(b?.styleConfig);

    _startsAt = b?.startsAt?.toLocal();
    _endsAt = b?.endsAt?.toLocal();
    _weekdays = {...(b?.weekdays ?? const <int>[])};
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _discountCtrl.dispose();
    _subtitleCtrl.dispose();
    _sortOrderCtrl.dispose();
    super.dispose();
  }

  Color _hexToColor(String hex) {
    hex = hex.replaceFirst('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    return Color(int.parse(hex, radix: 16));
  }

  String _colorToHex(Color color) {
    return '#${color.toARGB32().toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';
  }

  /// Texto oscuro sobre fondos claros y blanco sobre fondos oscuros.
  String _readableTextHex() {
    final luminance =
        (_startColor.computeLuminance() + _endColor.computeLuminance()) / 2;
    return luminance > 0.5 ? '#1F1F1F' : '#FFFFFF';
  }

  void _setUseTemplate(bool value) {
    setState(() {
      _useTemplate = value;
      // Un banner que todavía no tenía plantilla empieza con un color legible.
      if (value && widget.bannerToEdit?.styleConfig == null) {
        _settings = _settings.copyWith(textColor: _readableTextHex());
      }
    });
  }

  BannerStyleConfig? _buildStyleConfig() {
    if (!_useTemplate) return null;
    return BannerStyleConfigBuilder.build(
      settings: _settings,
      backgroundStartHex: _colorToHex(_startColor),
      backgroundEndHex: _colorToHex(_endColor),
    );
  }

  /// Banner con lo que hay escrito en el formulario, para la vista previa.
  PromoBanner _draftBanner() {
    final b = widget.bannerToEdit;
    return PromoBanner(
      id: b?.id ?? '',
      title: _titleCtrl.text.trim(),
      discount: _discountCtrl.text.trim(),
      subtitle: _subtitleCtrl.text.trim(),
      startColor: _colorToHex(_startColor),
      endColor: _colorToHex(_endColor),
      imageUrl: b?.imageUrl,
      isActive: b?.isActive ?? true,
      sortOrder: int.tryParse(_sortOrderCtrl.text.trim()) ?? 0,
      createdAt: b?.createdAt ?? DateTime.now(),
      styleConfig: _buildStyleConfig(),
      startsAt: _startsAt,
      endsAt: _endsAt,
      weekdays: (_weekdays.toList()..sort()),
    );
  }

  Future<void> _pickDateTime({required bool isStart}) async {
    final now = DateTime.now();
    final current = isStart ? _startsAt : _endsAt;

    final date = await showDatePicker(
      context: context,
      initialDate: current ?? now,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 3),
    );
    if (date == null || !mounted) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(current ?? now),
    );
    if (time == null || !mounted) return;

    final picked = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    setState(() {
      if (isStart) {
        _startsAt = picked;
      } else {
        _endsAt = picked;
      }
      _scheduleError = null;
    });
  }

  Widget _scheduleTile({
    required String label,
    required DateTime? value,
    required String emptyText,
    required VoidCallback? onTap,
    required VoidCallback? onClear,
  }) {
    final colors = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: colors.outline),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const Icon(Icons.event_outlined, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: const TextStyle(fontSize: 12)),
                  Text(
                    value == null ? emptyText : formatBannerDate(value),
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            if (value != null)
              IconButton(
                icon: const Icon(Icons.close),
                tooltip: 'Quitar',
                onPressed: onClear,
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (image != null) {
      setState(() => _selectedImage = File(image.path));
    }
  }

  void _showColorPicker({required bool isStartColor}) {
    Color tempColor = isStartColor ? _startColor : _endColor;

    showDialog(
      context: context,
      builder: (context) {
        // Obtenemos los colores dentro del contexto del diálogo si fuera necesario
        return AlertDialog(
          title: const Text('Selecciona un color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: tempColor,
              enableAlpha: false,
              displayThumbColor: true,
              paletteType: PaletteType.hsvWithHue,
              pickerAreaBorderRadius: const BorderRadius.all(Radius.circular(12)),
              onColorChanged: (Color color) {
                tempColor = color;
              },
            ),
          ),
          actions: [
            // 👇 Eliminamos los colores forzados; toman el estilo global del tema
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (isStartColor) {
                    _startColor = tempColor;
                  } else {
                    _endColor = tempColor;
                  }
                });
                Navigator.pop(context);
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  /// Con estas fechas y días, ningún día marcado cae dentro del periodo.
  bool get _neverShows => _draftBanner().neverShows;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final start = _startsAt;
    final end = _endsAt;
    if (start != null && end != null && !end.isAfter(start)) {
      setState(() {
        _scheduleError = 'La fecha de fin debe ser posterior a la de inicio';
      });
      return;
    }

    if (_neverShows) {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: const Text('Este banner no se mostrará'),
          content: const Text(
            'Con estas fechas y días, ningún día marcado cae dentro del '
            'periodo, así que los clientes nunca lo verán. '
            '¿Quieres guardarlo de todos modos?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('Revisar'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(dialogContext, true),
              child: const Text('Guardar así'),
            ),
          ],
        ),
      );
      if (confirmed != true || !mounted) return;
    }

    widget.onSave(
      _titleCtrl.text.trim(),
      _discountCtrl.text.trim(),
      _subtitleCtrl.text.trim(),
      _colorToHex(_startColor),
      _colorToHex(_endColor),
      int.tryParse(_sortOrderCtrl.text.trim()) ?? 0,
      _selectedImage,
      _buildStyleConfig(),
      // Siempre en UTC (el modelo también lo asegura).
      start?.toUtc(),
      end?.toUtc(),
      (_weekdays.toList()..sort()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 👇 Extraemos el esquema de colores del tema
    final colors = Theme.of(context).colorScheme;

    return FormBottomSheetShell(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BottomSheetHeader(
              title: widget.bannerToEdit == null ? 'Nuevo Banner' : 'Editar Banner',
              isDisabled: widget.isSaving,
            ),
            const SizedBox(height: 24),
            ImagePickerField(
              selectedImage: _selectedImage,
              existingImageUrl: widget.bannerToEdit?.imageUrl,
              onTap: widget.isSaving ? null : _pickImage,
              placeholderText: 'Añadir imagen (opcional)',
              height: 120,
            ),
            const SizedBox(height: 16),

            CustomTextField(
              label: 'Titulo',
              hintText: 'Ejem. Fin de semana de descuento',
              controller: _titleCtrl,
              validator: Validators.compose([
                Validators.required('el título'),
                Validators.minLength(3, 'El título'),
              ]),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CustomTextField(
                    label: 'Descuento',
                    hintText: 'Ejemp. 15%',
                    controller: _discountCtrl,
                    validator: Validators.required('el texto de descuento'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 1,
                  child: CustomTextField(
                    label: 'Orden',
                    controller: _sortOrderCtrl,
                    keyboardType: TextInputType.number,
                    validator: Validators.positiveNumber,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            CustomTextField(
              label: 'Subtítulo (Términos cortos)',
              controller: _subtitleCtrl,
              validator: Validators.compose([
                Validators.required('el subtítulo'),
                Validators.minLength(4, 'El subtítulo'),
              ]),
            ),
            const SizedBox(height: 16),
            const Text(
              'Colores de Fondo',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: widget.isSaving
                        ? null
                        : () => _showColorPicker(isStartColor: true),
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        // 👇 Reemplaza Colors.grey.shade400
                        border: Border.all(color: colors.outline),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.circle, color: _startColor, size: 20),
                          const SizedBox(width: 8),
                          const Text(
                            'Inicio',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: InkWell(
                    onTap: widget.isSaving
                        ? null
                        : () => _showColorPicker(isStartColor: false),
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        // 👇 Reemplaza Colors.grey.shade400
                        border: Border.all(color: colors.outline),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.circle, color: _endColor, size: 20),
                          const SizedBox(width: 8),
                          const Text(
                            'Fin',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            BannerTemplateEditor(
              useTemplate: _useTemplate,
              settings: _settings,
              categories: widget.categories,
              enabled: !widget.isSaving,
              onUseTemplateChanged: _setUseTemplate,
              onSettingsChanged: (settings) =>
                  setState(() => _settings = settings),
            ),
            const SizedBox(height: 16),

            const Text(
              'Programación (opcional)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'Si la dejas vacía, el banner se muestra mientras esté activo. '
              'El interruptor "Visible" siempre manda sobre las fechas.',
              style: TextStyle(fontSize: 12, color: colors.onSurfaceVariant),
            ),
            const SizedBox(height: 8),
            _scheduleTile(
              label: 'Se muestra desde',
              value: _startsAt,
              emptyText: 'Desde ahora',
              onTap: widget.isSaving ? null : () => _pickDateTime(isStart: true),
              onClear: widget.isSaving
                  ? null
                  : () => setState(() {
                      _startsAt = null;
                      _scheduleError = null;
                    }),
            ),
            const SizedBox(height: 8),
            _scheduleTile(
              label: 'Hasta',
              value: _endsAt,
              emptyText: 'Sin vencimiento',
              onTap: widget.isSaving ? null : () => _pickDateTime(isStart: false),
              onClear: widget.isSaving
                  ? null
                  : () => setState(() {
                      _endsAt = null;
                      _scheduleError = null;
                    }),
            ),
            if (_scheduleError != null) ...[
              const SizedBox(height: 6),
              Text(
                _scheduleError!,
                style: TextStyle(color: colors.error, fontSize: 12),
              ),
            ],
            const SizedBox(height: 12),
            const Text(
              'Días de la semana',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 4),
            Text(
              'Sin días marcados, se muestra todos los días. '
              'Los días se cuentan con la hora de México.',
              style: TextStyle(fontSize: 12, color: colors.onSurfaceVariant),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                for (final day in _weekdayOptions)
                  FilterChip(
                    label: Text(day.$2),
                    tooltip: day.$3,
                    selected: _weekdays.contains(day.$1),
                    onSelected: widget.isSaving
                        ? null
                        : (selected) => setState(() {
                            if (selected) {
                              _weekdays.add(day.$1);
                            } else {
                              _weekdays.remove(day.$1);
                            }
                          }),
                  ),
              ],
            ),
            if (_neverShows) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colors.errorContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      size: 20,
                      color: colors.onErrorContainer,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Ningún día marcado cae entre esas fechas, así que '
                        'este banner no se mostrará nunca. Cambia las fechas '
                        'o los días.',
                        style: TextStyle(
                          fontSize: 12,
                          color: colors.onErrorContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 16),

            const Text(
              'Vista previa',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Se redibuja al escribir en los campos de texto.
            ListenableBuilder(
              listenable: Listenable.merge([
                _titleCtrl,
                _discountCtrl,
                _subtitleCtrl,
              ]),
              builder: (context, _) => Center(
                child: SizedBox(
                  width: 280,
                  child: PromoBannerRenderer(
                    banner: _draftBanner(),
                    previewImage: _selectedImage == null
                        ? null
                        : FileImage(_selectedImage!),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            BottomSheetFormActions(
              isSaving: widget.isSaving,
              saveLabel: widget.bannerToEdit == null ? 'Crear' : 'Actualizar',
              onSave: _submit,
            ),
          ],
        ),
      ),
    );
  }
}