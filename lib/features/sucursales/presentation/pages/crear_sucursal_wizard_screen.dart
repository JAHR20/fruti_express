import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/core/services/ubicacion/ubicacion_service.dart';
import 'package:fruti_express_jahr_admin/core/types/coordenadas.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/envios/presentation/cubits/envio_admin_cubit.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/formulario_sucursal_cubit.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/formulario_sucursal_state.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/widgets/paso_cobertura_widget.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/widgets/sucursal_formulario_widget.dart';


class CrearSucursalWizardScreen extends StatefulWidget {
  final Sucursal? sucursal;
  final int pasoInicial;

  const CrearSucursalWizardScreen({
    super.key,
    this.sucursal,
    this.pasoInicial = 0,
  });

  @override
  State<CrearSucursalWizardScreen> createState() =>
      _CrearSucursalWizardScreenState();
}

class _CrearSucursalWizardScreenState extends State<CrearSucursalWizardScreen> {
  int _pasoActual = 0;

  // ─── CONTROLADORES DEL PASO 1 ───
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nombreCtrl;
  late TextEditingController _calleCtrl;
  late TextEditingController _numeroExteriorCtrl;
  late TextEditingController _codigoPostalCtrl;
  late TextEditingController _coloniaCtrl;
  late TextEditingController _municipioCtrl;
  late TextEditingController _estadoCtrl;

  double? _latitudSeleccionada;
  double? _longitudSeleccionada;
  final UbicacionService _ubicacionService = sl<UbicacionService>();

  @override
  void initState() {
    super.initState();
    _pasoActual = widget.pasoInicial;
    
    // 🌟 Llenamos los controladores con la info de la sucursal (si existe)
    _nombreCtrl = TextEditingController(text: widget.sucursal?.nombre ?? '');
    _calleCtrl = TextEditingController(text: widget.sucursal?.calle ?? '');
    
    // Nos aseguramos de leer el número exterior correctamente
    _numeroExteriorCtrl = TextEditingController(
      text: widget.sucursal?.numExterior ?? widget.sucursal?.numExterior ?? '',
    ); 
    
    _codigoPostalCtrl = TextEditingController(text: widget.sucursal?.codigoPostal ?? '');
    _coloniaCtrl = TextEditingController(text: widget.sucursal?.colonia ?? '');
    _municipioCtrl = TextEditingController(text: widget.sucursal?.municipio ?? '');
    _estadoCtrl = TextEditingController(text: widget.sucursal?.estado ?? '');

    if (widget.sucursal != null) {
      _latitudSeleccionada = widget.sucursal!.latitud;
      _longitudSeleccionada = widget.sucursal!.longitud;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Despertamos a los Cubits con la info
        context.read<FormularioSucursalCubit>().inicializarEdicion(widget.sucursal!);
        context.read<EnvioAdminCubit>().cargarDatos(widget.sucursal!.id);
      });
    }
  }

  @override
  void dispose() {
    _nombreCtrl.dispose();
    _calleCtrl.dispose();
    _numeroExteriorCtrl.dispose();
    _codigoPostalCtrl.dispose();
    _coloniaCtrl.dispose();
    _municipioCtrl.dispose();
    _estadoCtrl.dispose();
    super.dispose();
  }

  Future<void> _abrirMapa() async {
    Coordenadas? ubicacionActual;
    if (_latitudSeleccionada != null && _longitudSeleccionada != null) {
      ubicacionActual = Coordenadas(
        latitud: _latitudSeleccionada!,
        longitud: _longitudSeleccionada!,
      );
    }
    final seleccion = await _ubicacionService.seleccionarEnMapa(
      context,
      ubicacionInicial: ubicacionActual,
    );
    if (seleccion != null) {
      setState(() {
        _latitudSeleccionada = seleccion.latitud;
        _longitudSeleccionada = seleccion.longitud;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.sucursal != null ? 'Editar Sucursal' : 'Nueva Sucursal'),
        backgroundColor: Colors.white,
      ),
      body: Stepper(
        currentStep: _pasoActual,
        type: StepperType.horizontal,
        controlsBuilder: (context, details) => const SizedBox.shrink(), // Ocultamos botones default
        onStepTapped: (paso) {
          // Permite navegar tocando los números solo si la sucursal ya existe (edición)
          final formState = context.read<FormularioSucursalCubit>().state;
          if (widget.sucursal != null || formState.sucursalIdCreada != null) {
            setState(() {
              _pasoActual = paso;
            });
          }
        },
        steps: [
          Step(
            title: const Text('Datos Básicos'),
            isActive: _pasoActual >= 0,
            state: _pasoActual > 0 ? StepState.complete : StepState.indexed,
            content: _construirPasoSucursal(),
          ),
          Step(
            title: const Text('Cobertura (Radio)'),
            isActive: _pasoActual >= 1,
            // 🌟 ¡MAGIA! Nuestro archivo gigante se convirtió en UNA sola línea
            content: PasoCoberturaWidget(sucursalOriginal: widget.sucursal),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // PASO 1: FORMULARIO DE SUCURSAL
  // ==========================================
  Widget _construirPasoSucursal() {
    return BlocConsumer<FormularioSucursalCubit, FormularioSucursalState>(
      listener: (context, state) {
        if (state.guardadoExitoso && state.sucursalIdCreada != null) {
          setState(() {
            _pasoActual = 1; // 🌟 Avanzamos automáticamente al Paso 2 al guardar
          });
        }
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!), backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        if (state.guardando) {
          return const Padding(
            padding: EdgeInsets.all(32.0),
            child: Center(child: CircularProgressIndicator(color: Color(0xFF1E3A8A))),
          );
        }

        return SucursalFormularioWidget(
          formKey: _formKey,
          state: state,
          nombreController: _nombreCtrl,
          calleController: _calleCtrl,
          numeroExteriorController: _numeroExteriorCtrl,
          codigoPostalController: _codigoPostalCtrl,
          coloniaController: _coloniaCtrl,
          municipioController: _municipioCtrl,
          estadoController: _estadoCtrl,
          latitud: _latitudSeleccionada,
          longitud: _longitudSeleccionada,
          onAbrirMapa: _abrirMapa,
          pieDeFormulario: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF3E8FF),
                foregroundColor: const Color(0xFF6B21A8),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                elevation: 0,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (_latitudSeleccionada == null || _longitudSeleccionada == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Selecciona la ubicación en el mapa.'), backgroundColor: Colors.orange),
                    );
                    return;
                  }

                  final authState = context.read<AuthCubit>().state;
                  if (authState is! AuthAuthenticated) return;

                  context.read<FormularioSucursalCubit>().guardarSucursal(
                    usuarioActual: authState.perfil,
                    nombre: _nombreCtrl.text,
                    calle: _calleCtrl.text,
                    numeroExterior: _numeroExteriorCtrl.text,
                    codigoPostal: _codigoPostalCtrl.text,
                    colonia: _coloniaCtrl.text,
                    municipio: _municipioCtrl.text,
                    estado: _estadoCtrl.text,
                    latitud: _latitudSeleccionada,
                    longitud: _longitudSeleccionada,
                  );
                }
              },
              child: const Text('Guardar Sucursal y Continuar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        );
      },
    );
  }
}