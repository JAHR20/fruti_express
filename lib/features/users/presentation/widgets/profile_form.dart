import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/widgets/confirm_dialog.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/user_profile.dart';

class ProfileForm extends StatefulWidget {
  final AppUser user;
  final bool isLoading;
  final void Function(UserProfile updatedProfile) onSave;

  const ProfileForm({
    super.key,
    required this.user,
    required this.isLoading,
    required this.onSave,
  });

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _firstNameCtrl;
  late final TextEditingController _paternalLastNameCtrl;
  late final TextEditingController _maternalLastNameCtrl;
  late final TextEditingController _aliasCtrl;
  late final TextEditingController _phoneCtrl;

  @override
  void initState() {
    super.initState();
    _firstNameCtrl = TextEditingController(text: widget.user.profile.firstName);
    _paternalLastNameCtrl = TextEditingController(
      text: widget.user.profile.paternalLastName,
    );
    _maternalLastNameCtrl = TextEditingController(
      text: widget.user.profile.maternalLastName ?? '',
    );
    _aliasCtrl = TextEditingController(text: widget.user.profile.alias ?? '');
    _phoneCtrl = TextEditingController(text: widget.user.profile.phone ?? '');
  }

  @override
  void dispose() {
    _firstNameCtrl.dispose();
    _paternalLastNameCtrl.dispose();
    _maternalLastNameCtrl.dispose();
    _aliasCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  void _confirmSave(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    final colorScheme = Theme.of(context).colorScheme;

    showDialog(
      context: context,
      builder: (ctx) => ConfirmDialog(
        title: 'Guardar cambios',
        message: '¿Estás seguro de que deseas actualizar tu perfil?',
        confirmText: 'Guardar',
        confirmColor: colorScheme.primary,
        cancelColor: colorScheme.error,
        onConfirm: _save,
      ),
    );
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    final updatedProfile = widget.user.profile.copyWith(
      firstName: _firstNameCtrl.text.trim(),
      paternalLastName: _paternalLastNameCtrl.text.trim(),
      maternalLastName: _maternalLastNameCtrl.text.trim().isEmpty
          ? null
          : _maternalLastNameCtrl.text.trim(),
      alias: _aliasCtrl.text.trim().isEmpty ? null : _aliasCtrl.text.trim(),
      phone: _phoneCtrl.text.trim().isEmpty ? null : _phoneCtrl.text.trim(),
    );

    widget.onSave(updatedProfile);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Field(
            controller: _firstNameCtrl,
            label: 'Nombre',
            icon: Icons.person_outline,
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'El nombre es requerido' : null,
          ),
          const SizedBox(height: 16),
          _Field(
            controller: _paternalLastNameCtrl,
            label: 'Apellido Paterno',
            icon: Icons.person_outline,
            validator: (v) => v == null || v.trim().isEmpty
                ? 'El apellido paterno es requerido'
                : null,
          ),
          const SizedBox(height: 16),
          _Field(
            controller: _maternalLastNameCtrl,
            label: 'Apellido Materno (opcional)',
            icon: Icons.person_outline,
          ),
          const SizedBox(height: 16),
          _Field(
            controller: _aliasCtrl,
            label: 'Alias (opcional)',
            icon: Icons.badge_outlined,
          ),
          const SizedBox(height: 16),
          _Field(
            controller: _phoneCtrl,
            label: 'Teléfono',
            icon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
            validator: (v) {
              if (v == null || v.trim().isEmpty) return null;
              if (v.trim().length != 10) return 'Ingresa 10 dígitos';
              return null;
            },
          ),
          const SizedBox(height: 8),
          _ReadOnlyField(
            value: widget.user.email,
            label: 'Correo electrónico',
            icon: Icons.email_outlined,
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: FilledButton(
              onPressed: widget.isLoading ? null : () => _confirmSave(context),
              style: FilledButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: widget.isLoading
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: colorScheme
                            .onPrimary, // 👈 Se adapta al color sobre el primario
                        strokeWidth: 2,
                      ),
                    )
                  : const Text(
                      'Guardar Cambios',
                      style: TextStyle(fontSize: 16),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const _Field({
    required this.controller,
    required this.label,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    );
  }
}

class _ReadOnlyField extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;

  const _ReadOnlyField({
    required this.value,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      initialValue: value,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        filled: true,
        fillColor:
            colorScheme.surfaceContainerHighest, // 👈 Reemplaza al gris fijo
      ),
    );
  }
}
