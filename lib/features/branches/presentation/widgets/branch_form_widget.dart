import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/validators.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/wizard_branch_cubit.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/wizard_branch_state.dart';

class BranchFormWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final WizardBranchState formState;
  final TextEditingController nameController;
  final TextEditingController streetController;
  final TextEditingController exteriorNumberController;
  final TextEditingController postalCodeController;
  final TextEditingController neighborhoodController;
  final TextEditingController municipalityController;
  final TextEditingController stateController;

  final double? latitude;
  final double? longitude;
  final VoidCallback onOpenMap;
  final Widget? formFooter;

  const BranchFormWidget({
    super.key,
    required this.formKey,
    required this.formState,
    required this.nameController,
    required this.streetController,
    required this.exteriorNumberController,
    required this.postalCodeController,
    required this.neighborhoodController,
    required this.municipalityController,
    required this.stateController,
    this.latitude,
    this.longitude,
    required this.onOpenMap,
    this.formFooter,
  });

  @override
  Widget build(BuildContext context) {
    final hasCoordinates = latitude != null && longitude != null;
    final neighborhoodList =
        formState.neighborhoodsByPostalCode[postalCodeController.text] ?? [];

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Datos Generales',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Nombre de la Sucursal',
              prefixIcon: Icon(Icons.storefront),
            ),
            validator: Validators.validateBranchName, // Pendiente actualizar tus validadores globales si es necesario
            onChanged: (val) => context
                .read<WizardBranchCubit>()
                .updateField(name: val),
          ),
          const SizedBox(height: 24),
          const Text(
            'Domicilio Físico',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextFormField(
                  controller: streetController,
                  decoration: const InputDecoration(labelText: 'Calle'),
                  validator: (val) =>
                      val == null || val.isEmpty ? 'Requerido' : null,
                  onChanged: (val) => context
                      .read<WizardBranchCubit>()
                      .updateField(street: val),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: TextFormField(
                  controller: exteriorNumberController,
                  decoration: const InputDecoration(labelText: 'Número'),
                  validator: (val) =>
                      val == null || val.isEmpty ? 'Requerido' : null,
                  onChanged: (val) => context
                      .read<WizardBranchCubit>()
                      .updateField(exteriorNumber: val),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: postalCodeController,
            keyboardType: TextInputType.number,
            maxLength: 5,
            decoration: InputDecoration(
              labelText: 'Código Postal',
              prefixIcon: const Icon(Icons.local_post_office),
              suffixIcon: formState.isSearchingLocation
                  ? const Padding(
                      padding: EdgeInsets.all(12),
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : null,
            ),
            onChanged: (valor) {
              if (valor.length == 5) {
                context.read<WizardBranchCubit>().searchByPostalCode(
                  valor,
                );
                FocusScope.of(context).unfocus();
              }
            },
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  key: ValueKey(formState.state),
                  initialValue: formState.state ?? '',
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'Estado',
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  key: ValueKey(formState.municipality),
                  initialValue: formState.municipality ?? '',
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'Municipio',
                    filled: true,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (neighborhoodList.isNotEmpty)
            DropdownButtonFormField<String>(
              initialValue: neighborhoodList.contains(neighborhoodController.text)
                  ? neighborhoodController.text
                  : null,
              decoration: const InputDecoration(labelText: 'Colonia'),
              items: neighborhoodList
                  .map((col) => DropdownMenuItem(value: col, child: Text(col)))
                  .toList(),
              onChanged: (val) {
                if (val != null) {
                  neighborhoodController.text = val;
                  context.read<WizardBranchCubit>().updateField(
                    neighborhood: val,
                  );
                }
              },
            )
          else
            TextFormField(
              controller: neighborhoodController,
              decoration: const InputDecoration(labelText: 'Colonia'),
              validator: (val) =>
                  val == null || val.isEmpty ? 'Requerido' : null,
              onChanged: (val) => context
                  .read<WizardBranchCubit>()
                  .updateField(neighborhood: val),
            ),

          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 16),
          const Text(
            'Ubicación Origen (Envíos)',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'El radio de entrega en kilómetros se calculará a partir de este punto exacto.',
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          const SizedBox(height: 12),

          OutlinedButton.icon(
            onPressed: onOpenMap,
            icon: Icon(hasCoordinates ? Icons.map : Icons.add_location_alt),
            label: Text(
              hasCoordinates
                  ? 'Ubicación origen configurada'
                  : 'Seleccionar ubicación en el mapa',
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              foregroundColor: hasCoordinates
                  ? Colors.green
                  : const Color(0xFF1E3A8A),
              side: BorderSide(
                color: hasCoordinates
                    ? Colors.green
                    : const Color(0xFF1E3A8A),
              ),
            ),
          ),

          if (!hasCoordinates)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                '* Debes seleccionar la ubicación en el mapa para continuar.',
                style: TextStyle(color: Colors.red.shade700, fontSize: 12),
              ),
            ),

          if (formFooter != null) ...[
            const SizedBox(height: 32),
            formFooter!,
          ],
        ],
      ),
    );
  }
}