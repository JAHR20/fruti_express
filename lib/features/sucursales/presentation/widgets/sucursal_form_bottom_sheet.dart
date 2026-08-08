import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/core/services/ubicacion/ubicacion_service.dart';
import 'package:fruti_express_jahr_admin/core/types/coordenadas.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/formulario_sucursal_cubit.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/formulario_sucursal_state.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

// 🌟 Importamos el nuevo widget
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
  State<SucursalFormBottomSheet> createState() => _SucursalFormBottomSheetState();
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
 

  double? _latitudSeleccionada;
  double? _longitudSeleccionada;

  final UbicacionService _ubicacionService = sl<UbicacionService>();

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController(text: widget.sucursalAEditar?.nombre ?? '');
    _calleController = TextEditingController(text: widget.sucursalAEditar?.calle ?? '');
    _numeroExteriorController = TextEditingController();
    _codigoPostalController = TextEditingController();
    _coloniaController = TextEditingController();
    _municipioController = TextEditingController();
    _estadoController = TextEditingController();
    _latitudSeleccionada = widget.sucursalAEditar?.latitud;
    _longitudSeleccionada = widget.sucursalAEditar?.longitud;

    if (widget.sucursalAEditar != null) {
      context.read<FormularioSucursalCubit>().inicializarEdicion(widget.sucursalAEditar!);
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
    Coordenadas? ubicacionActual;
    if (_latitudSeleccionada != null && _longitudSeleccionada != null) {
      ubicacionActual = Coordenadas(latitud: _latitudSeleccionada!, longitud: _longitudSeleccionada!);
    }
    final seleccion = await _ubicacionService.seleccionarEnMapa(context, ubicacionInicial: ubicacionActual);
    if (seleccion != null) {
      setState(() {
        _latitudSeleccionada = seleccion.latitud;
        _longitudSeleccionada = seleccion.longitud;
      });
    }
  }

  void _guardar(FormularioSucursalState state) {
    if (_formKey.currentState!.validate()) {
      context.read<FormularioSucursalCubit>().guardarSucursal(
        usuarioActual: widget.perfilUsuario,
        sucursalAEditar: widget.sucursalAEditar,
        nombre: _nombreController.text.trim(),
        calle: _calleController.text.trim(),
        numeroExterior: _numeroExteriorController.text.trim(),
        codigoPostal: _codigoPostalController.text.trim(),
        colonia: _coloniaController.text.trim(),
        municipio: _municipioController.text.trim(),
        estado: _estadoController.text.trim(),
        latitud: _latitudSeleccionada,
        longitud: _longitudSeleccionada,
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
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
      child: BlocConsumer<FormularioSucursalCubit, FormularioSucursalState>(
        listenWhen: (prev, curr) => prev.guardadoExitoso != curr.guardadoExitoso || prev.errorMessage != curr.errorMessage,
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage!), backgroundColor: Colors.red));
          }
          if (state.guardadoExitoso) {
            widget.onGuardadoExitoso(); 
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Guardado correctamente'), backgroundColor: Colors.green));
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ─── Cabecera del BottomSheet ───
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(esEdicion ? 'Editar Sucursal' : 'Nueva Sucursal', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.of(context).pop()),
                  ],
                ),
              ),

              // ─── Cuerpo del Formulario 🌟 AHORA USA EL DUMB WIDGET ───
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
                    latitud: _latitudSeleccionada,
                    longitud: _longitudSeleccionada,
                    onAbrirMapa: _abrirMapa,
                  ),
                ),
              ),

              // ─── Pie del BottomSheet (Botón de Acción fijo) ───
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -5))],
                ),
                child: FilledButton(
                  onPressed: state.guardando ? null : () => _guardar(state),
                  style: FilledButton.styleFrom(backgroundColor: const Color(0xFF1E3A8A), minimumSize: const Size.fromHeight(50)),
                  child: state.guardando
                      ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
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