import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/widgets/wizard_bottom_action_button.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/widgets/wizard_progress_indicator.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/widgets/wizard_step_card.dart';
import 'package:get_it/get_it.dart';
import 'package:latlong2/latlong.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/core/services/location/location_service.dart';
import 'package:fruti_express_jahr_admin/core/types/coordinates.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/wizard_branch_cubit.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/wizard_branch_state.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/widgets/coverage_step_widget.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/widgets/branch_form_widget.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/enums/shipping_strategy.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/shipping_admin_cubit.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/shipping_admin_state.dart';

class CreateBranchWizardScreen extends StatefulWidget {
  final Branch? branch;
  final int initialStep;

  const CreateBranchWizardScreen({
    super.key,
    this.branch,
    this.initialStep = 0,
  });

  @override
  State<CreateBranchWizardScreen> createState() =>
      _CreateBranchWizardScreenState();
}

class _CreateBranchWizardScreenState extends State<CreateBranchWizardScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameCtrl;
  late TextEditingController _streetCtrl;
  late TextEditingController _exteriorNumberCtrl;
  late TextEditingController _postalCodeCtrl;
  late TextEditingController _neighborhoodCtrl;
  late TextEditingController _municipalityCtrl;
  late TextEditingController _stateCtrl;
  late TextEditingController _freeShippingCtrl;

  final LocationService _ubicacionService = sl<LocationService>();

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.branch?.name ?? '');
    _streetCtrl = TextEditingController(text: widget.branch?.street ?? '');
    _exteriorNumberCtrl = TextEditingController(
      text: widget.branch?.exteriorNumber ?? '',
    );
    _postalCodeCtrl = TextEditingController(
      text: widget.branch?.postalCode ?? '',
    );
    _neighborhoodCtrl = TextEditingController(
      text: widget.branch?.neighborhood ?? '',
    );
    _municipalityCtrl = TextEditingController(
      text: widget.branch?.municipality ?? '',
    );
    _stateCtrl = TextEditingController(text: widget.branch?.state ?? '');
    _freeShippingCtrl = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final wizardCubit = context.read<WizardBranchCubit>();
      if (widget.branch != null) {
        wizardCubit.initializeEdition(widget.branch!, widget.initialStep);
      } else {
        wizardCubit.changeStep(widget.initialStep);
      }
    });
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _streetCtrl.dispose();
    _exteriorNumberCtrl.dispose();
    _postalCodeCtrl.dispose();
    _neighborhoodCtrl.dispose();
    _municipalityCtrl.dispose();
    _stateCtrl.dispose();
    _freeShippingCtrl.dispose();
    super.dispose();
  }

  void _syncReadOnlyFields(WizardBranchState state) {
    if (_stateCtrl.text != (state.state ?? '')) {
      _stateCtrl.text = state.state ?? '';
    }
    if (_municipalityCtrl.text != (state.municipality ?? '')) {
      _municipalityCtrl.text = state.municipality ?? '';
    }
  }

  void _syncFreeShippingField(ShippingAdminState state) {
    if (state.tempFreeShippingAmount == null) {
      if (_freeShippingCtrl.text.isNotEmpty) _freeShippingCtrl.text = '';
      return;
    }
    final currentCentsInBox = _freeShippingCtrl.text.toCents;
    if (currentCentsInBox != state.tempFreeShippingAmount) {
      _freeShippingCtrl.text = state.tempFreeShippingAmount!.toInputFormat;
    }
  }

  Future<void> _openMap() async {
    final wizardCubit = context.read<WizardBranchCubit>();
    final formState = wizardCubit.state;

    Coordinates? currentLocation;
    if (formState.latitude != null && formState.longitude != null) {
      currentLocation = Coordinates(
        latitude: formState.latitude!,
        longitude: formState.longitude!,
      );
    }

    final selection = await _ubicacionService.selectOnMap(
      context,
      initialLocation: currentLocation,
    );
    if (selection != null) {
      wizardCubit.updateField(
        latitude: selection.latitude,
        longitude: selection.longitude,
      );
    }
  }

  void _handleNameChanged(String val) =>
      context.read<WizardBranchCubit>().updateField(name: val);
  void _handleStreetChanged(String val) =>
      context.read<WizardBranchCubit>().updateField(street: val);
  void _handleExteriorNumberChanged(String val) =>
      context.read<WizardBranchCubit>().updateField(exteriorNumber: val);

  void _handlePostalCodeChanged(String val) {
    if (val.length == 5) {
      context.read<WizardBranchCubit>().searchByPostalCode(val);
      FocusScope.of(context).unfocus();
    }
  }

  void _handleNeighborhoodChanged(String val) =>
      context.read<WizardBranchCubit>().updateField(neighborhood: val);

  void _handleSaveStep1(WizardBranchState formState) {
    if (!_formKey.currentState!.validate()) return;

    if (formState.latitude == null || formState.longitude == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Selecciona la ubicación en el mapa.'),
          backgroundColor: Theme.of(context).colorScheme.tertiary,
        ),
      );
      return;
    }

    final authState = context.read<AuthCubit>().state;
    if (authState is! AuthAuthenticated) return;

    final wizardCubit = context.read<WizardBranchCubit>();
    wizardCubit.updateField(
      name: _nameCtrl.text,
      street: _streetCtrl.text,
      exteriorNumber: _exteriorNumberCtrl.text,
      neighborhood: _neighborhoodCtrl.text,
    );
    wizardCubit.saveStep1(
      currentUser: authState.user,
      branchToEdit: widget.branch,
    );
  }

  Future<void> _handleSaveCoverage(
    WizardBranchState formState,
    ShippingAdminState shippingState,
  ) async {
    final branchId = formState.createdBranchId ?? widget.branch?.id;

    if (branchId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'No se encontró la sucursal. Vuelve al paso anterior.',
          ),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
      return;
    }

    final authState = context.read<AuthCubit>().state;

    if (authState is! AuthAuthenticated) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Tu sesión no está disponible. Inicia sesión nuevamente.',
          ),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
      return;
    }

    final wizardCubit = context.read<WizardBranchCubit>();

    // 1. Copiar los valores actuales del formulario al estado del wizard.
    wizardCubit.updateShippingConfig(
      maxRadiusKm: shippingState.tempRadiusKm,
      requirePostalCodeValidation: shippingState.tempRequireZipCode,
      minAmountFreeShipping: shippingState.tempFreeShippingAmount,
      strategy: shippingState.config?.strategy ?? ShippingStrategy.hybrid,
    );

    // 2. Guardar la cobertura postal y la configuración.
    await wizardCubit.finishWizard(authState.user);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLowest,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: colorScheme.onSurface,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.branch != null ? 'Editar Sucursal' : 'Nueva Sucursal',
          style: TextStyle(
            color: colorScheme.onSurface,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.5,
          ),
        ),
      ),
      body: BlocConsumer<WizardBranchCubit, WizardBranchState>(
        listenWhen: (previous, current) =>
            previous.isStep1Completed != current.isStep1Completed ||
            previous.isSaveSuccessful != current.isSaveSuccessful ||
            previous.errorMessage != current.errorMessage ||
            previous.state != current.state ||
            previous.municipality != current.municipality,
        listener: (context, formState) {
          _syncReadOnlyFields(formState);

          if (formState.isStep1Completed &&
              formState.createdBranchId != null &&
              formState.currentStep == 0) {
            context.read<WizardBranchCubit>().changeStep(1);
          }
          if (formState.isSaveSuccessful) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Sucursal configurada con éxito'),
                backgroundColor: colorScheme.primary,
              ),
            );
            Navigator.of(context).pop();
          }
          if (formState.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(formState.errorMessage!),
                backgroundColor: colorScheme.error,
              ),
            );
          }
        },
        builder: (context, formState) {
          return Column(
            children: [
              WizardProgressIndicator(
                currentStep: formState.currentStep,
                steps: const [
                  WizardStepInfo(
                    title: 'Datos Básicos',
                    icon: Icons.storefront_rounded,
                  ),
                  WizardStepInfo(title: 'Cobertura', icon: Icons.map_rounded),
                ],
              ),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  switchInCurve: Curves.easeOutCubic,
                  switchOutCurve: Curves.easeInCubic,
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.02, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                  child: KeyedSubtree(
                    key: ValueKey<int>(formState.currentStep),
                    child: formState.currentStep == 0
                        ? _buildBranchStep(formState)
                        : _buildCoverageStep(formState),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: _buildStickyBottomAction(),
    );
  }

  Widget _buildStickyBottomAction() {
    return BlocBuilder<WizardBranchCubit, WizardBranchState>(
      builder: (context, formState) {
        return BlocBuilder<ShippingAdminCubit, ShippingAdminState>(
          builder: (context, shippingState) {
            final isStep0 = formState.currentStep == 0;
            final isSaving = isStep0
                ? formState.isSaving
                : shippingState.isLoading;

            return WizardBottomActionButton(
              isLoading: isSaving,
              label: isStep0
                  ? 'Guardar y Continuar'
                  : 'Finalizar Configuración',
              icon: isStep0 ? Icons.arrow_forward_rounded : Icons.check_rounded,
              onPressed: () {
                if (isStep0) {
                  _handleSaveStep1(formState);
                } else {
                  _handleSaveCoverage(formState, shippingState);
                }
              },
            );
          },
        );
      },
    );
  }

  Widget _buildBranchStep(WizardBranchState formState) {
    if (formState.isSaving && formState.createdBranchId == null) {
      return Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.primary,
        ),
      );
    }

    return WizardStepCard(
      child: BranchFormWidget(
        formKey: _formKey,
        formState: formState,
        nameController: _nameCtrl,
        streetController: _streetCtrl,
        exteriorNumberController: _exteriorNumberCtrl,
        postalCodeController: _postalCodeCtrl,
        neighborhoodController: _neighborhoodCtrl,
        municipalityController: _municipalityCtrl,
        stateController: _stateCtrl,
        latitude: formState.latitude,
        longitude: formState.longitude,
        onOpenMap: _openMap,
        onNameChanged: _handleNameChanged,
        onStreetChanged: _handleStreetChanged,
        onExteriorNumberChanged: _handleExteriorNumberChanged,
        onPostalCodeChanged: _handlePostalCodeChanged,
        onNeighborhoodChanged: _handleNeighborhoodChanged,
      ),
    );
  }

  Widget _buildCoverageStep(WizardBranchState formState) {
    final mapUrl = GetIt.I<LocationService>().mapProviderUrl;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocListener<WizardBranchCubit, WizardBranchState>(
      listenWhen: (previous, current) =>
          previous.shippingConfig != current.shippingConfig &&
          current.shippingConfig != null,
      listener: (context, state) {
        context.read<ShippingAdminCubit>().initializeWithExistingConfig(
          state.shippingConfig,
        );
      },
      child: BlocConsumer<ShippingAdminCubit, ShippingAdminState>(
        listenWhen: (previous, current) =>
            previous.successMessage != current.successMessage ||
            previous.error != current.error ||
            previous.tempFreeShippingAmount != current.tempFreeShippingAmount,
        listener: (context, state) {
          _syncFreeShippingField(state);
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!),
                backgroundColor: colorScheme.error,
              ),
            );
          }
        },
        builder: (context, state) {
          final branchId = formState.createdBranchId ?? widget.branch?.id;

          if (branchId == null) {
            return const Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'Error: No se encontró la sucursal generada en el Paso 1.',
              ),
            );
          }

          if (state.isLoading || formState.isSearchingLocation) {
            return Center(
              child: CircularProgressIndicator(color: colorScheme.primary),
            );
          }

          final branchCenter = LatLng(
            formState.latitude ?? widget.branch?.latitude ?? 0.0,
            formState.longitude ?? widget.branch?.longitude ?? 0.0,
          );

          return WizardStepCard(
            innerPadding: const EdgeInsets.all(16),
            child: CoverageStepWidget(
              radiusKm: state.tempRadiusKm,
              requireZipCode: state.tempRequireZipCode,
              availablePostalCodes: formState.availablePostalCodes,
              selectedPostalCodes: formState.selectedPostalCodes,
              neighborhoodsByPostalCode: formState.neighborhoodsByPostalCode,
              branchCenter: branchCenter,
              mapUrl: mapUrl,
              freeShippingController: _freeShippingCtrl,
              onToggleZipCodeValidation: (val) => context
                  .read<ShippingAdminCubit>()
                  .toggleZipCodeValidation(val),
              onTogglePostalCode: (cp, selected) => context
                  .read<WizardBranchCubit>()
                  .togglePostalCode(cp, selected),
              onRadiusChanged: (val) =>
                  context.read<ShippingAdminCubit>().changeRadius(val),
              onFreeShippingChanged: (text) => context
                  .read<ShippingAdminCubit>()
                  .changeFreeShippingAmount(text.toCentsOrNull),
            ),
          );
        },
      ),
    );
  }
}
