import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fruti_express_jahr_admin/core/widgets/form_bottom_sheet_shell.dart';
import 'package:fruti_express_jahr_admin/core/widgets/bottom_sheet_header.dart';
import 'package:fruti_express_jahr_admin/core/widgets/bottom_sheet_form_actions.dart';
import 'package:fruti_express_jahr_admin/core/widgets/custom_text_field.dart';
import 'package:fruti_express_jahr_admin/core/widgets/image_picker_field.dart'; 

import 'package:fruti_express_jahr_admin/core/utils/app_formatters.dart';
import 'package:fruti_express_jahr_admin/core/utils/validators.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';

class CategoryFormBottomSheet extends StatefulWidget {
  final Category? categoryToEdit;
  final bool isSaving;
  final void Function(String name, String? description, XFile? selectedImage) onSave;

  const CategoryFormBottomSheet({
    super.key,
    this.categoryToEdit,
    this.isSaving = false,
    required this.onSave,
  });

  @override
  State<CategoryFormBottomSheet> createState() => _CategoryFormBottomSheetState();
}

class _CategoryFormBottomSheetState extends State<CategoryFormBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

  XFile? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  bool get isEdit => widget.categoryToEdit != null;

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
      final colors = Theme.of(context).colorScheme;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al seleccionar la imagen: $e', style: TextStyle(color: colors.onError)),
          backgroundColor: colors.error, 
        ),
      );
    }
  }

  void _executeSave() {
    if (!_formKey.currentState!.validate()) return;
    
    widget.onSave(
      _nameController.text,
      _descriptionController.text.isEmpty ? null : _descriptionController.text,
      _selectedImage,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme; 

    return FormBottomSheetShell(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BottomSheetHeader(
              title: isEdit ? 'Editar Categoría' : 'Nueva Categoría',
              isDisabled: widget.isSaving,
            ),
            const SizedBox(height: 24),

            ImagePickerField(
              selectedImage: _selectedImage != null ? File(_selectedImage!.path) : null,
              existingImageUrl: widget.categoryToEdit?.imageUrl,
              onTap: widget.isSaving ? null : _pickImage,
              placeholderText: 'Seleccionar imagen de categoría',
            ),
            const SizedBox(height: 16),

            CustomTextField(
              label: 'Nombre',
              colorLabel: colors.primary, 
              controller: _nameController,
              enabled: !widget.isSaving,
              hintText: 'Ejem. Frutas',
              inputFormatters: [AppFormatters.name],
              validator: Validators.required(),
            ),
            const SizedBox(height: 16),

            CustomTextField(
              label: 'Descripción (opcional)',
              colorLabel: colors.primary,
              controller: _descriptionController,
              hintText: 'Ejem. Frutas de temporada',
              enabled: !widget.isSaving,
            ),
            const SizedBox(height: 32),

            BottomSheetFormActions(
              isSaving: widget.isSaving,
              saveLabel: 'Guardar',
              onSave: _executeSave,
            ),
          ],
        ),
      ),
    );
  }
}