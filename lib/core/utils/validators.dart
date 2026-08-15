class Validators {
  // --- VALIDACIONES SIMPLES ---

  static String? name(String? value) {
    if (value == null || value.isEmpty) return 'Por favor ingresa un nombre';
    if (value.trim().length < 2) return 'Mínimo 2 caracteres';
    final nameRegExp = RegExp(r"^[a-zA-ZÀ-ÿ\u00f1\u00d1\s]+$");
    if (!nameRegExp.hasMatch(value)) return 'Solo se permiten letras';
    return null;
  }

  static String? apellido(String? value) {
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

  // --- VALIDACIONES COMPUESTAS 

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
        return 'Por favor Seleciona ${fieldName ?? 'en el menú'}';
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

  static String? validateSucursalName(String? value) {
    if (value == null || value.trim().isEmpty) return 'El nombre de la sucursal es obligatorio';
    if (value.trim().length < 3) return 'El nombre debe tener al menos 3 caracteres';
    return null;
  }

  static String? validateSucursalAddress(String? value) {
    if (value == null || value.trim().isEmpty) return 'La dirección de la sucursal es obligatoria';
    if (value.trim().length < 5) return 'La dirección debe tener al menos 5 caracteres';
    return null;
  }

  static String? percentage(String? value) {
    final validacionBase = positiveNumber(value);
    if (validacionBase != null) return validacionBase;
    final porcentaje = double.parse(value!);
    if (porcentaje <= 0 || porcentaje >= 100) return 'El descuento debe ser de 1 a 99';
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

  static String? Function(String?) ajusteInventario({
    required bool esAumento,
    required bool aceptaDecimales,
    required int stockActualBase, 
  }) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) return 'Ingresa una cantidad';

      final cantidadUI = double.tryParse(value);
      if (cantidadUI == null) return 'Ingresa un número válido';
      
      if (cantidadUI <= 0) return 'La cantidad debe ser mayor a 0';

      if (!esAumento) {
        final cantidadBaseARestar = aceptaDecimales 
            ? (cantidadUI * 1000).toInt() 
            : cantidadUI.toInt();

        if (cantidadBaseARestar > stockActualBase) {
          final stockUI = aceptaDecimales 
              ? (stockActualBase / 1000).toStringAsFixed(2) 
              : stockActualBase.toString();
              
          return 'Solo tienes $stockUI disponibles';
        }
      }
      return null;
    };
  }
}
