
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/utils/measurement_unit_extension.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart';
import 'package:fruti_express_jahr_admin/core/utils/validators.dart';

class ProductFormDialog extends StatefulWidget {
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
    File? imageFile 
  ) onSave;

  const ProductFormDialog({
    super.key,
    this.productToEdit,
    required this.availableCategories,
    required this.isSaving,
    required this.onSave,
  });

  @override
  State<ProductFormDialog> createState() => _ProductFormDialogState();
}

class _ProductFormDialogState extends State<ProductFormDialog> {
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
    _nameController = TextEditingController(text: widget.productToEdit?.name ?? '');
    _descriptionController = TextEditingController(text: widget.productToEdit?.description ?? '');
    
    if (isEditing) {
      _selectedCategoryId = widget.productToEdit!.categoryId;
      _selectedUnit = widget.productToEdit!.measurementUnit;
      
      if (widget.productToEdit!.comparisonPrice != null) {
        _hasOffer = true;
        final normalCents = widget.productToEdit!.comparisonPrice!;
        final offerCents = widget.productToEdit!.currentPrice;
        
        _normalPriceController = TextEditingController(text: (normalCents / 100).toStringAsFixed(2));
        final percentage = ((normalCents - offerCents) / normalCents) * 100;
        _percentageController = TextEditingController(text: percentage.toStringAsFixed(0));
        _calculatedOfferPrice = offerCents / 100;
      } else {
        _normalPriceController = TextEditingController(text: (widget.productToEdit!.currentPrice / 100).toStringAsFixed(2));
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
        _descriptionController.text.trim().isEmpty ? null : _descriptionController.text.trim(),
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
    return AlertDialog(
      title: Text(isEditing ? 'Editar Producto' : 'Nuevo Producto'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: _selectedImage != null
                      ? ClipRRect( 
                          borderRadius: BorderRadius.circular(11),
                          child: Image.file(_selectedImage!, fit: BoxFit.cover),
                        )
                      : (isEditing && widget.productToEdit!.imageUrl != null && widget.productToEdit!.imageUrl!.isNotEmpty)
                          ? ClipRRect( 
                              borderRadius: BorderRadius.circular(11),
                              child: Image.network(widget.productToEdit!.imageUrl!, fit: BoxFit.cover),
                            )
                          : const Column( 
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add_a_photo_outlined, size: 40, color: Color(0xFF1E3A8A)),
                                SizedBox(height: 8),
                                Text('Seleccionar foto', style: TextStyle(fontSize: 12, color: Colors.grey)),
                              ],
                            ),
                ),
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nombre del Producto'),
                validator: Validators.compose([
                  Validators.required('el nombre del producto'),
                  Validators.minLength(3, 'El nombre'),
                ]),
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _descriptionController,
                maxLines: 3, 
                decoration: const InputDecoration(
                  labelText: 'Descripción (Opcional)',
                  alignLabelWithHint: true,
                ),
                validator: Validators.optionalMinLength(10, 'Brinda un poco más de detalle (min. 10 letras)'),
              ),
              const SizedBox(height: 12),
              
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Categoría'),
                initialValue: _selectedCategoryId, 
                items: widget.availableCategories.map((cat) {
                  return DropdownMenuItem(value: cat.id, child: Text(cat.name));
                }).toList(),
                onChanged: (val) => setState(() => _selectedCategoryId = val),
                validator: Validators.requiredMenu('Una categoria'),
              ),
              
              const SizedBox(height: 12),
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _normalPriceController,
                      decoration: const InputDecoration(labelText: 'Precio Normal', prefixText: '\$ '),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      validator: Validators.positiveNumber,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 3,
                    child: DropdownButtonFormField<MeasurementUnit>(
                      decoration: const InputDecoration(labelText: 'Unidad de Venta'),
                      initialValue: _selectedUnit, 
                      items: MeasurementUnit.values.map((unit) {
                        return DropdownMenuItem(value: unit, child: Text(unit.displayName));
                      }).toList(),
                      onChanged: (val) => setState(() => _selectedUnit = val!),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 12),
              
              SwitchListTile(
                title: const Text('¿Aplicar descuento?', style: TextStyle(fontSize: 14)),
                subtitle: const Text('Genera un precio de oferta', style: TextStyle(fontSize: 12)),
                value: _hasOffer,
                activeTrackColor: Colors.green.shade300,
                activeThumbColor: Colors.green,
                contentPadding: EdgeInsets.zero,
                onChanged: (val) {
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
                        decoration: const InputDecoration(labelText: '% Descuento', suffixText: '%'),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
                            const Text('Precio de oferta:', style: TextStyle(fontSize: 12, color: Colors.grey)),
                            Text(
                              _calculatedOfferPrice > 0 
                                  ? '\$${_calculatedOfferPrice.toStringAsFixed(2)}' 
                                  : '\$0.00',
                              style: const TextStyle(
                                fontSize: 18, 
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar', style: TextStyle(color: Colors.grey)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1E3A8A)),
          onPressed: widget.isSaving ? null : _executeSave,
          child: widget.isSaving 
              ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
              : const Text('Guardar', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}