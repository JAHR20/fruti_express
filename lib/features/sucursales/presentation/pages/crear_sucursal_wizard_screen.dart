import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/core/services/ubicacion/ubicacion_service.dart';
import 'package:fruti_express_jahr_admin/core/types/coordenadas.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/wizard_sucursal_cubit.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/wizard_sucursal_state.dart';
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
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nombreCtrl;
  late TextEditingController _calleCtrl;
  late TextEditingController _numeroExteriorCtrl;
  late TextEditingController _codigoPostalCtrl;
  late TextEditingController _coloniaCtrl;
  late TextEditingController _municipioCtrl;
  late TextEditingController _estadoCtrl;

  final UbicacionService _ubicacionService = sl<UbicacionService>();

  @override
  void initState() {
    super.initState();

    _nombreCtrl = TextEditingController(text: widget.sucursal?.nombre ?? '');
    _calleCtrl = TextEditingController(text: widget.sucursal?.calle ?? '');
    _numeroExteriorCtrl = TextEditingController(
      text: widget.sucursal?.numExterior ?? '',
    );
    _codigoPostalCtrl = TextEditingController(
      text: widget.sucursal?.codigoPostal ?? '',
    );
    _coloniaCtrl = TextEditingController(text: widget.sucursal?.colonia ?? '');
    _municipioCtrl = TextEditingController(
      text: widget.sucursal?.municipio ?? '',
    );
    _estadoCtrl = TextEditingController(text: widget.sucursal?.estado ?? '');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final wizardCubit = context.read<WizardSucursalCubit>();

      if (widget.sucursal != null) {
        wizardCubit.inicializarEdicion(widget.sucursal!, widget.pasoInicial);
      } else {
        wizardCubit.cambiarPaso(widget.pasoInicial);
      }
    });
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
    final wizardCubit = context.read<WizardSucursalCubit>();
    final state = wizardCubit.state;

    Coordenadas? ubicacionActual;
    if (state.latitud != null && state.longitud != null) {
      ubicacionActual = Coordenadas(
        latitud: state.latitud!,
        longitud: state.longitud!,
      );
    }

    final seleccion = await _ubicacionService.seleccionarEnMapa(
      context,
      ubicacionInicial: ubicacionActual,
    );

    if (seleccion != null) {
      wizardCubit.actualizarCampo(
        latitud: seleccion.latitud,
        longitud: seleccion.longitud,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.sucursal != null ? 'Editar Sucursal' : 'Nueva Sucursal',
        ),
        backgroundColor: Colors.white,
      ),
      body: BlocConsumer<WizardSucursalCubit, WizardSucursalState>(
        listenWhen: (previous, current) =>
            previous.paso1Completado != current.paso1Completado ||
            previous.guardadoExitoso != current.guardadoExitoso ||
            previous.errorMessage != current.errorMessage,
        listener: (context, state) {
          if (state.paso1Completado &&
              state.sucursalIdCreada != null &&
              state.pasoActual == 0) {
            context.read<WizardSucursalCubit>().cambiarPaso(1);
          }
          if (state.guardadoExitoso) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Sucursal configurada con éxito'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.of(context).pop();
          }

          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Stepper(
            currentStep: state.pasoActual,
            type: StepperType.horizontal,
            controlsBuilder: (context, details) => const SizedBox.shrink(),
            onStepTapped: (paso) {
              if (widget.sucursal != null || state.sucursalIdCreada != null) {
                context.read<WizardSucursalCubit>().cambiarPaso(paso);
              }
            },
            steps: [
              Step(
                title: const Text('Datos Básicos'),
                isActive: state.pasoActual >= 0,
                state: state.pasoActual > 0
                    ? StepState.complete
                    : StepState.indexed,
                content: _construirPasoSucursal(state),
              ),
              Step(
                title: const Text('Cobertura (Radio)'),
                isActive: state.pasoActual >= 1,
                content: PasoCoberturaWidget(sucursalOriginal: widget.sucursal),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _construirPasoSucursal(WizardSucursalState state) {
    if (state.guardando) {
      return const Padding(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
        ),
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
      latitud: state.latitud,
      longitud: state.longitud,
      onAbrirMapa: _abrirMapa,
      pieDeFormulario: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF3E8FF),
            foregroundColor: const Color(0xFF6B21A8),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 0,
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              if (state.latitud == null || state.longitud == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Selecciona la ubicación en el mapa.'),
                    backgroundColor: Colors.orange,
                  ),
                );
                return;
              }

              final authState = context.read<AuthCubit>().state;
              if (authState is! AuthAuthenticated) return;

              final wizardCubit = context.read<WizardSucursalCubit>();

              wizardCubit.actualizarCampo(
                nombre: _nombreCtrl.text,
                calle: _calleCtrl.text,
                numeroExterior: _numeroExteriorCtrl.text,
                colonia: _coloniaCtrl.text,
              );

              wizardCubit.guardarPaso1(
                usuarioActual: authState.perfil,
                sucursalAEditar: widget.sucursal,
              );
            }
          },
          child: const Text(
            'Guardar Sucursal y Continuar',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
