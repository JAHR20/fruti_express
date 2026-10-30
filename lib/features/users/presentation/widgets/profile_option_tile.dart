import 'package:flutter/material.dart';

class ProfileOptionTile extends StatelessWidget { 
  final IconData icon;
  final String title; 
  final String? subtitle; 
  final Color? iconColor; 
  final VoidCallback onTap;
  final bool isDestructive; 

  const ProfileOptionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.subtitle,
    this.iconColor,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final color = isDestructive
        ? colorScheme.error
        : iconColor ?? colorScheme.tertiary;

    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: color, size: 22),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          // 👇 Texto principal o texto de error
          color: isDestructive ? colorScheme.error : colorScheme.onSurface,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: TextStyle(
                fontSize: 12, 
                color: colorScheme.onSurfaceVariant, // 👈 Gris para textos secundarios
              ),
            )
          : null,
      trailing: isDestructive
          ? null
          : Icon(
              Icons.chevron_right, 
              color: colorScheme.onSurfaceVariant, // 👈 Flecha adaptable
            ),
    );
  }
}

class ProfileSectionTitle extends StatelessWidget { 
  final String title; 

  const ProfileSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme; // 👈 Extraemos el tema

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurfaceVariant, // 👈 Sustituye a Colors.grey.shade500
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}