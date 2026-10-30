import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/utils/app_formatters.dart';
import 'package:fruti_express_jahr_admin/core/utils/validators.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/user_profile.dart';
import '../../../../core/widgets/custom_text_field.dart';

class CompleteProfileForm extends StatefulWidget {
  final UserProfile initialProfile; 
  final void Function(UserProfile profile) onSubmit;
  final bool isSaving;

  const CompleteProfileForm({
    super.key,
    required this.initialProfile,
    required this.onSubmit,
    this.isSaving = false,
  });

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _firstNameController;
  late final TextEditingController _paternalController;
  late final TextEditingController _maternalController;
  late final TextEditingController _aliasController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    final p = widget.initialProfile;
    _firstNameController = TextEditingController(text: p.firstName);
    _paternalController = TextEditingController(text: p.paternalLastName);
    _maternalController = TextEditingController(text: p.maternalLastName ?? '');
    _aliasController = TextEditingController(text: p.alias ?? '');
    _phoneController = TextEditingController(text: p.phone ?? '');
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _paternalController.dispose();
    _maternalController.dispose();
    _aliasController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (!_formKey.currentState!.validate()) return;

    final updatedProfile = widget.initialProfile.copyWith(
      firstName: _firstNameController.text.trim(),
      paternalLastName: _paternalController.text.trim(),
      maternalLastName: _maternalController.text.trim().isEmpty
          ? null
          : _maternalController.text.trim(),
      alias: _aliasController.text.trim().isEmpty
          ? null
          : _aliasController.text.trim(),
      phone: _phoneController.text.trim().isEmpty
          ? null
          : _phoneController.text.trim(),
    );

    widget.onSubmit(updatedProfile);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.grey.shade500,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              label: 'Nombre',
              colorLabel: Colors.black87,
              hintText: 'Ej. Juan',
              controller: _firstNameController,
              inputFormatters: [AppFormatters.name],
              enabled: true,
              validator: Validators.name,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Apellido paterno',
              colorLabel: Colors.black87,
              hintText: 'Ej. Pérez',
              controller: _paternalController,
              inputFormatters: [AppFormatters.name],
              enabled: true,
              validator: Validators.paternalLastName,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Apellido materno (opcional)',
              colorLabel: Colors.black87,
              hintText: 'Ej. López',
              controller: _maternalController,
              inputFormatters: [AppFormatters.name],
              enabled: true,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Alias (opcional)',
              colorLabel: Colors.black87,
              hintText: 'Ej. Juanito',
              controller: _aliasController,
              inputFormatters: [AppFormatters.denyNewLines],
              enabled: true,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Teléfono',
              colorLabel: Colors.black87,
              hintText: 'Ej. 5512345678',
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              inputFormatters: [AppFormatters.digitsOnly],
              enabled: true,
              validator: Validators.phone,
            ),
            const SizedBox(height: 32),
            
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: widget.isSaving ? null : _handleSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900, 
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: widget.isSaving
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Text(
                        'Guardar y continuar',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}