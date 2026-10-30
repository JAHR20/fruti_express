import 'package:flutter/material.dart';

class SocialAuthButton extends StatelessWidget {
  final String? text;
  final String iconPath;
  final Color textColor;
  final VoidCallback onPressed;

  const SocialAuthButton({
    super.key,
    this.text,
    required this.iconPath,
    this.textColor = Colors.black87,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.grey.shade200,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 28,
              height: 28,
              child: Image.asset(iconPath, fit: BoxFit.contain),
            ),
          ],
        ),
      ),
    );
  }
}
