import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart'; 

class ProfileHeader extends StatelessWidget {
  final AppUser user;

  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final profile = user.profile; 
    final colorScheme = Theme.of(context).colorScheme; // 👈 Extraemos el colorScheme

    final fullName = [
      profile.firstName,
      profile.paternalLastName,
      if (profile.maternalLastName != null) profile.maternalLastName!,
    ].join(' ');

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      decoration: BoxDecoration(
        color: colorScheme.primary, // 👈 Fondo usa el color principal del tema
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(90)),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 44,
            backgroundColor: colorScheme.secondary.withValues(alpha: 0.8),
            backgroundImage: profile.avatarUrl != null
                ? NetworkImage(profile.avatarUrl!)
                : null,
            child: profile.avatarUrl == null
                ? Text(
                    profile.firstName[0].toUpperCase(),
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onPrimary, // 👈 Letra inicial adaptable
                    ),
                  )
                : null,
          ),
          const SizedBox(height: 12),
          Text(
            fullName,
            style: TextStyle(
              color: colorScheme.onPrimary, // 👈 Nombre principal
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(
              color: colorScheme.onPrimary.withValues(alpha: 0.7), // 👈 Email con opacidad
              fontSize: 14,
            ),
          ),
          if (profile.alias != null) ...[
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                // 👇 Fondo sutil del "chip" de alias
                color: colorScheme.onPrimary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '@${profile.alias}',
                style: TextStyle(
                  color: colorScheme.onPrimary, // 👈 Texto del alias
                  fontSize: 12
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}