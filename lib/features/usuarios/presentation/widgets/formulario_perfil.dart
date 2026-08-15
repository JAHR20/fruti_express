import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

class FormularioPerfil extends StatefulWidget {
  final Perfil perfil;
  final bool cargando;
  final void Function(Perfil perfilActualizado) onGuardar;

  const FormularioPerfil({
    super.key,
    required this.perfil,
    required this.cargando,
    required this.onGuardar,
  });

  @override
  State<FormularioPerfil> createState() => _FormularioPerfilState();
}

class _FormularioPerfilState extends State<FormularioPerfil> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nombreCtrl;
  late final TextEditingController _apellidoPaternoCtrl;
  late final TextEditingController _apellidoMaternoCtrl;
  late final TextEditingController _aliasCtrl;
  late final TextEditingController _telefonoCtrl;

  @override
  void initState() {
    super.initState();
    _nombreCtrl = TextEditingController(text: widget.perfil.nombre);
    _apellidoPaternoCtrl =
        TextEditingController(text: widget.perfil.apellidoPaterno);
    _apellidoMaternoCtrl =
        TextEditingController(text: widget.perfil.apellidoMaterno ?? '');
    _aliasCtrl = TextEditingController(text: widget.perfil.alias ?? '');
    _telefonoCtrl = TextEditingController(text: widget.perfil.telefono ?? '');
  }

  @override
  void dispose() {
    _nombreCtrl.dispose();
    _apellidoPaternoCtrl.dispose();
    _apellidoMaternoCtrl.dispose();
    _aliasCtrl.dispose();
    _telefonoCtrl.dispose();
    super.dispose();
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;

    final perfilActualizado = widget.perfil.copyWith(
      nombre: _nombreCtrl.text.trim(),
      apellidoPaterno: _apellidoPaternoCtrl.text.trim(),
      apellidoMaterno: _apellidoMaternoCtrl.text.trim().isEmpty
          ? null
          : _apellidoMaternoCtrl.text.trim(),
      alias: _aliasCtrl.text.trim().isEmpty ? null : _aliasCtrl.text.trim(),
      telefono: _telefonoCtrl.text.trim().isEmpty
          ? null
          : _telefonoCtrl.text.trim(),
    );

    widget.onGuardar(perfilActualizado);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Campo(
            controlador: _nombreCtrl,
            etiqueta: 'Nombre',
            icono: Icons.person_outline,
            validar: (v) =>
                v == null || v.trim().isEmpty ? 'El nombre es requerido' : null,
          ),
          const SizedBox(height: 16),
          _Campo(
            controlador: _apellidoPaternoCtrl,
            etiqueta: 'Apellido Paterno',
            icono: Icons.person_outline,
            validar: (v) => v == null || v.trim().isEmpty
                ? 'El apellido paterno es requerido'
                : null,
          ),
          const SizedBox(height: 16),
          _Campo(
            controlador: _apellidoMaternoCtrl,
            etiqueta: 'Apellido Materno (opcional)',
            icono: Icons.person_outline,
          ),
          const SizedBox(height: 16),
          _Campo(
            controlador: _aliasCtrl,
            etiqueta: 'Alias (opcional)',
            icono: Icons.badge_outlined,
          ),
          const SizedBox(height: 16),
          _Campo(
            controlador: _telefonoCtrl,
            etiqueta: 'Teléfono',
            icono: Icons.phone_outlined,
            teclado: TextInputType.phone,
            validar: (v) {
              if (v == null || v.trim().isEmpty) return null;
              if (v.trim().length != 10) return 'Ingresa 10 dígitos';
              return null;
            },
          ),
          const SizedBox(height: 8),
          _CampoReadOnly(
            valor: widget.perfil.email,
            etiqueta: 'Correo electrónico',
            icono: Icons.email_outlined,
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: FilledButton(
              onPressed: widget.cargando ? null : _guardar,
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF1E3A8A),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: widget.cargando
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 2),
                    )
                  : const Text('Guardar Cambios',
                      style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}

class _Campo extends StatelessWidget {
  final TextEditingController controlador;
  final String etiqueta;
  final IconData icono;
  final TextInputType teclado;
  final String? Function(String?)? validar;

  const _Campo({
    required this.controlador,
    required this.etiqueta,
    required this.icono,
    this.teclado = TextInputType.text,
    this.validar,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controlador,
      keyboardType: teclado,
      validator: validar,
      decoration: InputDecoration(
        labelText: etiqueta,
        prefixIcon: Icon(icono),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}

class _CampoReadOnly extends StatelessWidget {
  final String valor;
  final String etiqueta;
  final IconData icono;

  const _CampoReadOnly({
    required this.valor,
    required this.etiqueta,
    required this.icono,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: valor,
      readOnly: true,
      decoration: InputDecoration(
        labelText: etiqueta,
        prefixIcon: Icon(icono),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
    );
  }
}