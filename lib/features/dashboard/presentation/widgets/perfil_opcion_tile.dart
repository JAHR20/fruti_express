import 'package:flutter/material.dart';

class PerfilOpcionTile extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String? subtitulo;
  final Color? colorIcono;
  final VoidCallback onTap;
  final bool esPeligroso;

  const PerfilOpcionTile({
    super.key,
    required this.icono,
    required this.titulo,
    required this.onTap,
    this.subtitulo,
    this.colorIcono,
    this.esPeligroso = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = esPeligroso
        ? Colors.red
        : colorIcono ?? const Color(0xFF1E3A8A);

    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icono, color: color, size: 22),
      ),
      title: Text(
        titulo,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: esPeligroso ? Colors.red : null,
        ),
      ),
      subtitle: subtitulo != null
          ? Text(subtitulo!,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500))
          : null,
      trailing: esPeligroso
          ? null
          : Icon(Icons.chevron_right, color: Colors.grey.shade400),
    );
  }
}

class PerfilSeccionTitulo extends StatelessWidget {
  final String titulo;

  const PerfilSeccionTitulo({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
      child: Text(
        titulo.toUpperCase(),
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade500,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}