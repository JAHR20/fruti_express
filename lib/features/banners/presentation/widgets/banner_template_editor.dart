// lib/features/banners/presentation/editor/banner_template_editor.dart
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_action_type.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_template.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_template_settings.dart';

/// Controles de la plantilla. No guarda datos: recibe los ajustes actuales y
/// avisa de cada cambio, de modo que el formulario que lo contiene decide
/// cuándo y cómo guardarlos.
class BannerTemplateEditor extends StatefulWidget {
  const BannerTemplateEditor({
    super.key,
    required this.useTemplate,
    required this.settings,
    required this.onUseTemplateChanged,
    required this.onSettingsChanged,
    this.enabled = true,
  });

  final bool useTemplate;
  final BannerTemplateSettings settings;
  final ValueChanged<bool> onUseTemplateChanged;
  final ValueChanged<BannerTemplateSettings> onSettingsChanged;
  final bool enabled;

  @override
  State<BannerTemplateEditor> createState() => _BannerTemplateEditorState();
}

class _BannerTemplateEditorState extends State<BannerTemplateEditor> {
  late final TextEditingController _buttonTextCtrl;

  @override
  void initState() {
    super.initState();
    _buttonTextCtrl = TextEditingController(text: widget.settings.buttonText);
  }

  @override
  void didUpdateWidget(covariant BannerTemplateEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.settings.buttonText != _buttonTextCtrl.text) {
      _buttonTextCtrl.text = widget.settings.buttonText;
    }
  }

  @override
  void dispose() {
    _buttonTextCtrl.dispose();
    super.dispose();
  }

  Color _hexToColor(String hex, Color fallback) {
    var value = hex.trim().replaceFirst('#', '');
    if (value.length == 6) value = 'FF$value';
    if (value.length != 8) return fallback;
    final parsed = int.tryParse(value, radix: 16);
    return parsed == null ? fallback : Color(parsed);
  }

  String _colorToHex(Color color) {
    return '#${color.toARGB32().toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';
  }

  void _update(BannerTemplateSettings settings) =>
      widget.onSettingsChanged(settings);

  void _pickTextColor() {
    Color temp = _hexToColor(widget.settings.textColor, Colors.white);

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Color del texto'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: temp,
            enableAlpha: false,
            displayThumbColor: true,
            paletteType: PaletteType.hsvWithHue,
            pickerAreaBorderRadius: const BorderRadius.all(Radius.circular(12)),
            onColorChanged: (color) => temp = color,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              _update(widget.settings.copyWith(textColor: _colorToHex(temp)));
              Navigator.pop(dialogContext);
            },
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final settings = widget.settings;
    final enabled = widget.enabled;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text(
            'Usar plantilla',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: const Text('Si la desactivas, se usa el diseño clásico'),
          value: widget.useTemplate,
          onChanged: enabled ? widget.onUseTemplateChanged : null,
        ),
        if (widget.useTemplate) ...[
          const SizedBox(height: 8),
          const Text(
            'Posición de la imagen',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          SegmentedButton<BannerTemplate>(
            showSelectedIcon: false,
            segments: const [
              ButtonSegment(
                value: BannerTemplate.imageLeft,
                label: Text('Izquierda'),
                icon: Icon(Icons.align_horizontal_left),
              ),
              ButtonSegment(
                value: BannerTemplate.imageRight,
                label: Text('Derecha'),
                icon: Icon(Icons.align_horizontal_right),
              ),
            ],
            selected: {settings.template},
            onSelectionChanged: enabled
                ? (selection) =>
                    _update(settings.copyWith(template: selection.first))
                : null,
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: enabled ? _pickTextColor : null,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: colors.outline),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: 20,
                    color: _hexToColor(settings.textColor, Colors.white),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Color del texto',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(settings.textColor),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Tamaño de la imagen: ${settings.imageWidthPercent.round()}%',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Slider(
            min: BannerTemplateSettings.minImageWidth,
            max: BannerTemplateSettings.maxImageWidth,
            divisions: 6,
            value: settings.imageWidthPercent
                .clamp(
                  BannerTemplateSettings.minImageWidth,
                  BannerTemplateSettings.maxImageWidth,
                )
                .toDouble(),
            label: '${settings.imageWidthPercent.round()}%',
            onChanged: enabled
                ? (value) => _update(settings.copyWith(imageWidthPercent: value))
                : null,
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Mostrar botón'),
            value: settings.buttonEnabled,
            onChanged: enabled
                ? (value) => _update(settings.copyWith(buttonEnabled: value))
                : null,
          ),
          if (settings.buttonEnabled) ...[
            TextField(
              controller: _buttonTextCtrl,
              enabled: enabled,
              maxLength: 20,
              decoration: const InputDecoration(
                labelText: 'Texto del botón',
                hintText: 'Ejem. Ver ofertas',
              ),
              onChanged: (value) =>
                  _update(settings.copyWith(buttonText: value)),
            ),
            const SizedBox(height: 8),
            SegmentedButton<BannerActionType>(
              showSelectedIcon: false,
              segments: const [
                ButtonSegment(
                  value: BannerActionType.none,
                  label: Text('Sin acción'),
                ),
                ButtonSegment(
                  value: BannerActionType.promotions,
                  label: Text('Ir a promociones'),
                ),
              ],
              selected: {settings.buttonAction},
              onSelectionChanged: enabled
                  ? (selection) =>
                      _update(settings.copyWith(buttonAction: selection.first))
                  : null,
            ),
          ],
        ],
      ],
    );
  }
}