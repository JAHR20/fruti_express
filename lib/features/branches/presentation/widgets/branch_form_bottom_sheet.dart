import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/core/services/location/location_service.dart';
import 'package:fruti_express_jahr_admin/core/types/coordinates.dart';

import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/wizard_branch_cubit.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/wizard_branch_state.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';

import 'branch_form_widget.dart';

class BranchFormBottomSheet extends StatefulWidget {
  final Branch? branchToEdit;
  final AppUser userProfile;
  final VoidCallback onSaveSuccess;

  const BranchFormBottomSheet({
    super.key,
    this.branchToEdit,
    required this.userProfile,
    required this.onSaveSuccess,
  });

  @override
  State<BranchFormBottomSheet> createState() => _BranchFormBottomSheetState();
}

class _BranchFormBottomSheetState extends State<BranchFormBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _streetController;
  late TextEditingController _exteriorNumberController;
  late TextEditingController _postalCodeController;
  late TextEditingController _neighborhoodController;
  late TextEditingController _municipalityController;
  late TextEditingController _stateController;

  final LocationService _ubicacionService = sl<LocationService>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.branchToEdit?.name ?? '');
    _streetController = TextEditingController(text: widget.branchToEdit?.street ?? '');
    _exteriorNumberController = TextEditingController(text: widget.branchToEdit?.exteriorNumber ?? '');
    _postalCodeController = TextEditingController(text: widget.branchToEdit?.postalCode ?? '');
    _neighborhoodController = TextEditingController(text: widget.branchToEdit?.neighborhood ?? '');
    _municipalityController = TextEditingController(text: widget.branchToEdit?.municipality ?? '');
    _stateController = TextEditingController(text: widget.branchToEdit?.state ?? '');

    if (widget.branchToEdit != null) {
      context.read<WizardBranchCubit>().initializeEdition(widget.branchToEdit!, 0);
    } else {
      context.read<WizardBranchCubit>().changeStep(0);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _streetController.dispose();
    _exteriorNumberController.dispose();
    _postalCodeController.dispose();
    _neighborhoodController.dispose();
    _municipalityController.dispose();
    _stateController.dispose();
    super.dispose();
  }

  Future<void> _openMap() async {
    final wizardCubit = context.read<WizardBranchCubit>();
    final formState = wizardCubit.state;

    Coordinates? currentLocation;
    if (formState.latitude != null && formState.longitude != null) {
      currentLocation = Coordinates(latitude: formState.latitude!, longitude: formState.longitude!);
    }

    final selection = await _ubicacionService.selectOnMap(context, initialLocation: currentLocation);
    if (selection != null) {
      wizardCubit.updateField(latitude: selection.latitude, longitude: selection.longitude);
    }
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      final wizardCubit = context.read<WizardBranchCubit>();

      wizardCubit.updateField(
        name: _nameController.text,
        street: _streetController.text,
        exteriorNumber: _exteriorNumberController.text,
        neighborhood: _neighborhoodController.text,
      );

      wizardCubit.saveStep1(currentUser: widget.userProfile, branchToEdit: widget.branchToEdit);
    }
  }

  void _syncReadOnlyFields(WizardBranchState state) {
    if (_stateController.text != (state.state ?? '')) {
      _stateController.text = state.state ?? '';
    }
    if (_municipalityController.text != (state.municipality ?? '')) {
      _municipalityController.text = state.municipality ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isEditing = widget.branchToEdit != null;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
      child: BlocConsumer<WizardBranchCubit, WizardBranchState>(
        listenWhen: (prev, curr) =>
            prev.isStep1Completed != curr.isStep1Completed ||
            prev.errorMessage != curr.errorMessage ||
            prev.state != curr.state ||
            prev.municipality != curr.municipality,
        listener: (context, formState) {
          _syncReadOnlyFields(formState);
          if (formState.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(formState.errorMessage!),
                backgroundColor: colorScheme.error, 
              ),
            );
          }
          if (formState.isStep1Completed) {
            widget.onSaveSuccess();
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Guardado correctamente'),
                backgroundColor: colorScheme.primary, 
              ),
            );
          }
        },
        builder: (context, formState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: colorScheme.outlineVariant)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isEditing ? 'Editar Sucursal' : 'Nueva Sucursal',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: colorScheme.onSurface),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: colorScheme.onSurfaceVariant),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: BranchFormWidget(
                    formKey: _formKey,
                    formState: formState,
                    nameController: _nameController,
                    streetController: _streetController,
                    exteriorNumberController: _exteriorNumberController,
                    postalCodeController: _postalCodeController,
                    neighborhoodController: _neighborhoodController,
                    municipalityController: _municipalityController,
                    stateController: _stateController,
                    latitude: formState.latitude,
                    longitude: formState.longitude,
                    onOpenMap: _openMap,
                    onNameChanged: (val) => context.read<WizardBranchCubit>().updateField(name: val),
                    onStreetChanged: (val) => context.read<WizardBranchCubit>().updateField(street: val),
                    onExteriorNumberChanged: (val) =>
                        context.read<WizardBranchCubit>().updateField(exteriorNumber: val),
                    onPostalCodeChanged: (val) {
                      if (val.length == 5) {
                        context.read<WizardBranchCubit>().searchByPostalCode(val);
                        FocusScope.of(context).unfocus();
                      }
                    },
                    onNeighborhoodChanged: (val) =>
                        context.read<WizardBranchCubit>().updateField(neighborhood: val),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.shadow.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: FilledButton(
                  onPressed: formState.isSaving ? null : _save,
                  style: FilledButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: formState.isSaving
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: colorScheme.onPrimary,
                          ),
                        )
                      : Text(isEditing ? 'Guardar Cambios' : 'Crear Sucursal'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}