import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/core/services/ubicacion/ubicacion_service.dart';
import 'package:fruti_express_jahr_admin/core/types/coordenadas.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/wizard_sucursal_cubit.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/wizard_sucursal_state.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

import 'sucursal_formulario_widget.dart';

class SucursalFormBottomSheet extends StatefulWidget {
  final Sucursal? sucursalAEditar;
  final Perfil perfilUsuario;
  final VoidCallback onGuardadoExitoso;

  const SucursalFormBottomSheet({
    super.key,
    this.sucursalAEditar,
    required this.perfilUsuario,
    required this.onGuardadoExitoso,
  });

  @override
  State<SucursalFormBottomSheet> createState() =>
      _SucursalFormBottomSheetState();
}

class _SucursalFormBottomSheetState extends State<SucursalFormBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nombreController;
  late TextEditingController _calleController;
  late TextEditingController _numeroExteriorController;
  late TextEditingController _codigoPostalController;
  late TextEditingController _coloniaController;
  late TextEditingController _municipioController;
  late TextEditingController _estadoController;

  final UbicacionService _ubicacionService = sl<UbicacionService>();

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController(
      text: widget.sucursalAEditar?.nombre ?? '',
    );
    _calleController = TextEditingController(
      text: widget.sucursalAEditar?.calle ?? '',
    );
    _numeroExteriorController = TextEditingController(
      text: widget.sucursalAEditar?.numExterior ?? '',
    );
    _codigoPostalController = TextEditingController(
      text: widget.sucursalAEditar?.codigoPostal ?? '',
    );
    _coloniaController = TextEditingController(
      text: widget.sucursalAEditar?.colonia ?? '',
    );
    _municipioController = TextEditingController(
      text: widget.sucursalAEditar?.municipio ?? '',
    );
    _estadoController = TextEditingController(
      text: widget.sucursalAEditar?.estado ?? '',
    );

    if (widget.sucursalAEditar != null) {
      context.read<WizardSucursalCubit>().inicializarEdicion(
        widget.sucursalAEditar!,
        0,
      );
    } else {
      context.read<WizardSucursalCubit>().cambiarPaso(0);
    }
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _calleController.dispose();
    _numeroExteriorController.dispose();
    _codigoPostalController.dispose();
    _coloniaController.dispose();
    _municipioController.dispose();
    _estadoController.dispose();
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

  void _guardar() {
    if (_formKey.currentState!.validate()) {
      final wizardCubit = context.read<WizardSucursalCubit>();

      wizardCubit.actualizarCampo(
        nombre: _nombreController.text,
        calle: _calleController.text,
        numeroExterior: _numeroExteriorController.text,
        colonia: _coloniaController.text,
      );

      wizardCubit.guardarPaso1(
        usuarioActual: widget.perfilUsuario,
        sucursalAEditar: widget.sucursalAEditar,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final esEdicion = widget.sucursalAEditar != null;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
      ),
      child: BlocConsumer<WizardSucursalCubit, WizardSucursalState>(
        listenWhen: (prev, curr) =>
            prev.paso1Completado != curr.paso1Completado ||
            prev.errorMessage != curr.errorMessage,
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: Colors.red,
              ),
            );
          }
          if (state.paso1Completado) {
            widget.onGuardadoExitoso();
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Guardado correctamente'),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      esEdicion ? 'Editar Sucursal' : 'Nueva Sucursal',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: SucursalFormularioWidget(
                    formKey: _formKey,
                    state: state,
                    nombreController: _nombreController,
                    calleController: _calleController,
                    numeroExteriorController: _numeroExteriorController,
                    codigoPostalController: _codigoPostalController,
                    coloniaController: _coloniaController,
                    municipioController: _municipioController,
                    estadoController: _estadoController,
                    latitud: state.latitud,
                    longitud: state.longitud,
                    onAbrirMapa: _abrirMapa,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: FilledButton(
                  onPressed: state.guardando ? null : _guardar,
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF1E3A8A),
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: state.guardando
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text(esEdicion ? 'Guardar Cambios' : 'Crear Sucursal'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
