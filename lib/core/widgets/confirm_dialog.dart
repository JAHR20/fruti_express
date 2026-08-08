import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  final String titulo;
  final String mensaje;
  final String textoConfirmar;
  final String textoCancelar;
  final VoidCallback onConfirmar;
  final Color? colorConfirmar;

  const ConfirmDialog({
    super.key,
    required this.titulo,
    required this.mensaje,
    required this.onConfirmar,
    this.textoConfirmar = 'Confirmar',
    this.textoCancelar = 'Cancelar',
    this.colorConfirmar,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        titulo,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text(mensaje),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(), 
          child: Text(textoCancelar),
        ),
        FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: colorConfirmar ?? const Color(0xFF1E3A8A), 
          ),
          onPressed: () {
            Navigator.of(context).pop(); 
            onConfirmar(); 
          },
          child: Text(textoConfirmar),
        ),
      ],
    );
  }
}