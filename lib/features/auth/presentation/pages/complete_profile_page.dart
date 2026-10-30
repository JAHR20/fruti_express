import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/cubits/edit_profile_cubit.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/cubits/edit_profile_state.dart';
import '../widgets/complete_profile_form.dart';

class CompleteProfilePage extends StatelessWidget {
  final AppUser currentUser;

  const CompleteProfilePage({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // 🌟 Fondo ligeramente gris para contraste
      appBar: AppBar(
        title: const Text('Tu Perfil', style: TextStyle(fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: Colors.transparent, // 🌟 AppBar limpia
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              context.read<AuthCubit>().checkStatus();
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.red),
              );
            },
          );
        },
        builder: (context, state) {
          final isSaving = state.maybeWhen(saving: () => true, orElse: () => false);

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 🌟 Encabezado más amigable y visual
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade500.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person_outline_rounded, size: 48, color: Colors.blueAccent),
                ),
                const SizedBox(height: 24),
                const Text(
                  '¡Ya casi terminamos!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Solo necesitamos unos datos más para personalizar tu experiencia.',
                  style: TextStyle(fontSize: 15, color: Colors.black54, height: 1.4),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                
                // 🌟 El formulario
                CompleteProfileForm(
                  initialProfile: currentUser.profile,
                  isSaving: isSaving,
                  onSubmit: (updatedProfile) {
                    context.read<EditProfileCubit>().updateProfile(
                          currentUser: currentUser,
                          profileToEdit: updatedProfile,
                        );
                  },
                ),
                const SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }
}