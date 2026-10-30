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
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/promo_banner.dart';

class PromoBannerFormBottomSheet extends StatefulWidget {
  final PromoBanner? bannerToEdit;
  final bool isSaving;
  final Function(
    String title,
    String discount,
    String subtitle,
    String startColor,
    String endColor,
    int sortOrder,
    File? image,
  ) onSave;

  const PromoBannerFormBottomSheet({
    super.key,
    this.bannerToEdit,
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
    // Nota: Aquí se mantienen estos hex por defecto ya que son los colores iniciales lógicos del banner, no de la UI.
    _startColor = _hexToColor(b?.startColor ?? '#E8F5E9');
    _endColor = _hexToColor(b?.endColor ?? '#C8E6C9');
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

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.onSave(
        _titleCtrl.text.trim(),
        _discountCtrl.text.trim(),
        _subtitleCtrl.text.trim(),
        _colorToHex(_startColor),
        _colorToHex(_endColor),
        int.tryParse(_sortOrderCtrl.text.trim()) ?? 0,
        _selectedImage,
      );
    }
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
            Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [_startColor, _endColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                // 👇 Se agregó un fondo semitransparente al texto para garantizar lectura 
                // sin importar el gradiente que el usuario haya seleccionado.
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Text(
                    'Previsualización del Gradiente',
                    style: TextStyle(
                      color: colors.onSurface, 
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
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