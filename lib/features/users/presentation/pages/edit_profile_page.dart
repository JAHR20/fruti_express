import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/cubits/edit_profile_cubit.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/cubits/edit_profile_state.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/extensions/tipo_usuario_ui_extension.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/widgets/profile_form.dart';

class EditProfilePage extends StatelessWidget {
  final VoidCallback? onSaved;
  const EditProfilePage({super.key, this.onSaved});

  @override
  Widget build(BuildContext context) {
    final currentUser =
        (context.read<AuthCubit>().state as AuthAuthenticated).user;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text('Mi Perfil', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Perfil actualizado correctamente',
                    style: TextStyle(color: colorScheme.onPrimary),
                  ),
                  backgroundColor: colorScheme.primary,
                ),
              );

              if (onSaved != null) {
                onSaved!();
              } else {
                Navigator.of(context).pop();
              }
            },
            error: (msg) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    msg,
                    style: TextStyle(color: colorScheme.onError),
                  ),
                  backgroundColor: colorScheme.error,
                ),
              );
            },
          );
        },
        builder: (context, state) {
          final isLoading = state.maybeWhen(
            saving: () => true,
            orElse: () => false,
          );

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                _Avatar(profile: currentUser),
                const SizedBox(height: 32),
                ProfileForm(
                  user: currentUser,
                  isLoading: isLoading,
                  onSave: (updatedProfile) {
                    context.read<EditProfileCubit>().updateProfile(
                      currentUser: currentUser,
                      profileToEdit: updatedProfile,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final AppUser profile;
  const _Avatar({required this.profile});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        CircleAvatar(
          radius: 48,
          backgroundColor: colorScheme.primaryContainer,
          backgroundImage: profile.profile.avatarUrl != null
              ? NetworkImage(profile.profile.avatarUrl!)
              : null,
          child: profile.profile.avatarUrl == null
              ? Text(
                  profile.profile.firstName[0].toUpperCase(),
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onPrimaryContainer,
                  ),
                )
              : null,
        ),
        const SizedBox(height: 12),
        Text(
          '${profile.profile.firstName} ${profile.profile.paternalLastName}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        Text(
          profile.role.displayName,
          style: TextStyle(color: colorScheme.onSurfaceVariant),
        ),
      ],
    );
  }
}
