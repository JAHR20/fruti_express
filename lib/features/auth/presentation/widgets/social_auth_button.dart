import 'package:flutter/material.dart';

class SocialAuthButton extends StatelessWidget {
  final String text;
  final String iconPath; // Ruta del icono (ej. 'assets/icons/google.png')
  final Color textColor;
  final VoidCallback onPressed;

  const SocialAuthButton({
    super.key,
    required this.text,
    required this.iconPath,
    this.textColor = Colors.black87,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded( // Expanded para que ocupen mitades iguales en un Row
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.grey.shade200, // Color del ripple effect
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey.shade300), // Borde sutil
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Aquí puedes usar Image.asset si tienes los logos en PNG/SVG
            // Reemplazo temporal con un Icon para que compile a la primera
            const Icon(Icons.circle, size: 20, color: Colors.grey), 
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}