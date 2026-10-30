import 'package:flutter/material.dart';

class FormBottomSheetShell extends StatelessWidget {
  final Widget child;

  const FormBottomSheetShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: EdgeInsets.only(
          top: 24, left: 24, right: 24,
          bottom: bottomInset > 0 ? bottomInset + 16 : 32,
        ),
        child: SafeArea(
          child: SingleChildScrollView(child: child),
        ),
      ),
    );
  }
}