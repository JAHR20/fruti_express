import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/services/postali/postali_service.dart';
import 'package:get_it/get_it.dart';
import 'package:fruti_express_jahr_admin/core/services/ubicacion/ubicacion_service.dart';
import 'package:fruti_express_jahr_admin/core/types/coordenadas.dart';

import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/presentation/cubits/direcciones_cubit.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/presentation/cubits/direcciones_state.dart';

class FormularioDireccionBottomSheet extends StatefulWidget {
  final String usuarioId;

  const FormularioDireccionBottomSheet({super.key, required this.usuarioId});

  @override
  State<FormularioDireccionBottomSheet> createState() =>
      _FormularioDireccionBottomSheetState();
}

class _FormularioDireccionBottomSheetState
    extends State<FormularioDireccionBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _aliasController = TextEditingController();
  final _calleController = TextEditingController();
  final _numExtController = TextEditingController();
  final _numIntController = TextEditingController();
  final _coloniaController = TextEditingController();
  final _cpController = TextEditingController();
  final _municipioController = TextEditingController();
  final _estadoController = TextEditingController();
  final _referenciasController = TextEditingController();
  bool _esPrincipal = false;

  // 🌟 1. Nuestras variables temporales para el pin del mapa
  double? _latitudSeleccionada;
  double? _longitudSeleccionada;

  // 🌟 2. Inyectamos nuestro servicio de mapas
  final UbicacionService _ubicacionService = GetIt.I<UbicacionService>();
  final PostaliService _postaliService = GetIt.I<PostaliService>();
  bool _buscandoCp = false;
  List<String> _coloniasDisponibles = [];
  String? _coloniaSeleccionada;

  @override
  void dispose() {
    _aliasController.dispose();
    _calleController.dispose();
    _numExtController.dispose();
    _numIntController.dispose();
    _coloniaController.dispose();
    _cpController.dispose();
    _municipioController.dispose();
    _estadoController.dispose();
    _referenciasController.dispose();
    super.dispose();
  }

  String _toTitleCase(String texto) {
    if (texto.isEmpty) return texto;
    return texto
        .split(' ')
        .map(
          (p) => p.isEmpty
              ? ''
              : '${p[0].toUpperCase()}${p.substring(1).toLowerCase()}',
        )
        .join(' ');
  }

  // 🌟 3. El método que abre tu selector de mapas
  Future<void> _abrirMapa() async {
    Coordenadas? ubicacionActual;
    if (_latitudSeleccionada != null && _longitudSeleccionada != null) {
      ubicacionActual = Coordenadas(
        latitud: _latitudSeleccionada!,
        longitud: _longitudSeleccionada!,
      );
    }

    // Reutilizamos tu pantalla de selección del mapa
    final seleccion = await _ubicacionService.seleccionarEnMapa(
      context,
      ubicacionInicial: ubicacionActual,
    );

    // Si el usuario puso el pin, guardamos las coordenadas
    if (seleccion != null) {
      setState(() {
        _latitudSeleccionada = seleccion.latitud;
        _longitudSeleccionada = seleccion.longitud;
      });
    }
  }

  Future<void> _buscarCodigoPostal(String cp) async {
    if (cp.length != 5) return; // Solo buscamos si tiene 5 dígitos

    setState(() => _buscandoCp = true);

    try {
      // Llamamos a tu servicio de Postali (Ajusta los nombres según tu modelo exacto)
      final infoCp = await _postaliService.consultarCp(cp);

      if (infoCp != null) {
        setState(() {
          // Llenamos Municipio y Estado automáticamente
          _municipioController.text = infoCp.municipio;
          _estadoController.text = infoCp.estado;

          // Opcional: Si Postali te devuelve una lista de colonias ('asentamientos'),
          // puedes rellenar la primera por defecto para ahorrarle tiempo al usuario.
          if (infoCp.asentamientos.isNotEmpty) {
            _coloniasDisponibles = infoCp.asentamientos
                .map((a) => a.nombre)
                .toList();
            _coloniaSeleccionada = _coloniasDisponibles
                .first; // Seleccionamos la primera por defecto
            // (Ya no usamos _coloniaController)
          } else {
            _coloniasDisponibles = [];
            _coloniaSeleccionada = null;
          }
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No se encontró el Código Postal')),
      );
    } finally {
      setState(() => _buscandoCp = false);
    }
  }

  void _guardarDireccion() {
    if (!_formKey.currentState!.validate()) return;

    // 🌟 4. Validación de seguridad: No guardar sin el pin del mapa
    if (_latitudSeleccionada == null || _longitudSeleccionada == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, ubica tu dirección en el mapa.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    final nuevaDireccion = Direccion(
      id: '',
      usuarioId: widget.usuarioId,
      alias: _toTitleCase(_aliasController.text.trim()),
      calle: _toTitleCase(_calleController.text.trim()),
      numExt: _numExtController.text.trim(),
      numInt: _numIntController.text.trim().isEmpty
          ? null
          : _numIntController.text.trim(),
      colonia: _toTitleCase(_coloniaController.text.trim()),
      codigoPostal: _cpController.text.trim().replaceAll(RegExp(r'\D'), ''),
      municipio: _toTitleCase(_municipioController.text.trim()),
      estado: _toTitleCase(_estadoController.text.trim()),
      referencias: _referenciasController.text.trim().isEmpty
          ? null
          : _referenciasController.text.trim(),
      esPrincipal: _esPrincipal,
      fechaCreacion: DateTime.now(),
      // 🌟 5. Enviamos las coordenadas reales al Cubit
      latitud: _latitudSeleccionada!,
      longitud: _longitudSeleccionada!,
    );

    context.read<DireccionesCubit>().crearDireccion(nuevaDireccion);
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return BlocListener<DireccionesCubit, DireccionesState>(
      listener: (context, state) {
        state.maybeWhen(
          loaded: (_) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Dirección guardada correctamente'),
                backgroundColor: Colors.green,
              ),
            );
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message), backgroundColor: Colors.red),
            );
          },
          orElse: () {},
        );
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

                // 🌟 6. El botón para abrir el mapa
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _latitudSeleccionada != null
                          ? Colors.green.shade100
                          : Colors.blue.shade50,
                      foregroundColor: _latitudSeleccionada != null
                          ? Colors.green.shade800
                          : Colors.blue.shade800,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: _latitudSeleccionada != null
                              ? Colors.green
                              : Colors.blue.shade300,
                        ),
                      ),
                    ),
                    icon: Icon(
                      _latitudSeleccionada != null
                          ? Icons.check_circle
                          : Icons.map,
                    ),
                    label: Text(
                      _latitudSeleccionada != null
                          ? 'Ubicación seleccionada en el mapa'
                          : 'Fijar ubicación exacta en el mapa',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _abrirMapa,
                  ),
                ),

                _campo(
                  _aliasController,
                  'Alias (ej. Casa, Trabajo)',
                  requerido: true,
                ),
                const SizedBox(height: 16),
                _campo(_calleController, 'Calle', requerido: true),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _campo(
                        _numExtController,
                        'Núm Ext.',
                        requerido: true,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _campo(_numIntController, 'Núm Int. (Opcional)'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: _coloniasDisponibles.isNotEmpty
                          ? DropdownButtonFormField<String>(
                              initialValue: _coloniaSeleccionada,
                              isExpanded:
                                  true, // Para que el texto largo no rompa la pantalla
                              decoration: InputDecoration(
                                labelText: 'Colonia',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              items: _coloniasDisponibles.map((String colonia) {
                                return DropdownMenuItem<String>(
                                  value: colonia,
                                  child: Text(
                                    colonia,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? nuevoValor) {
                                setState(() {
                                  _coloniaSeleccionada = nuevoValor;
                                });
                              },
                              validator: (val) =>
                                  val == null ? 'Requerido' : null,
                            )
                          : _campo(
                              _coloniaController,
                              'Colonia',
                              requerido: true,
                            ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      // 🌟 Campo de CP personalizado con Postali
                      child: TextFormField(
                        controller: _cpController,
                        keyboardType: TextInputType.number,
                        maxLength: 5, // Límite de 5 dígitos
                        decoration: InputDecoration(
                          labelText: 'C.P.',
                          counterText: '', // Oculta el contador 0/5
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          // Muestra un loader pequeño mientras busca en Postali
                          suffixIcon: _buscandoCp
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
                            FocusScope.of(
                              context,
                            ).unfocus(); // Oculta el teclado
                            _buscarCodigoPostal(val); // 🌟 Dispara la búsqueda
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
                      child: _campo(
                        _municipioController,
                        'Municipio',
                        requerido: true,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _campo(
                        _estadoController,
                        'Estado',
                        requerido: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _campo(
                  _referenciasController,
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
                      value: _esPrincipal,
                      activeThumbColor: const Color(0xFF1E3A8A),
                      onChanged: (val) => setState(() => _esPrincipal = val),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                BlocBuilder<DireccionesCubit, DireccionesState>(
                  builder: (context, state) {
                    final isLoading = state.maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    );
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
                        onPressed: isLoading ? null : _guardarDireccion,
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

  Widget _campo(
    TextEditingController controller,
    String label, {
    bool requerido = false,
    bool numerico = false,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: numerico ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: requerido
          ? (val) => val == null || val.isEmpty ? 'Requerido' : null
          : null,
    );
  }
}
