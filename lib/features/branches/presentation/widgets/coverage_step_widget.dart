import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/widgets/custom_text_field.dart';
import 'package:latlong2/latlong.dart';
import 'coverage_switch_widget.dart';
import 'selector_chips_cp_widget.dart';
import 'radio_coverage_map_widget.dart';
import 'coverage_slider_widget.dart';

class CoverageStepWidget extends StatelessWidget {
  final double radiusKm;
  final bool requireZipCode;
  final List<String> availablePostalCodes;
  final List<String> selectedPostalCodes;
  final LatLng branchCenter;
  final String mapUrl;
  final TextEditingController freeShippingController;
  final Map<String, List<String>> neighborhoodsByPostalCode;
  final ValueChanged<bool> onToggleZipCodeValidation;
  final void Function(String cp, bool isSelected) onTogglePostalCode;
  final ValueChanged<double> onRadiusChanged;
  final ValueChanged<String> onFreeShippingChanged;

  const CoverageStepWidget({
    super.key,
    required this.radiusKm,
    required this.requireZipCode,
    required this.availablePostalCodes,
    required this.selectedPostalCodes,
    required this.branchCenter,
    required this.mapUrl,
    required this.freeShippingController,
    required this.neighborhoodsByPostalCode,
    required this.onToggleZipCodeValidation,
    required this.onTogglePostalCode,
    required this.onRadiusChanged,
    required this.onFreeShippingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Configuración Híbrida de Cobertura',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        CoverageSwitchWidget(
          requiresCp: requireZipCode,
          selectedCount: selectedPostalCodes.length,
          onChanged: onToggleZipCodeValidation,
        ),

        if (requireZipCode)
          SelectorChipsCpWidget(
            availableCodes: availablePostalCodes,
            selectedCodes: selectedPostalCodes,
            neighborhoodsByPostalCode: neighborhoodsByPostalCode,
            onToggle: onTogglePostalCode,
          ),
        const SizedBox(height: 24),

        const Text(
          'Límite de Distancia (Radio)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),

        RadioCoverageMapWidget(
          center: branchCenter,
          radiusKm: radiusKm,
          mapUrl: mapUrl,
        ),
        const SizedBox(height: 16),

        CoverageSliderWidget(
          radiusKmCurrent: radiusKm,
          onChanged: onRadiusChanged,
        ),
        const Divider(height: 32),

        const Text(
          'Promoción de Envío',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        CustomTextField(
          label: 'Monto mínimo para envío gratis',
          hintText: 'Ej. 300.00',
          prefixIcon: Icons.attach_money,
          controller: freeShippingController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          onChanged: onFreeShippingChanged,
        ),
        const SizedBox(height: 32),

      ],
    );
  }
}