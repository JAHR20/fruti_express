import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/cubits/pedidos_repartidor_cubit.dart';

enum _ModoEntrega { clientePresente, clienteAusente }

class ConfirmarEntregaSheet extends StatefulWidget {
  final Pedido pedido;

  const ConfirmarEntregaSheet({super.key, required this.pedido});

  @override
  State<ConfirmarEntregaSheet> createState() => _ConfirmarEntregaSheetState();
}

class _ConfirmarEntregaSheetState extends State<ConfirmarEntregaSheet> {
  _ModoEntrega _modo = _ModoEntrega.clientePresente;
  final _codigoCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _rutaFoto;

  @override
  void dispose() {
    _codigoCtrl.dispose();
    super.dispose();
  }

  Future<void> _tomarFoto() async {
    final picker = ImagePicker();
    final foto = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 800,
      maxHeight: 600,
      imageQuality: 70,
    );
    if (foto != null) setState(() => _rutaFoto = foto.path);
  }

  Future<void> _confirmar() async {
    // Cliente presente → validar código
    if (_modo == _ModoEntrega.clientePresente) {
      if (!_formKey.currentState!.validate()) return;

      Navigator.of(context).pop();
      await context.read<PedidosRepartidorCubit>().confirmarEntrega(
            pedidoId: widget.pedido.id,
            codigoConfirmacion: _codigoCtrl.text.trim(),
            rutaFoto: null,
          );
      return;
    }

    // Cliente ausente → solo foto obligatoria
    if (_rutaFoto == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debes tomar una foto de evidencia'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    Navigator.of(context).pop();
    await context.read<PedidosRepartidorCubit>().confirmarEntrega(
          pedidoId: widget.pedido.id,
          codigoConfirmacion: null, // ← sin código
          rutaFoto: _rutaFoto,
        );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.95,
        expand: false,
        builder: (_, scrollController) => SingleChildScrollView(
          controller: scrollController,
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ─── Handle ───────────────────────────────────────────────
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),

                // ─── Título ───────────────────────────────────────────────
                const Text(
                  'Confirmar Entrega',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  '#${widget.pedido.id.substring(0, 8).toUpperCase()} · ${widget.pedido.clienteNombreSnapshot}',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                const SizedBox(height: 20),

                // ─── Selector modo ────────────────────────────────────────
                Row(
                  children: [
                    Expanded(
                      child: _SelectorModo(
                        icono: Icons.person_outline,
                        etiqueta: 'Cliente\npresente',
                        activo: _modo == _ModoEntrega.clientePresente,
                        color: Colors.green,
                        onTap: () => setState(
                            () => _modo = _ModoEntrega.clientePresente),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _SelectorModo(
                        icono: Icons.person_off_outlined,
                        etiqueta: 'Cliente\nausente',
                        activo: _modo == _ModoEntrega.clienteAusente,
                        color: Colors.orange,
                        onTap: () => setState(
                            () => _modo = _ModoEntrega.clienteAusente),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // ─── Cliente presente → código ────────────────────────────
                if (_modo == _ModoEntrega.clientePresente) ...[
                  const Text(
                    'Pide al cliente su código de confirmación',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _codigoCtrl,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 16,
                    ),
                    decoration: InputDecoration(
                      hintText: '0000',
                      counterText: '',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (v) {
                      if (v == null || v.trim().length != 4) {
                        return 'Ingresa el código de 4 dígitos';
                      }
                      return null;
                    },
                  ),
                ],

                // ─── Cliente ausente → solo foto ──────────────────────────
                if (_modo == _ModoEntrega.clienteAusente) ...[
                  const Text(
                    'Toma una foto como evidencia de entrega',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: _tomarFoto,
                    child: Container(
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                        color: _rutaFoto != null
                            ? Colors.green.withValues(alpha: 0.05)
                            : Colors.orange.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: _rutaFoto != null
                              ? Colors.green
                              : Colors.orange.withValues(alpha: 0.5),
                          width: 1.5,
                        ),
                      ),
                      child: _rutaFoto == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.camera_alt_outlined,
                                    size: 40, color: Colors.orange.shade400),
                                const SizedBox(height: 8),
                                Text(
                                  'Tomar foto de evidencia',
                                  style: TextStyle(
                                    color: Colors.orange.shade400,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.check_circle,
                                    color: Colors.green, size: 40),
                                const SizedBox(height: 8),
                                const Text('Foto tomada',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w500)),
                                TextButton(
                                  onPressed: _tomarFoto,
                                  child: const Text('Cambiar foto'),
                                ),
                              ],
                            ),
                    ),
                  ),
                ],

                const SizedBox(height: 24),

                // ─── Botón confirmar ──────────────────────────────────────
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledButton(
                    onPressed: _confirmar,
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Confirmar Entrega',
                        style: TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      );
  }
}

// ─── Subwidgets ───────────────────────────────────────────────────────────────

class _SelectorModo extends StatelessWidget {
  final IconData icono;
  final String etiqueta;
  final bool activo;
  final Color color;
  final VoidCallback onTap;

  const _SelectorModo({
    required this.icono,
    required this.etiqueta,
    required this.activo,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: activo ? color.withValues(alpha: 0.1) : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: activo ? color : Colors.grey.shade300,
            width: activo ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(icono, color: activo ? color : Colors.grey, size: 28),
            const SizedBox(height: 6),
            Text(
              etiqueta,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: activo ? color : Colors.grey,
                fontWeight:
                    activo ? FontWeight.bold : FontWeight.normal,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}