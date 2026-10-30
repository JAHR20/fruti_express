import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/utils/validators.dart';
import 'package:fruti_express_jahr_admin/core/widgets/custom_dropdown_field.dart';
import 'package:fruti_express_jahr_admin/core/widgets/custom_text_field.dart';
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
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onStreetChanged;
  final ValueChanged<String> onExteriorNumberChanged;
  final ValueChanged<String> onPostalCodeChanged;
  final ValueChanged<String> onNeighborhoodChanged;

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
    required this.onNameChanged,
    required this.onStreetChanged,
    required this.onExteriorNumberChanged,
    required this.onPostalCodeChanged,
    required this.onNeighborhoodChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final hasCoordinates = latitude != null && longitude != null;
    final neighborhoodList =
        formState.neighborhoodsByPostalCode[postalCodeController.text] ?? [];

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Datos Generales',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: colorScheme.onSurface),
          ),
          const SizedBox(height: 12),
          CustomTextField(
            label: 'Nombre de la sucursal',
            controller: nameController,
            prefixIcon: Icons.storefront,
            validator: Validators.validateBranchName,
            onChanged: onNameChanged,
          ),
          const SizedBox(height: 24),
          Text(
            'Domicilio Físico',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: colorScheme.onSurface),
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                flex: 2,
                child: CustomTextField(
                  label: 'Calle',
                  controller: streetController,
                  validator: Validators.required('calle'),
                  onChanged: onStreetChanged,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: CustomTextField(
                  label: 'Número',
                  controller: exteriorNumberController,
                  validator: Validators.required(),
                  onChanged: onExteriorNumberChanged,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Código Postal',
            controller: postalCodeController,
            keyboardType: TextInputType.number,
            maxLength: 5,
            prefixIcon: Icons.local_post_office_rounded,
            suffixIcon: formState.isSearchingLocation
                ? Padding(
                    padding: const EdgeInsets.all(12),
                    child: SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2, color: colorScheme.primary),
                    ),
                  )
                : null,
            onChanged: onPostalCodeChanged,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  label: 'Estado',
                  controller: stateController,
                  readOnly: true,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextField(
                  label: 'Municipio',
                  controller: municipalityController,
                  readOnly: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (neighborhoodList.isNotEmpty)
            CustomDropdownField<String>(
              label: 'Colonia',
              value: neighborhoodList.contains(neighborhoodController.text)
                  ? neighborhoodController.text
                  : null,
              items: neighborhoodList
                  .map((col) => DropdownMenuItem(value: col, child: Text(col)))
                  .toList(),
              onChanged: (val) {
                if (val != null) {
                  neighborhoodController.text = val;
                  onNeighborhoodChanged(val);
                }
              },
            )
          else
            CustomTextField(
              label: 'Colonia',
              controller: neighborhoodController,
              validator: Validators.required(''),
              onChanged: onNeighborhoodChanged,
            ),

          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 16),
          Text(
            'Ubicación Origen (Envíos)',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: colorScheme.onSurface),
          ),
          const SizedBox(height: 8),
          Text(
            'El radio de entrega en kilómetros se calculará a partir de este punto exacto.',
            style: TextStyle(color: colorScheme.onSurfaceVariant, fontSize: 13),
          ),
          const SizedBox(height: 12),

          OutlinedButton.icon(
            onPressed: onOpenMap,
            icon: Icon(hasCoordinates ? Icons.map : Icons.add_location_alt),
            label: Text(
              hasCoordinates ? 'Ubicación origen configurada' : 'Seleccionar ubicación en el mapa',
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              foregroundColor: hasCoordinates ? colorScheme.primaryContainer : colorScheme.secondaryContainer,
              side: BorderSide(
                color: hasCoordinates ? colorScheme.primary : colorScheme.secondary,
              ),
            ),
          ),

          if (!hasCoordinates)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                '* Debes seleccionar la ubicación en el mapa para continuar.',
                style: TextStyle(color: colorScheme.error, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}