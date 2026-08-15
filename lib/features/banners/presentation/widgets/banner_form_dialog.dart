import 'dart:io';
import 'package:flutter/material.dart' hide Banner;
import 'package:image_picker/image_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fruti_express_jahr_admin/core/utils/validators.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner.dart';

class BannerFormDialog extends StatefulWidget {
  final Banner? bannerAEditar;
  final bool guardando;
  final Function(
    String titulo,
    String descuento,
    String subtitulo,
    String colorInicio,
    String colorFin,
    int orden,
    File? imagen,
  )
  onGuardar;

  const BannerFormDialog({
    super.key,
    this.bannerAEditar,
    required this.guardando,
    required this.onGuardar,
  });

  @override
  State<BannerFormDialog> createState() => _BannerFormDialogState();
}

class _BannerFormDialogState extends State<BannerFormDialog> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _tituloCtrl;
  late TextEditingController _descuentoCtrl;
  late TextEditingController _subtituloCtrl;
  late TextEditingController _ordenCtrl;
  late Color _colorInicio;
  late Color _colorFin;

  File? _imagenSeleccionada;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    final b = widget.bannerAEditar;
    _tituloCtrl = TextEditingController(text: b?.titulo ?? '');
    _descuentoCtrl = TextEditingController(text: b?.descuento ?? '');
    _subtituloCtrl = TextEditingController(text: b?.subtitulo ?? '');
    _ordenCtrl = TextEditingController(text: b?.orden.toString() ?? '0');
    _colorInicio = _hexToColor(b?.colorInicio ?? '#E8F5E9');
    _colorFin = _hexToColor(b?.colorFin ?? '#C8E6C9');
  }

  @override
  void dispose() {
    _tituloCtrl.dispose();
    _descuentoCtrl.dispose();
    _subtituloCtrl.dispose();
    _ordenCtrl.dispose();
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

  Future<void> _seleccionarImagen() async {
    final XFile? imagen = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (imagen != null) {
      setState(() => _imagenSeleccionada = File(imagen.path));
    }
  }

  void _mostrarSelectorColor({required bool esColorInicio}) {
    Color colorTemporal = esColorInicio ? _colorInicio : _colorFin;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Selecciona un color'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: colorTemporal,
            enableAlpha: false,
            displayThumbColor: true,
            paletteType: PaletteType.hsvWithHue,
            pickerAreaBorderRadius: const BorderRadius.all(Radius.circular(12)),
            onColorChanged: (Color color) {
              colorTemporal = color;
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
                if (esColorInicio) {
                  _colorInicio = colorTemporal;
                } else {
                  _colorFin = colorTemporal;
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
      widget.onGuardar(
        _tituloCtrl.text.trim(),
        _descuentoCtrl.text.trim(),
        _subtituloCtrl.text.trim(),
        _colorToHex(_colorInicio),
        _colorToHex(_colorFin),
        int.tryParse(_ordenCtrl.text.trim()) ?? 0,
        _imagenSeleccionada,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.bannerAEditar == null ? 'Nuevo Banner' : 'Editar Banner',
      ),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: widget.guardando ? null : _seleccionarImagen,
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                    image: _imagenSeleccionada != null
                        ? DecorationImage(
                            image: FileImage(_imagenSeleccionada!),
                            fit: BoxFit.cover,
                          )
                        : (widget.bannerAEditar?.imagenUrl != null
                              ? DecorationImage(
                                  image: NetworkImage(
                                    widget.bannerAEditar!.imagenUrl!,
                                  ),
                                  fit: BoxFit.cover,
                                )
                              : null),
                  ),
                  child:
                      _imagenSeleccionada == null &&
                          widget.bannerAEditar?.imagenUrl == null
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
                controller: _tituloCtrl,
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
                      controller: _descuentoCtrl,
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
                      controller: _ordenCtrl,
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
                controller: _subtituloCtrl,
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
                      onTap: widget.guardando
                          ? null
                          : () => _mostrarSelectorColor(esColorInicio: true),
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
                            Icon(Icons.circle, color: _colorInicio, size: 20),
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
                      onTap: widget.guardando
                          ? null
                          : () => _mostrarSelectorColor(esColorInicio: false),
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
                            Icon(Icons.circle, color: _colorFin, size: 20),
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
                    colors: [_colorInicio, _colorFin],
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
          onPressed: widget.guardando ? null : () => Navigator.pop(context),
          child: const Text('Cancelar', style: TextStyle(color: Colors.grey)),
        ),
        ElevatedButton(
          onPressed: widget.guardando ? null : _submit,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1E3A8A),
          ),
          child: widget.guardando
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Text(
                  widget.bannerAEditar == null ? 'Crear' : 'Actualizar',
                  style: const TextStyle(color: Colors.white),
                ),
        ),
      ],
    );
  }
}
