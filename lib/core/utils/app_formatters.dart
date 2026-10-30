import 'package:flutter/services.dart';

abstract class AppFormatters {
  
  static final name = FilteringTextInputFormatter.allow(
    RegExp(r'[a-zA-ZáéíóúÁÉÍÓÚñÑüÜ\s]'),
  );

  static final digitsOnly = FilteringTextInputFormatter.digitsOnly;

  static final denyNewLines = FilteringTextInputFormatter.deny(
    RegExp(r'\n'),
  );

  static final denyEmojis = FilteringTextInputFormatter.deny(
    RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
  );

  static final email = FilteringTextInputFormatter.allow(
    RegExp(r'[a-zA-Z0-9@._+\-]'),
  );
}