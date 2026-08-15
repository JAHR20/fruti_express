import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/entities/categoria.dart';
import 'package:image_picker/image_picker.dart';

class CategoriaFormDialog extends StatefulWidget {
  final Categoria? categoriaAEditar;
  final bool isLoading;
  final void Function(
    String nombre,
    String? descripcion,
    XFile? imagenSeleccionada,
  )
  onSave;

  const CategoriaFormDialog({
    super.key,
    this.categoriaAEditar,
    this.isLoading = false,
    required this.onSave,
  });

  @override
  State<CategoriaFormDialog> createState() => _CategoriaFormDialogState();
}

class _CategoriaFormDialogState extends State<CategoriaFormDialog> {
  late TextEditingController _nombreController;
  late TextEditingController _descripcionController;

  XFile? _imagenSeleccionada;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController(
      text: widget.categoriaAEditar?.nombre ?? '',
    );
    _descripcionController = TextEditingController(
      text: widget.categoriaAEditar?.descripcion ?? '',
    );
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _descripcionController.dispose();
    super.dispose();
  }

  Future<void> _seleccionarImagen() async {
    try {
      final XFile? imagen = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxWidth: 800,
      );

      if (imagen != null) {
        setState(() {
          _imagenSeleccionada = imagen;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al seleccionar la imagen: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.categoriaAEditar != null;
    final bool tieneImagenLocal = _imagenSeleccionada != null;
    final bool tieneImagenGuardada =
        widget.categoriaAEditar?.imagenUrl != null &&
        widget.categoriaAEditar!.imagenUrl!.isNotEmpty;

    return AlertDialog(
      title: Text(isEdit ? 'Editar Categoría' : 'Nueva Categoría'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
              enabled: !widget.isLoading,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descripcionController,
              decoration: const InputDecoration(
                labelText: 'Descripción (Opcional)',
                border: OutlineInputBorder(),
              ),
              enabled: !widget.isLoading,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: widget.isLoading ? null : _seleccionarImagen,
              child: Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[400]!),
                  image: tieneImagenLocal
                      ? DecorationImage(
                          image: FileImage(File(_imagenSeleccionada!.path)),
                          fit: BoxFit.cover,
                        )
                      : (tieneImagenGuardada
                            ? DecorationImage(
                                image: NetworkImage(
                                  widget.categoriaAEditar!.imagenUrl!,
                                ),
                                fit: BoxFit.cover,
                              )
                            : null),
                ),
                child: (!tieneImagenLocal && !tieneImagenGuardada)
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image, size: 50, color: Colors.grey),
                          SizedBox(height: 8),
                          Text(
                            'Seleccionar imagen de la categoría',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: widget.isLoading
              ? null
              : () => Navigator.of(context).pop(),
          child: const Text('Cancelar', style: TextStyle(color: Colors.grey)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1E3A8A),
          ),
          onPressed: widget.isLoading
              ? null
              : () {
                  widget.onSave(
                    _nombreController.text,
                    _descripcionController.text.isEmpty
                        ? null
                        : _descripcionController.text,
                    _imagenSeleccionada,
                  );
                },
          child: widget.isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : const Text('Guardar', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
