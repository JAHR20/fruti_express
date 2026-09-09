import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/core/services/location/location_service.dart';
import 'package:fruti_express_jahr_admin/core/types/coordinates.dart';

import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/wizard_branch_cubit.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/wizard_branch_state.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart'; // Perfil -> Profile

import 'branch_form_widget.dart'; // Tu nuevo widget del paso 2

class BranchFormBottomSheet extends StatefulWidget {
  final Branch? branchToEdit; // sucursalAEditar -> branchToEdit
  final Profile userProfile; // perfilUsuario -> userProfile
  final VoidCallback onSaveSuccess; // onGuardadoExitoso -> onSaveSuccess

  const BranchFormBottomSheet({
    super.key,
    this.branchToEdit,
    required this.userProfile,
    required this.onSaveSuccess,
  });

  @override
  State<BranchFormBottomSheet> createState() =>
      _BranchFormBottomSheetState();
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
    _nameController = TextEditingController(
      text: widget.branchToEdit?.name ?? '',
    );
    _streetController = TextEditingController(
      text: widget.branchToEdit?.street ?? '',
    );
    _exteriorNumberController = TextEditingController(
      text: widget.branchToEdit?.exteriorNumber ?? '',
    );
    _postalCodeController = TextEditingController(
      text: widget.branchToEdit?.postalCode ?? '',
    );
    _neighborhoodController = TextEditingController(
      text: widget.branchToEdit?.neighborhood ?? '',
    );
    _municipalityController = TextEditingController(
      text: widget.branchToEdit?.municipality ?? '',
    );
    _stateController = TextEditingController(
      text: widget.branchToEdit?.state ?? '',
    );

    if (widget.branchToEdit != null) {
      context.read<WizardBranchCubit>().initializeEdition(
        widget.branchToEdit!,
        0,
      );
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

  Future<void> _openMap() async { // _abrirMapa -> _openMap
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

  void _save() { // _guardar -> _save
    if (_formKey.currentState!.validate()) {
      final wizardCubit = context.read<WizardBranchCubit>();

      wizardCubit.updateField(
        name: _nameController.text,
        street: _streetController.text,
        exteriorNumber: _exteriorNumberController.text,
        neighborhood: _neighborhoodController.text,
      );

      wizardCubit.saveStep1(
        currentUser: widget.userProfile,
        branchToEdit: widget.branchToEdit,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.branchToEdit != null; // esEdicion -> isEditing

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
      ),
      child: BlocConsumer<WizardBranchCubit, WizardBranchState>(
        listenWhen: (prev, curr) =>
            prev.isStep1Completed != curr.isStep1Completed ||
            prev.errorMessage != curr.errorMessage,
        listener: (context, formState) {
          if (formState.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(formState.errorMessage!),
                backgroundColor: Colors.red,
              ),
            );
          }
          if (formState.isStep1Completed) {
            widget.onSaveSuccess();
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Guardado correctamente'),
                backgroundColor: Colors.green,
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
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isEditing ? 'Editar Sucursal' : 'Nueva Sucursal',
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
                  child: BranchFormWidget( // Llamando a tu nuevo widget
                    formKey: _formKey,
                    formState: formState, // state -> formState
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
                  onPressed: formState.isSaving ? null : _save,
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF1E3A8A),
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: formState.isSaving
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
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