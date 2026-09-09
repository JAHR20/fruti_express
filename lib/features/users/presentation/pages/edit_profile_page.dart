import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/cubits/edit_profile_cubit.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/cubits/edit_profile_state.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/widgets/profile_form.dart';

class EditProfilePage extends StatelessWidget { 
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = (context.read<AuthCubit>().state as AuthAuthenticated).profile; 

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Mi Perfil',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Perfil actualizado correctamente'),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.of(context).pop();
            },
            error: (msg) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(msg), backgroundColor: Colors.red),
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
                  profile: currentUser,
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
  final Profile profile;
  const _Avatar({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 48,
          backgroundColor: const Color(0xFF1E3A8A).withValues(alpha: 0.1), 
          backgroundImage: profile.avatarUrl != null
              ? NetworkImage(profile.avatarUrl!)
              : null,
          child: profile.avatarUrl == null
              ? Text(
                  profile.firstName[0].toUpperCase(), 
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E3A8A),
                  ),
                )
              : null,
        ),
        const SizedBox(height: 12),
        Text(
          // Asumo firstName y lastName
          '${profile.firstName} ${profile.paternalLastName}', 
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          profile.role.name, // rol -> role
          style: TextStyle(color: Colors.grey.shade600),
        ),
      ],
    );
  }
}