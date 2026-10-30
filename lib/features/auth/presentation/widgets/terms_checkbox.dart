import 'package:flutter/material.dart';

class TermsCheckbox extends StatefulWidget {
  final ValueChanged<bool>? onChanged;

  const TermsCheckbox({super.key, this.onChanged});

  @override
  State<TermsCheckbox> createState() => _TermsCheckboxState();
}

class _TermsCheckboxState extends State<TermsCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: _isChecked,
            onChanged: (value) {
              setState(() {
                _isChecked = value ?? false;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(_isChecked);
              }
            },
            activeColor: const Color(0xFF1E3A8A),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Términos del servicio',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 4),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    height: 1.4,
                  ),
                  children: [
                    TextSpan(text: 'Acepto los '),
                    TextSpan(
                      text: 'términos y condiciones',
                      style: TextStyle(
                        color: Color(0xFF1E3A8A),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text:
                          ' así como la política de privacidad de esta aplicación',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
