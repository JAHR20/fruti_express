import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';
import 'package:image_picker/image_picker.dart';

class CategoryFormDialog extends StatefulWidget {
  final Category? categoryToEdit; 
  final bool isLoading;
  final void Function(
    String name, 
    String? description,
    XFile? selectedImage, 
  )
  onSave; // onSave

  const CategoryFormDialog({
    super.key,
    this.categoryToEdit,
    this.isLoading = false,
    required this.onSave,
  });

  @override
  State<CategoryFormDialog> createState() => _CategoryFormDialogState();
}

class _CategoryFormDialogState extends State<CategoryFormDialog> {
  late TextEditingController _nameController; 
  late TextEditingController _descriptionController; 

  XFile? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.categoryToEdit?.name ?? '',
    );
    _descriptionController = TextEditingController(
      text: widget.categoryToEdit?.description ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxWidth: 800,
      );

       if (!mounted) return;

      if (image != null) {
        setState(() {
          _selectedImage = image;
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
    final isEdit = widget.categoryToEdit != null;
    final bool hasLocalImage = _selectedImage != null;
    final bool hasSavedImage =
        widget.categoryToEdit?.imageUrl != null &&
        widget.categoryToEdit!.imageUrl!.isNotEmpty;

    return AlertDialog(
      title: Text(isEdit ? 'Editar Categoría' : 'Nueva Categoría'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
              enabled: !widget.isLoading,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Descripción (Opcional)',
                border: OutlineInputBorder(),
              ),
              enabled: !widget.isLoading,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: widget.isLoading ? null : _pickImage,
              child: Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[400]!),
                  image: hasLocalImage
                      ? DecorationImage(
                          image: FileImage(File(_selectedImage!.path)),
                          fit: BoxFit.cover,
                        )
                      : (hasSavedImage
                            ? DecorationImage(
                                image: NetworkImage(
                                  widget.categoryToEdit!.imageUrl!,
                                ),
                                fit: BoxFit.cover,
                              )
                            : null),
                ),
                child: (!hasLocalImage && !hasSavedImage)
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
                    _nameController.text,
                    _descriptionController.text.isEmpty
                        ? null
                        : _descriptionController.text,
                    _selectedImage,
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