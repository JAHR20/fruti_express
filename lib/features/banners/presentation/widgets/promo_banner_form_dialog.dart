import 'dart:io';
import 'package:flutter/material.dart'; 
import 'package:image_picker/image_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fruti_express_jahr_admin/core/utils/validators.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/promo_banner.dart';

class PromoBannerFormDialog extends StatefulWidget { 
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

  const PromoBannerFormDialog({
    super.key,
    this.bannerToEdit,
    required this.isSaving,
    required this.onSave,
  });

  @override
  State<PromoBannerFormDialog> createState() => _PromoBannerFormDialogState();
}

class _PromoBannerFormDialogState extends State<PromoBannerFormDialog> {
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
    _sortOrderCtrl = TextEditingController(text: b?.sortOrder.toString() ?? '0');
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
      builder: (context) => AlertDialog(
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
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E3A8A),
            ),
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
            child: const Text('Aceptar', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
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
    return AlertDialog(
      title: Text(
        widget.bannerToEdit == null ? 'Nuevo Banner' : 'Editar Banner',
      ),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: widget.isSaving ? null : _pickImage,
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                    image: _selectedImage != null
                        ? DecorationImage(
                            image: FileImage(_selectedImage!),
                            fit: BoxFit.cover,
                          )
                        : (widget.bannerToEdit?.imageUrl != null
                              ? DecorationImage(
                                  image: NetworkImage(
                                    widget.bannerToEdit!.imageUrl!,
                                  ),
                                  fit: BoxFit.cover,
                                )
                              : null),
                  ),
                  child:
                      _selectedImage == null &&
                          widget.bannerToEdit?.imageUrl == null
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_photo_alternate,
                              size: 40,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Añadir imagen (opcional)',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _titleCtrl,
                decoration: const InputDecoration(
                  labelText: 'Título (ej. Fin de Semana)',
                  border: OutlineInputBorder(),
                ),
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
                    child: TextFormField(
                      controller: _discountCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Descuento (ej. 25% OFF)',
                        border: OutlineInputBorder(),
                      ),
                      validator: Validators.required('el texto de descuento'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: _sortOrderCtrl,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Orden',
                        border: OutlineInputBorder(),
                      ),
                      validator: Validators.positiveNumber,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _subtitleCtrl,
                decoration: const InputDecoration(
                  labelText: 'Subtítulo (Términos cortos)',
                  border: OutlineInputBorder(),
                ),
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
                          border: Border.all(color: Colors.grey.shade400),
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
                          border: Border.all(color: Colors.grey.shade400),
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
                child: const Center(
                  child: Text(
                    'Previsualización del Gradiente',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: widget.isSaving ? null : () => Navigator.pop(context),
          child: const Text('Cancelar', style: TextStyle(color: Colors.grey)),
        ),
        ElevatedButton(
          onPressed: widget.isSaving ? null : _submit,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1E3A8A),
          ),
          child: widget.isSaving
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Text(
                  widget.bannerToEdit == null ? 'Crear' : 'Actualizar',
                  style: const TextStyle(color: Colors.white),
                ),
        ),
      ],
    );
  }
}