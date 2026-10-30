import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fruti_express_jahr_admin/core/widgets/form_bottom_sheet_shell.dart';
import 'package:fruti_express_jahr_admin/core/widgets/bottom_sheet_header.dart';
import 'package:fruti_express_jahr_admin/core/widgets/bottom_sheet_form_actions.dart';
import 'package:fruti_express_jahr_admin/core/widgets/custom_dropdown_field.dart';
import 'package:fruti_express_jahr_admin/core/widgets/custom_text_field.dart';
import 'package:fruti_express_jahr_admin/core/widgets/image_picker_field.dart';
import 'package:fruti_express_jahr_admin/core/utils/validators.dart';

import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/utils/measurement_unit_extension.dart';

class ProductFormBottomSheet extends StatefulWidget {
  final Product? productToEdit;
  final List<Category> availableCategories;
  final bool isSaving;
  final void Function(
    String name,
    String? description,
    String categoryId,
    int currentPrice,
    int? comparisonPrice,
    MeasurementUnit measurementUnit,
    File? imageFile,
  ) onSave;

  const ProductFormBottomSheet({
    super.key,
    this.productToEdit,
    required this.availableCategories,
    required this.isSaving,
    required this.onSave,
  });

  @override
  State<ProductFormBottomSheet> createState() => _ProductFormBottomSheetState();
}

class _ProductFormBottomSheetState extends State<ProductFormBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _normalPriceController;
  late TextEditingController _percentageController;

  double _calculatedOfferPrice = 0.0;
  bool _hasOffer = false;
  String? _selectedCategoryId;
  MeasurementUnit _selectedUnit = MeasurementUnit.gram;

  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  bool get isEditing => widget.productToEdit != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.productToEdit?.name ?? '',
    );
    _descriptionController = TextEditingController(
      text: widget.productToEdit?.description ?? '',
    );

    if (isEditing) {
      _selectedCategoryId = widget.productToEdit!.categoryId;
      _selectedUnit = widget.productToEdit!.measurementUnit;

      if (widget.productToEdit!.comparisonPrice != null) {
        _hasOffer = true;
        final normalCents = widget.productToEdit!.comparisonPrice!;
        final offerCents = widget.productToEdit!.currentPrice;

        _normalPriceController = TextEditingController(
          text: (normalCents / 100).toStringAsFixed(2),
        );
        final percentage = ((normalCents - offerCents) / normalCents) * 100;
        _percentageController = TextEditingController(
          text: percentage.toStringAsFixed(0),
        );
        _calculatedOfferPrice = offerCents / 100;
      } else {
        _normalPriceController = TextEditingController(
          text: (widget.productToEdit!.currentPrice / 100).toStringAsFixed(2),
        );
        _percentageController = TextEditingController();
      }
    } else {
      _normalPriceController = TextEditingController();
      _percentageController = TextEditingController();
    }

    _normalPriceController.addListener(_calculateRealDiscount);
    _percentageController.addListener(_calculateRealDiscount);
  }

  void _calculateRealDiscount() {
    final normal = double.tryParse(_normalPriceController.text) ?? 0.0;
    final percentage = double.tryParse(_percentageController.text) ?? 0.0;

    if (normal > 0 && percentage > 0 && percentage < 100) {
      setState(() {
        _calculatedOfferPrice = normal - (normal * (percentage / 100));
      });
    } else {
      setState(() {
        _calculatedOfferPrice = 0.0;
      });
    }
  }

  @override
  void dispose() {
    _normalPriceController.removeListener(_calculateRealDiscount);
    _percentageController.removeListener(_calculateRealDiscount);
    _nameController.dispose();
    _descriptionController.dispose();
    _normalPriceController.dispose();
    _percentageController.dispose();
    super.dispose();
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

  void _executeSave() {
    if (_formKey.currentState!.validate() && _selectedCategoryId != null) {
      final inputNormal = double.parse(_normalPriceController.text.trim());
      final normalInCents = (inputNormal * 100).round();

      int finalPriceForDb;
      int? comparisonPriceForDb;

      if (_hasOffer && _calculatedOfferPrice > 0) {
        finalPriceForDb = (_calculatedOfferPrice * 100).round();
        comparisonPriceForDb = normalInCents;
      } else {
        finalPriceForDb = normalInCents;
        comparisonPriceForDb = null;
      }

      widget.onSave(
        _nameController.text,
        _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
        _selectedCategoryId!,
        finalPriceForDb,
        comparisonPriceForDb,
        _selectedUnit,
        _selectedImage,
      );
    } else if (_selectedCategoryId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor selecciona una categoría')),
      );
    }
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
              title: isEditing ? 'Editar Producto' : 'Nuevo Producto',
              isDisabled: widget.isSaving,
            ),
            const SizedBox(height: 24),

            ImagePickerField(
              selectedImage: _selectedImage, 
              existingImageUrl: widget.productToEdit?.imageUrl,
              onTap: widget.isSaving ? null : _pickImage,
              placeholderText: 'Seleccionar foto',
            ),
            const SizedBox(height: 16),

            CustomTextField(
              label: 'Nombre',
              hintText: 'Ejem. Tomate',
              controller: _nameController,
              enabled: !widget.isSaving,
              validator: Validators.compose([
                Validators.required('el nombre del producto'),
                Validators.minLength(3, 'El nombre'),
              ]),
            ),
            const SizedBox(height: 12),

            CustomTextField(
              label: 'Descripción (opcional)',
              hintText: 'Ejem. Tomate saladet...',
              controller: _descriptionController,
              enabled: !widget.isSaving,
              validator: Validators.optionalMinLength(
                10,
                'Brinda un poco más de detalle (min. 10 letras)',
              ),
            ),
            const SizedBox(height: 12),

            CustomDropdownField<String>(
              label: 'Categoría',
              value: _selectedCategoryId,
              items: widget.availableCategories.map((cat) {
                return DropdownMenuItem(
                  value: cat.id,
                  child: Text(cat.name),
                );
              }).toList(),
              onChanged: widget.isSaving
                  ? null
                  : (val) => setState(() => _selectedCategoryId = val),
              validator: Validators.requiredMenu('Una categoría'),
            ),
            const SizedBox(height: 12),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: CustomTextField(
                    label: 'Precio',
                    hintText: 'Ejem. 20',
                    prefixText: '\$ ',
                    controller: _normalPriceController,
                    enabled: !widget.isSaving,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    validator: Validators.positiveNumber,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 3,
                  child: CustomDropdownField<MeasurementUnit>(
                    label: 'Unidad de Venta',
                    value: _selectedUnit,
                    items: MeasurementUnit.values.map((unit) {
                      return DropdownMenuItem(
                        value: unit,
                        child: Text(unit.displayName),
                      );
                    }).toList(),
                    onChanged: widget.isSaving
                        ? null
                        : (val) => setState(() => _selectedUnit = val!),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            SwitchListTile(
              title: const Text(
                '¿Aplicar descuento?',
                style: TextStyle(fontSize: 14),
              ),
              subtitle: const Text(
                'Genera un precio de oferta',
                style: TextStyle(fontSize: 12),
              ),
              activeTrackColor: colors.primaryFixedDim,
              activeThumbColor: colors.primary,
              value: _hasOffer,
              contentPadding: EdgeInsets.zero,
              onChanged: widget.isSaving
                  ? null
                  : (val) {
                      setState(() {
                        _hasOffer = val;
                        if (!val) {
                          _percentageController.clear();
                          _calculatedOfferPrice = 0.0;
                        }
                      });
                    },
            ),

            if (_hasOffer)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _percentageController,
                      enabled: !widget.isSaving,
                      decoration: const InputDecoration(
                        labelText: '% Descuento',
                        suffixText: '%',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      validator: Validators.percentage,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Precio de oferta:',
                            style: TextStyle(
                              fontSize: 12,
                              color: colors.onSurfaceVariant, 
                            ),
                          ),
                          Text(
                            _calculatedOfferPrice > 0
                                ? '\$${_calculatedOfferPrice.toStringAsFixed(2)}'
                                : '\$0.00',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: colors.primary, 
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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