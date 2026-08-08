import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/validators.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/formulario_sucursal_cubit.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/formulario_sucursal_state.dart';

class SucursalFormularioWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final FormularioSucursalState state;
  final TextEditingController nombreController;
  final TextEditingController calleController;
  final TextEditingController numeroExteriorController;
  final TextEditingController codigoPostalController;
  final TextEditingController coloniaController;
  final TextEditingController municipioController;
  final TextEditingController estadoController;
  
  // Coordenadas
  final double? latitud;
  final double? longitud;
  final VoidCallback onAbrirMapa;
  final Widget? pieDeFormulario;

  const SucursalFormularioWidget({
    super.key,
    required this.formKey,
    required this.state,
    required this.nombreController,
    required this.calleController,
    required this.numeroExteriorController,
    required this.codigoPostalController,
    required this.coloniaController,
    required this.municipioController,
    required this.estadoController,
    this.latitud,
    this.longitud,
    required this.onAbrirMapa,
    this.pieDeFormulario,
  });

  @override
  Widget build(BuildContext context) {
    final tieneCoordenadas = latitud != null && longitud != null;

    // Obtenemos la lista de colonias basada en el C.P. ingresado
    final listaColonias = state.coloniasPorCp[codigoPostalController.text] ?? [];

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ─── 1. DATOS GENERALES ───
          const Text('Datos Generales', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          TextFormField(
            controller: nombreController,
            decoration: const InputDecoration(labelText: 'Nombre de la Sucursal', prefixIcon: Icon(Icons.storefront)),
            validator: Validators.validateSucursalName,
          ),
          const SizedBox(height: 24),

          // ─── 2. DOMICILIO FÍSICO ───
          const Text('Domicilio Físico', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextFormField(
                  controller: calleController,
                  decoration: const InputDecoration(labelText: 'Calle'),
                  validator: (val) => val == null || val.isEmpty ? 'Requerido' : null,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: TextFormField(
                  controller: numeroExteriorController,
                  decoration: const InputDecoration(labelText: 'Número'),
                  validator: (val) => val == null || val.isEmpty ? 'Requerido' : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Buscador de C.P.
          TextFormField(
            controller: codigoPostalController,
            keyboardType: TextInputType.number,
            maxLength: 5,
            decoration: InputDecoration(
              labelText: 'Código Postal',
              prefixIcon: const Icon(Icons.local_post_office),
              suffixIcon: state.buscandoUbicacion
                  ? const Padding(padding: EdgeInsets.all(12), child: CircularProgressIndicator(strokeWidth: 2))
                  : null,
            ),
            onChanged: (valor) {
              if (valor.length == 5) {
                context.read<FormularioSucursalCubit>().buscarPorCodigoPostal(valor);
                FocusScope.of(context).unfocus();
              }
            },
          ),
          const SizedBox(height: 16),

          // Estado y Municipio (Auto-llenados por el Cubit)
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  key: ValueKey(state.estado), // Se redibuja cuando el state cambia
                  initialValue: state.estado ?? '',
                  readOnly: true,
                  decoration: const InputDecoration(labelText: 'Estado', filled: true),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  key: ValueKey(state.municipio),
                  initialValue: state.municipio ?? '',
                  readOnly: true,
                  decoration: const InputDecoration(labelText: 'Municipio', filled: true),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Colonia (Dropdown si hay resultados, campo de texto si no)
          if (listaColonias.isNotEmpty)
            DropdownButtonFormField<String>(
              initialValue: listaColonias.contains(coloniaController.text) ? coloniaController.text : null,
              decoration: const InputDecoration(labelText: 'Colonia'),
              items: listaColonias.map((col) => DropdownMenuItem(value: col, child: Text(col))).toList(),
              onChanged: (val) {
                if (val != null) coloniaController.text = val;
              },
            )
          else
            TextFormField(
              controller: coloniaController,
              decoration: const InputDecoration(labelText: 'Colonia'),
              validator: (val) => val == null || val.isEmpty ? 'Requerido' : null,
            ),

          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 16),

          // ─── 3. UBICACIÓN PARA ENVÍOS (HAVERSINE) ───
          const Text('Ubicación Origen (Envíos)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            'El radio de entrega en kilómetros se calculará a partir de este punto exacto.',
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          const SizedBox(height: 12),
          
          OutlinedButton.icon(
            onPressed: onAbrirMapa,
            icon: Icon(tieneCoordenadas ? Icons.map : Icons.add_location_alt),
            label: Text(tieneCoordenadas ? 'Ubicación origen configurada' : 'Seleccionar ubicación en el mapa'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              foregroundColor: tieneCoordenadas ? Colors.green : const Color(0xFF1E3A8A),
              side: BorderSide(color: tieneCoordenadas ? Colors.green : const Color(0xFF1E3A8A)),
            ),
          ),
          
          if (!tieneCoordenadas)
             Padding(
               padding: const EdgeInsets.only(top: 8.0),
               child: Text(
                 '* Debes seleccionar la ubicación en el mapa para continuar.', 
                 style: TextStyle(color: Colors.red.shade700, fontSize: 12)
               ),
             ),

          if (pieDeFormulario != null) ...[
            const SizedBox(height: 32),
            pieDeFormulario!,
          ]
        ],
      ),
    );
  }
}