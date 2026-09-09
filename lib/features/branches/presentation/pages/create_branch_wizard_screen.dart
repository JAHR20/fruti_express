import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class CreateBranchWizardScreen extends StatefulWidget {
  final Branch? branch; // sucursal -> branch
  final int initialStep; // pasoInicial -> initialStep

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
    _neighborhoodCtrl = TextEditingController(text: widget.branch?.neighborhood ?? '');
    _municipalityCtrl = TextEditingController(
      text: widget.branch?.municipality ?? '',
    );
    _stateCtrl = TextEditingController(text: widget.branch?.state ?? '');

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.branch != null ? 'Editar Sucursal' : 'Nueva Sucursal',
        ),
        backgroundColor: Colors.white,
      ),
      body: BlocConsumer<WizardBranchCubit, WizardBranchState>(
        listenWhen: (previous, current) =>
            previous.isStep1Completed != current.isStep1Completed ||
            previous.isSaveSuccessful != current.isSaveSuccessful ||
            previous.errorMessage != current.errorMessage,
        listener: (context, formState) {
          if (formState.isStep1Completed &&
              formState.createdBranchId != null &&
              formState.currentStep == 0) {
            context.read<WizardBranchCubit>().changeStep(1);
          }
          if (formState.isSaveSuccessful) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Sucursal configurada con éxito'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.of(context).pop();
          }

          if (formState.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(formState.errorMessage!),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, formState) {
          return Stepper(
            currentStep: formState.currentStep,
            type: StepperType.horizontal,
            controlsBuilder: (context, details) => const SizedBox.shrink(),
            onStepTapped: (step) {
              if (widget.branch != null || formState.createdBranchId != null) {
                context.read<WizardBranchCubit>().changeStep(step);
              }
            },
            steps: [
              Step(
                title: const Text('Datos Básicos'),
                isActive: formState.currentStep >= 0,
                state: formState.currentStep > 0
                    ? StepState.complete
                    : StepState.indexed,
                content: _buildBranchStep(formState), // _construirPasoSucursal -> _buildBranchStep
              ),
              Step(
                title: const Text('Cobertura (Radio)'),
                isActive: formState.currentStep >= 1,
                content: CoverageStepWidget(originalBranch: widget.branch),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBranchStep(WizardBranchState formState) {
    if (formState.isSaving) {
      return const Padding(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
        ),
      );
    }

    return BranchFormWidget(
      formKey: _formKey,
      formState: formState, // state -> formState
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
      formFooter: SizedBox( // pieDeFormulario -> formFooter
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF3E8FF),
            foregroundColor: const Color(0xFF6B21A8),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 0,
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              if (formState.latitude == null || formState.longitude == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Selecciona la ubicación en el mapa.'),
                    backgroundColor: Colors.orange,
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
                currentUser: authState.profile,
                branchToEdit: widget.branch,
              );
            }
          },
          child: const Text(
            'Guardar Sucursal y Continuar',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}