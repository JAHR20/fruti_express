class Validators {
  // --- VALIDACIONES SIMPLES ---

  static String? name(String? value) {
    if (value == null || value.isEmpty) return 'Por favor ingresa un nombre';
    if (value.trim().length < 2) return 'Mínimo 2 caracteres';
    final nameRegExp = RegExp(r"^[a-zA-ZÀ-ÿ\u00f1\u00d1\s]+$");
    if (!nameRegExp.hasMatch(value)) return 'Solo se permiten letras';
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) return 'Ingresa un correo electrónico';
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) return 'Formato de correo inválido';
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) return 'Ingresa un número de teléfono';
    final phoneRegExp = RegExp(r'^\d{10}$');
    final cleanPhone = value.replaceAll(' ', '').replaceAll('-', '');
    if (!phoneRegExp.hasMatch(cleanPhone)) return 'Deben ser 10 dígitos';
    return null;
  }

  // Útil para Precio y Stock en la App Admin
  static String? positiveNumber(String? value) {
    if (value == null || value.isEmpty) return 'Campo obligatorio';
    final numValue = double.tryParse(value);
    if (numValue == null || numValue < 0) return 'Ingresa un número válido';
    return null;
  }

  // --- VALIDACIONES COMPUESTAS (Fábricas) ---

  static String? Function(String?) required([String? fieldName]) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) {
        return 'Por favor ingresa ${fieldName ?? 'este campo'}';
      }
      return null;
    };
  }

  static String? Function(String?) minLength(int length, [String? fieldName]) {
    return (String? value) {
      if (value != null && value.isNotEmpty && value.length < length) {
        return '${fieldName ?? 'Este campo'} debe tener al menos $length caracteres';
      }
      return null;
    };
  }

  // LA JOYA DE LA CORONA: Combinar validadores
  static String? Function(String?) compose(
    List<String? Function(String?)> validators,
  ) {
    return (String? value) {
      for (final validator in validators) {
        final error = validator(value);
        if (error != null) return error;
      }
      return null;
    };
  }
}
