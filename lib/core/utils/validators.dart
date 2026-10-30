class Validators {
  // --- VALIDACIONES SIMPLES ---

  static String? name(String? value) {
    if (value == null || value.isEmpty) return 'Por favor ingresa un nombre';
    if (value.trim().length < 2) return 'Mínimo 2 caracteres';
    final nameRegExp = RegExp(r"^[a-zA-ZÀ-ÿ\u00f1\u00d1\s]+$");
    if (!nameRegExp.hasMatch(value)) return 'Solo se permiten letras';
    return null;
  }

  static String? paternalLastName(String? value) { 
    if (value == null || value.isEmpty) return 'Por favor ingresa un apellido';
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

  static String? optionalPositiveNumber(String? value) {
    if (value == null || value.isEmpty) return null; 
    final numValue = double.tryParse(value);
    if (numValue == null || numValue <= 0) return 'Ingresa un número válido mayor a 0';
    return null;
  }

  // --- VALIDACIONES COMPUESTAS ---

  static String? Function(String?) required([String? fieldName]) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) {
        return 'Por favor ingresa ${fieldName ?? 'este campo'}';
      }
      return null;
    };
  }

  static String? Function(String?) requiredMenu([String? fieldName]) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) {
        return 'Por favor Selecciona ${fieldName ?? 'en el menú'}';
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

  static String? registerPassword(String? value) {
    if (value == null || value.isEmpty) return 'Por favor ingresa tu contraseña';

    if (value.length < 6) return 'La contraseña debe tener al menos 6 caracteres';

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Debe contener una letra mayúscula';
    }

    if (!RegExp(r'\d').hasMatch(value)) {
      return 'Debe contener un número';
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Debe contener un carácter especial';
    }
    return null;
  }

  static String? loginPassword(String? value) {
    if (value == null || value.isEmpty) return 'Por favor ingresa tu contraseña';
    return null;
  }

  static String? confirmPassword(String? original, String? confirmation) {
    if (confirmation == null || confirmation.isEmpty) return 'Por favor confirma tu contraseña';
    if (original != confirmation) return 'Las contraseñas no coinciden';
    return null;
  }

  static String? validateBranchName(String? value) { 
    if (value == null || value.trim().isEmpty) return 'El nombre de la sucursal es obligatorio';
    if (value.trim().length < 3) return 'El nombre debe tener al menos 3 caracteres';
    return null;
  }

  static String? validateBranchAddress(String? value) { 
    if (value == null || value.trim().isEmpty) return 'La dirección de la sucursal es obligatoria';
    if (value.trim().length < 5) return 'La dirección debe tener al menos 5 caracteres';
    return null;
  }

  static String? percentage(String? value) {
    final baseValidation = positiveNumber(value);
    if (baseValidation != null) return baseValidation;
    
    final percentageValue = double.parse(value!);
    if (percentageValue <= 0 || percentageValue >= 100) return 'El descuento debe ser de 1 a 99';
    return null;
  }

  static String? Function(String?) optionalMinLength(int length, [String? customMessage]) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) return null;
      if (value.trim().length < length) {
        return customMessage ?? 'Debe tener al menos $length caracteres';
      }
      return null;
    };
  }

  static String? hexColor(String? value) {
    if (value == null || value.trim().isEmpty) return 'Por favor ingresa un color';
    if (!RegExp(r'^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$').hasMatch(value.trim())) {
      return 'Código Hexadecimal inválido (ej. #E8F5E9)';
    }
    return null;
  }

  static String? Function(String?) inventoryAdjustment({
    required bool isIncrease,
    required bool acceptsDecimals,
    required int baseCurrentStock, 
  }) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) return 'Ingresa una cantidad';

      final uiQuantity = double.tryParse(value);
      if (uiQuantity == null) return 'Ingresa un número válido';
      
      if (uiQuantity <= 0) return 'La cantidad debe ser mayor a 0';

      if (!isIncrease) {
        final baseQuantityToSubtract = acceptsDecimals 
            ? (uiQuantity * 1000).toInt() 
            : uiQuantity.toInt();

        if (baseQuantityToSubtract > baseCurrentStock) {
          final uiStock = acceptsDecimals 
              ? (baseCurrentStock / 1000).toStringAsFixed(2) 
              : baseCurrentStock.toString();
              
          return 'Solo tienes $uiStock disponibles';
        }
      }
      return null;
    };
  }
}