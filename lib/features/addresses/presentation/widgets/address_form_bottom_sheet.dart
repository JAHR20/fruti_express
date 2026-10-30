import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/services/location/location_service.dart';
import 'package:fruti_express_jahr_admin/core/services/postali/postali_service.dart';
import 'package:fruti_express_jahr_admin/core/types/coordinates.dart';
import 'package:get_it/get_it.dart';

class AddressFormBottomSheet extends StatefulWidget {
  final bool isSaving;
  
  final void Function(
    String alias,
    String street,
    String exteriorNumber,
    String? interiorNumber,
    String neighborhood,
    String zipCode,
    String municipality,
    String state,
    String? references,
    bool isMain,
    double latitude,
    double longitude,
  ) onSave;

  const AddressFormBottomSheet({
    super.key,
    required this.isSaving,
    required this.onSave,
  });

  @override
  State<AddressFormBottomSheet> createState() => _AddressFormBottomSheetState();
}

class _AddressFormBottomSheetState extends State<AddressFormBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _aliasController = TextEditingController();
  final _streetController = TextEditingController();
  final _exteriorNumberController = TextEditingController();
  final _interiorNumberController = TextEditingController();
  final _neighborhoodController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _municipalityController = TextEditingController();
  final _stateController = TextEditingController();
  final _referencesController = TextEditingController();
  
  bool _isMain = false;
  double? _selectedLatitude;
  double? _selectedLongitude;
  
  final LocationService _locationService = GetIt.I<LocationService>();
  final PostaliService _postaliService = GetIt.I<PostaliService>();
  
  bool _isSearchingZipCode = false;
  List<String> _availableNeighborhoods = [];
  String? _selectedNeighborhood;

  @override
  void dispose() {
    _aliasController.dispose();
    _streetController.dispose();
    _exteriorNumberController.dispose();
    _interiorNumberController.dispose();
    _neighborhoodController.dispose();
    _zipCodeController.dispose();
    _municipalityController.dispose();
    _stateController.dispose();
    _referencesController.dispose();
    super.dispose();
  }

  String _toTitleCase(String text) {
    if (text.isEmpty) return text;
    return text
        .split(' ')
        .map(
          (p) => p.isEmpty
              ? ''
              : '${p[0].toUpperCase()}${p.substring(1).toLowerCase()}',
        )
        .join(' ');
  }

  Future<void> _openMap() async {
    Coordinates? currentLocation;
    if (_selectedLatitude != null && _selectedLongitude != null) {
      currentLocation = Coordinates(
        latitude: _selectedLatitude!,
        longitude: _selectedLongitude!,
      );
    }
    
    final selection = await _locationService.selectOnMap(
      context,
      initialLocation: currentLocation,
    );

    if (selection != null) {
      setState(() {
        _selectedLatitude = selection.latitude;
        _selectedLongitude = selection.longitude;
      });
    }
  }

  Future<void> _searchZipCode(String zipCode) async {
    if (zipCode.length != 5) return;

    setState(() => _isSearchingZipCode = true);

    try {
      final zipInfo = await _postaliService.fetchPostalCode(zipCode);
      if (!mounted) return;

      if (zipInfo != null) {
        setState(() {
          _municipalityController.text = zipInfo.municipality;
          _stateController.text = zipInfo.state;
          if (zipInfo.settlements.isNotEmpty) {
            _availableNeighborhoods = zipInfo.settlements
                .map((s) => s.name)
                .toList();
            _selectedNeighborhood = _availableNeighborhoods.first;
          } else {
            _availableNeighborhoods = [];
            _selectedNeighborhood = null;
          }
        });
      }
    } catch (e) {
      final colorScheme = Theme.of(context).colorScheme;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'No se encontró el Código Postal',
            style: TextStyle(color: colorScheme.onError),
          ),
          backgroundColor: colorScheme.error,
        ),
      );
    } finally {
      setState(() => _isSearchingZipCode = false);
    }
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    
    if (_selectedLatitude == null || _selectedLongitude == null) {
      final colorScheme = Theme.of(context).colorScheme;
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Por favor, ubica tu dirección en el mapa.',
            style: TextStyle(color: colorScheme.onError),
          ),
          backgroundColor: colorScheme.error, // 👈 Reemplaza Colors.orange
        ),
      );
      return;
    }

    final neighborhood = _availableNeighborhoods.isNotEmpty && _selectedNeighborhood != null
        ? _selectedNeighborhood!
        : _neighborhoodController.text.trim();

    widget.onSave(
      _toTitleCase(_aliasController.text.trim()),
      _toTitleCase(_streetController.text.trim()),
      _exteriorNumberController.text.trim(),
      _interiorNumberController.text.trim().isEmpty ? null : _interiorNumberController.text.trim(),
      _toTitleCase(neighborhood),
      _zipCodeController.text.trim().replaceAll(RegExp(r'\D'), ''),
      _toTitleCase(_municipalityController.text.trim()),
      _toTitleCase(_stateController.text.trim()),
      _referencesController.text.trim().isEmpty ? null : _referencesController.text.trim(),
      _isMain,
      _selectedLatitude!,
      _selectedLongitude!,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme; // 👈 Extraemos el tema
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      margin: EdgeInsets.only(bottom: bottomInset),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: colorScheme.surface, // 👈 Reemplaza Colors.white
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nueva Dirección',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: colorScheme.onSurfaceVariant),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedLatitude != null
                        ? colorScheme.primaryContainer // 👈 Fondo seleccionado
                        : colorScheme.secondaryFixed, // 👈 Fondo no seleccionado
                    foregroundColor: _selectedLatitude != null
                        ? colorScheme.onPrimaryContainer // 👈 Texto seleccionado
                        : colorScheme.primary, // 👈 Texto no seleccionado
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: _selectedLatitude != null
                            ? colorScheme.primary
                            : colorScheme.primary.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                  icon: Icon(
                    _selectedLatitude != null
                        ? Icons.check_circle
                        : Icons.map,
                        color: colorScheme.secondaryContainer,
                  ),
                  label: Text(
                    _selectedLatitude != null
                        ? 'Ubicación seleccionada en el mapa'
                        : 'Fijar ubicación exacta en el mapa',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: widget.isSaving ? null : _openMap,
                ),
              ),

              _buildField(
                _aliasController,
                'Alias (ej. Casa, Trabajo)',
                isRequired: true,
              ),
              const SizedBox(height: 16),
              _buildField(_streetController, 'Calle', isRequired: true),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildField(
                      _exteriorNumberController,
                      'Núm Ext.',
                      isRequired: true,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildField(_interiorNumberController, 'Núm Int. (Opcional)'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: _availableNeighborhoods.isNotEmpty
                        ? DropdownButtonFormField<String>(
                            initialValue: _selectedNeighborhood,
                            isExpanded: true,
                            decoration: InputDecoration(
                              labelText: 'Colonia',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            items: _availableNeighborhoods.map((String neighborhood) {
                              return DropdownMenuItem<String>(
                                value: neighborhood,
                                child: Text(
                                  neighborhood,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            }).toList(),
                            onChanged: widget.isSaving 
                                ? null 
                                : (String? newValue) {
                                    setState(() {
                                      _selectedNeighborhood = newValue;
                                    });
                                  },
                            validator: (val) =>
                                val == null ? 'Requerido' : null,
                          )
                        : _buildField(
                            _neighborhoodController,
                            'Colonia',
                            isRequired: true,
                          ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _zipCodeController,
                      keyboardType: TextInputType.number,
                      maxLength: 5,
                      enabled: !widget.isSaving,
                      decoration: InputDecoration(
                        labelText: 'C.P.',
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        suffixIcon: _isSearchingZipCode
                            ? Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: colorScheme.primary, // 👈 Indicador de carga adaptable
                                ),
                              )
                            : null,
                      ),
                      validator: (val) =>
                          val == null || val.length < 5 ? 'Requerido' : null,
                      onChanged: (val) {
                        if (val.length == 5) {
                          FocusScope.of(context).unfocus();
                          _searchZipCode(val);
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildField(
                      _municipalityController,
                      'Municipio',
                      isRequired: true,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildField(
                      _stateController,
                      'Estado',
                      isRequired: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildField(
                _referencesController,
                'Referencias (Fachada, portón)',
                maxLines: 2,
              ),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dirección principal',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  Switch(
                    value: _isMain,
                    onChanged: widget.isSaving 
                        ? null 
                        : (val) => setState(() => _isMain = val),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton( // 👈 Cambiado a FilledButton
                  style: FilledButton.styleFrom(
                    backgroundColor: colorScheme.primary, // 👈 Reemplaza azul fijo
                    foregroundColor: colorScheme.onPrimary, // 👈 Reemplaza texto blanco
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: widget.isSaving ? null : _submit,
                  child: widget.isSaving
                      ? SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: colorScheme.onPrimary, 
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'Guardar Dirección',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(
    TextEditingController controller,
    String label, {
    bool isRequired = false,
    bool isNumeric = false,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      enabled: !widget.isSaving,
      keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: isRequired
          ? (val) => val == null || val.trim().isEmpty ? 'Requerido' : null
          : null,
    );
  }
}