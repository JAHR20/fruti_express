import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/enums/unidad_medida_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/enums/unidad_medida_producto.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/entities/categoria.dart';
import 'package:fruti_express_jahr_admin/core/utils/validators.dart';

class DialogoFormularioProducto extends StatefulWidget {
  final Producto? productoAEditar;
  final List<Categoria> categoriasDisponibles;
  final bool guardando; 
  final void Function(
    String nombre, 
    String? descripcion, 
    String categoriaId, 
    int precioActual, 
    int? precioComparacion, 
    UnidadMedida unidadMedida, 
    File? imagenArchivo 
  ) onGuardar;

  const DialogoFormularioProducto({
    super.key,
    this.productoAEditar,
    required this.categoriasDisponibles,
    required this.guardando,
    required this.onGuardar,
  });

  @override
  State<DialogoFormularioProducto> createState() => _DialogoFormularioProductoState();
}

class _DialogoFormularioProductoState extends State<DialogoFormularioProducto> {
  final _formKey = GlobalKey<FormState>();
  
  late TextEditingController _nombreController;
  late TextEditingController _descripcionController;
  late TextEditingController _precioNormalController; 
  late TextEditingController _porcentajeController;
  
  double _precioOfertaCalculado = 0.0;
  bool _tieneOferta = false;
  String? _categoriaSeleccionadaId;
  UnidadMedida _unidadSeleccionada = UnidadMedida.gramo;

  File? _imagenSeleccionada;
  final ImagePicker _picker = ImagePicker();

  bool get esEdicion => widget.productoAEditar != null;

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController(text: widget.productoAEditar?.nombre ?? '');
    _descripcionController = TextEditingController(text: widget.productoAEditar?.descripcion ?? '');
    
    if (esEdicion) {
      _categoriaSeleccionadaId = widget.productoAEditar!.categoriaId;
      _unidadSeleccionada = widget.productoAEditar!.unidadMedida;
      
      if (widget.productoAEditar!.precioComparacion != null) {
        _tieneOferta = true;
        final normalCentavos = widget.productoAEditar!.precioComparacion!;
        final ofertaCentavos = widget.productoAEditar!.precioActual;
        
        _precioNormalController = TextEditingController(text: (normalCentavos / 100).toStringAsFixed(2));
        final porcentaje = ((normalCentavos - ofertaCentavos) / normalCentavos) * 100;
        _porcentajeController = TextEditingController(text: porcentaje.toStringAsFixed(0));
        _precioOfertaCalculado = ofertaCentavos / 100;
      } else {
        _precioNormalController = TextEditingController(text: (widget.productoAEditar!.precioActual / 100).toStringAsFixed(2));
        _porcentajeController = TextEditingController();
      }
    } else {
      _precioNormalController = TextEditingController();
      _porcentajeController = TextEditingController();
    }

    _precioNormalController.addListener(_calcularDescuentoReal);
    _porcentajeController.addListener(_calcularDescuentoReal);
  }

  void _calcularDescuentoReal() {
    final normal = double.tryParse(_precioNormalController.text) ?? 0.0;
    final porcentaje = double.tryParse(_porcentajeController.text) ?? 0.0;

    if (normal > 0 && porcentaje > 0 && porcentaje < 100) {
      setState(() {
        _precioOfertaCalculado = normal - (normal * (porcentaje / 100));
      });
    } else {
      setState(() {
        _precioOfertaCalculado = 0.0;
      });
    }
  }

  @override
  void dispose() {
    _precioNormalController.removeListener(_calcularDescuentoReal);
    _porcentajeController.removeListener(_calcularDescuentoReal);
    _nombreController.dispose();
    _descripcionController.dispose();
    _precioNormalController.dispose();
    _porcentajeController.dispose(); 
    super.dispose();
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

  void _ejecutarGuardado() {
    if (_formKey.currentState!.validate() && _categoriaSeleccionadaId != null) {
      final normalIngresado = double.parse(_precioNormalController.text.trim());
      final normalEnCentavos = (normalIngresado * 100).round(); 
      
      int precioFinalParaBD;
      int? precioComparacionParaBD;
      
      if (_tieneOferta && _precioOfertaCalculado > 0) {
        precioFinalParaBD = (_precioOfertaCalculado * 100).round();
        precioComparacionParaBD = normalEnCentavos;
      } else {
        precioFinalParaBD = normalEnCentavos;
        precioComparacionParaBD = null;
      }
      
      widget.onGuardar(
        _nombreController.text,
        _descripcionController.text.trim().isEmpty ? null : _descripcionController.text.trim(),
        _categoriaSeleccionadaId!,
        precioFinalParaBD, 
        precioComparacionParaBD, 
        _unidadSeleccionada,
        _imagenSeleccionada, 
      );
    } else if (_categoriaSeleccionadaId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor selecciona una categoría')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(esEdicion ? 'Editar Producto' : 'Nuevo Producto'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: _seleccionarImagen,
                child: Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: _imagenSeleccionada != null
                      ? ClipRRect( 
                          borderRadius: BorderRadius.circular(11),
                          child: Image.file(_imagenSeleccionada!, fit: BoxFit.cover),
                        )
                      : (esEdicion && widget.productoAEditar!.imagenUrl != null && widget.productoAEditar!.imagenUrl!.isNotEmpty)
                          ? ClipRRect( 
                              borderRadius: BorderRadius.circular(11),
                              child: Image.network(widget.productoAEditar!.imagenUrl!, fit: BoxFit.cover),
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
                controller: _nombreController,
                decoration: const InputDecoration(labelText: 'Nombre del Producto'),
                validator: Validators.compose([
                  Validators.required('el nombre del producto'),
                  Validators.minLength(3, 'El nombre'),
                ]),
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _descripcionController,
                maxLines: 3, 
                decoration: const InputDecoration(
                  labelText: 'Descripción (Opcional)',
                  alignLabelWithHint: true,
                ),
                validator: Validators.optionalMinLength(10, 'Brinda un poco más de detalle (min. 10 letras)')
              ),
              const SizedBox(height: 12),
              
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Categoría'),
                initialValue: _categoriaSeleccionadaId, 
                items: widget.categoriasDisponibles.map((cat) {
                  return DropdownMenuItem(value: cat.id, child: Text(cat.nombre));
                }).toList(),
                onChanged: (val) => setState(() => _categoriaSeleccionadaId = val),
                // 🌟 Validador en línea limpio
                validator: Validators.requiredMenu('Una categoria'),
              ),
              
              const SizedBox(height: 12),
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _precioNormalController,
                      decoration: const InputDecoration(labelText: 'Precio Normal', prefixText: '\$ '),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      validator: Validators.positiveNumber,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 3,
                    child: DropdownButtonFormField<UnidadMedida>(
                      decoration: const InputDecoration(labelText: 'Unidad de Venta'),
                      initialValue: _unidadSeleccionada, 
                      items: UnidadMedida.values.map((unidad) {
                        return DropdownMenuItem(value: unidad, child: Text(unidad.nombreUI));
                      }).toList(),
                      onChanged: (val) => setState(() => _unidadSeleccionada = val!),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 12),
              
              SwitchListTile(
                title: const Text('¿Aplicar descuento?', style: TextStyle(fontSize: 14)),
                subtitle: const Text('Genera un precio de oferta', style: TextStyle(fontSize: 12)),
                value: _tieneOferta,
                activeTrackColor: Colors.green.shade300,
                activeThumbColor: Colors.green,
                contentPadding: EdgeInsets.zero,
                onChanged: (val) {
                  setState(() {
                    _tieneOferta = val;
                    if (!val) {
                      _porcentajeController.clear();
                      _precioOfertaCalculado = 0.0;
                    }
                  });
                },
              ),
              
              if (_tieneOferta)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: _porcentajeController,
                        decoration: const InputDecoration(labelText: '% Descuento', suffixText: '%'),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        validator: Validators.percentage
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
                              _precioOfertaCalculado > 0 
                                  ? '\$${_precioOfertaCalculado.toStringAsFixed(2)}' 
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
          onPressed: widget.guardando ? null : _ejecutarGuardado,
          child: widget.guardando 
              ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
              : const Text('Guardar', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}