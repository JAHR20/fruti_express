import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final Color? colorLabel; // 👈 Ahora es opcional (nullable)
  final String? hintText;
  final Text? helperText;
  final bool isPassword;
  final bool enabled;
  final bool readOnly; 
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final Widget? prefix; 
  final String? prefixText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? maxLines;
  final TextCapitalization textCapitalization;
  final ValueChanged<String>? onChanged; 
  final ValueChanged<String>? onFieldSubmitted;
  final VoidCallback? onTap;

  const CustomTextField({
    super.key,
    required this.label,
    this.colorLabel, // 👈 Sin valor por defecto
    this.hintText,
    this.helperText,
    this.isPassword = false,
    this.enabled = true,
    this.controller,
    this.readOnly = false,
    this.validator,
    this.prefixIcon,
    this.prefix,
    this.prefixText,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.maxLength,
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    // 👇 Extraemos el colorScheme del tema actual
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            // 👇 Usa el color que pases, o el color de texto por defecto del tema
            color: widget.colorLabel ?? colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword ? _obscureText : false,
          validator: widget.validator,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          inputFormatters: widget.inputFormatters,
          maxLength: widget.maxLength,
          maxLines: widget.isPassword ? 1 : widget.maxLines,
          textCapitalization: widget.textCapitalization,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
          onTap: widget.onTap,
          style: TextStyle(
            fontSize: 15, 
            fontWeight: FontWeight.w500,
            color: colorScheme.onSurface, // 👈 Texto principal
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7), // 👈 Gris adaptativo
              fontSize: 14
            ),
            helper: widget.helperText,
            filled: true,
            // 👇 Colores de fondo según si está habilitado o no (Material 3)
            fillColor: widget.enabled ? colorScheme.surface : colorScheme.surfaceContainerHighest,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            prefix: widget.prefix,
            prefixText: widget.prefixText,
            counterText: '',
            
            prefixIcon: widget.prefixIcon != null
                ? Icon(widget.prefixIcon, color: colorScheme.onSurfaceVariant, size: 20)
                : null,

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: colorScheme.outlineVariant, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              // 👇 Ahora usa el color primario de tu AppTheme (antes era verde)
              borderSide: BorderSide(color: colorScheme.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: colorScheme.error, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: colorScheme.error, width: 2),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              // 👇 Borde sutil para cuando está deshabilitado
              borderSide: BorderSide(color: colorScheme.outlineVariant.withValues(alpha: 0.5), width: 1),
            ),

            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      color: colorScheme.onSurfaceVariant, // 👈 Ícono adaptable
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : widget.suffixIcon,
          ),
        ),
      ],
    );
  }
}