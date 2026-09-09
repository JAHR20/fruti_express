import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/services/location/location_service.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/wizard_branch_cubit.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/wizard_branch_state.dart';
import 'package:get_it/get_it.dart';
import 'package:latlong2/latlong.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_config.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/enums/shipping_strategy.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/shipping_admin_cubit.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/shipping_admin_state.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart';
import 'coverage_switch_widget.dart';
import 'selector_chips_cp_widget.dart';
import 'radio_coverage_map_widget.dart';
import 'coverage_slider_widget.dart';

class CoverageStepWidget extends StatelessWidget {
  final Branch? originalBranch; 

  const CoverageStepWidget({super.key, this.originalBranch});

  @override
  Widget build(BuildContext context) {
    final mapUrl = GetIt.I<LocationService>().mapProviderUrl;

    return BlocListener<WizardBranchCubit, WizardBranchState>(
      listenWhen: (previous, current) =>
          previous.shippingConfig != current.shippingConfig &&
          current.shippingConfig != null,
      listener: (context, formState) {
        context.read<ShippingAdminCubit>().initializeWithExistingConfig(
          formState.shippingConfig,
        );
      },
      child: BlocConsumer<ShippingAdminCubit, ShippingAdminState>(
        listener: (context, state) {
          if (state.successMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.successMessage!),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.of(context).pop();
          }
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return BlocBuilder<WizardBranchCubit, WizardBranchState>(
            builder: (context, formState) {
              final branchId =
                  formState.createdBranchId ?? originalBranch?.id;

              if (branchId == null) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Error: No se encontró la sucursal generada en el Paso 1.',
                  ),
                );
              }

              final branchCenter = LatLng(
                formState.latitude ?? originalBranch?.latitude ?? 0.0,
                formState.longitude ?? originalBranch?.longitude ?? 0.0,
              );

              if (state.isLoading || formState.isSearchingLocation) {
                return const Center(child: CircularProgressIndicator());
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Configuración Híbrida de Cobertura',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  CoverageSwitchWidget(
                    requiresCp: state.tempRequireZipCode,
                    selectedCount:
                        formState.selectedPostalCodes.length,
                    onChanged: (valor) {
                      context.read<ShippingAdminCubit>().toggleZipCodeValidation(
                        valor,
                      );
                    },
                  ),

                  if (state.tempRequireZipCode)
                    SelectorChipsCpWidget(
                      availableCodes: formState.availablePostalCodes,
                      selectedCodes: formState.selectedPostalCodes,
                      onToggle: (cp, isSelected) {
                        context
                            .read<WizardBranchCubit>()
                            .togglePostalCode(cp, isSelected);
                      },
                    ),
                  const SizedBox(height: 24),

                  const Text(
                    'Límite de Distancia (Radio)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  RadioCoverageMapWidget(
                    center: branchCenter,
                    radiusKm: state.tempRadiusKm,
                    mapUrl: mapUrl,
                  ),
                  const SizedBox(height: 16),

                  CoverageSliderWidget(
                    radiusKmCurrent: state.tempRadiusKm,
                    onChanged: (valor) {
                      context.read<ShippingAdminCubit>().changeRadius(valor);
                    },
                  ),
                  const Divider(height: 32),

                  const Text(
                    'Promoción de Envío',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    initialValue: state.tempFreeShippingAmount?.toString() ?? '',
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Monto mínimo para envío gratis',
                      hintText: 'Ej. 300.00',
                      prefixIcon: Icon(Icons.attach_money),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (valor) => context
                        .read<ShippingAdminCubit>()
                        .changeFreeShippingAmount(int.tryParse(valor)),
                  ),
                  const SizedBox(height: 32),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        final authState = context.read<AuthCubit>().state;
                        if (authState is! AuthAuthenticated) return;

                        final config = ShippingConfig(
                          id: state.config?.id ?? '',
                          branchId: branchId,
                          strategy:
                              state.config?.strategy ??
                              ShippingStrategy.hybrid,
                          maxRadiusKm: state.tempRadiusKm,
                          requireZipCodeValidation: state.tempRequireZipCode,
                          minAmountForFreeShipping: state.tempFreeShippingAmount,
                          allowedZipCodes:
                              formState.selectedPostalCodes,
                          isActive: true,
                          createdAt:
                              state.config?.createdAt ??
                              DateTime.now(),
                        );

                        context.read<ShippingAdminCubit>().saveConfig(
                          currentUser: authState.profile,
                          config: config,
                        );
                      },
                      child: const Text(
                        'Guardar Configuración',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}