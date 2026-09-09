import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/services/location/location_service.dart';
import 'package:fruti_express_jahr_admin/core/services/postali/postali_service.dart';
import 'package:fruti_express_jahr_admin/core/types/coordinates.dart';
import 'package:fruti_express_jahr_admin/features/addresses/presentation/cubits/address_cubit.dart';
import 'package:fruti_express_jahr_admin/features/addresses/presentation/cubits/address_state.dart';
import 'package:get_it/get_it.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/entities/address.dart';


class AddressFormBottomSheet extends StatefulWidget {
  final String userId;

  const AddressFormBottomSheet({super.key, required this.userId});

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
    
    // Asumiendo que tu método se llamará selectOnMap
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No se encontró el Código Postal')),
      );
    } finally {
      setState(() => _isSearchingZipCode = false);
    }
  }

  void _saveAddress() {
    if (!_formKey.currentState!.validate()) return;
    
    if (_selectedLatitude == null || _selectedLongitude == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, ubica tu dirección en el mapa.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    final newAddress = Address(
      id: '',
      userId: widget.userId,
      alias: _toTitleCase(_aliasController.text.trim()),
      street: _toTitleCase(_streetController.text.trim()),
      exteriorNumber: _exteriorNumberController.text.trim(),
      interiorNumber: _interiorNumberController.text.trim().isEmpty
          ? null
          : _interiorNumberController.text.trim(),
      neighborhood: _toTitleCase(_neighborhoodController.text.trim()),
      zipCode: _zipCodeController.text.trim().replaceAll(RegExp(r'\D'), ''),
      municipality: _toTitleCase(_municipalityController.text.trim()),
      state: _toTitleCase(_stateController.text.trim()),
      references: _referencesController.text.trim().isEmpty
          ? null
          : _referencesController.text.trim(),
      isMain: _isMain,
      createdAt: DateTime.now(),
      latitude: _selectedLatitude!,
      longitude: _selectedLongitude!,
    );

    context.read<AddressCubit>().createAddress(newAddress);
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return BlocListener<AddressCubit, AddressState>(
      listenWhen: (previous, current) =>
          previous.operationSuccessful != current.operationSuccessful ||
          previous.operationError != current.operationError,
      listener: (context, state) {
        if (state.operationSuccessful) {
          Navigator.pop(context);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Dirección guardada correctamente'),
              backgroundColor: Colors.green,
            ),
          );
        }

        if (state.operationError != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.operationError!),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: bottomInset),
        padding: const EdgeInsets.all(24.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
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
                    const Text(
                      'Nueva Dirección',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
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
                          ? Colors.green.shade100
                          : Colors.blue.shade50,
                      foregroundColor: _selectedLatitude != null
                          ? Colors.green.shade800
                          : Colors.blue.shade800,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: _selectedLatitude != null
                              ? Colors.green
                              : Colors.blue.shade300,
                        ),
                      ),
                    ),
                    icon: Icon(
                      _selectedLatitude != null
                          ? Icons.check_circle
                          : Icons.map,
                    ),
                    label: Text(
                      _selectedLatitude != null
                          ? 'Ubicación seleccionada en el mapa'
                          : 'Fijar ubicación exacta en el mapa',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _openMap,
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
                              onChanged: (String? newValue) {
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
                        decoration: InputDecoration(
                          labelText: 'C.P.',
                          counterText: '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          suffixIcon: _isSearchingZipCode
                              ? const Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
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
                    const Text(
                      'Dirección principal',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Switch(
                      value: _isMain,
                      activeThumbColor: const Color(0xFF1E3A8A),
                      onChanged: (val) => setState(() => _isMain = val),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                BlocBuilder<AddressCubit, AddressState>(
                  builder: (context, state) {
                    final isLoading = state.isLoading || state.processingAddressId != null;

                    return SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E3A8A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: isLoading ? null : _saveAddress,
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Guardar Dirección',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
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