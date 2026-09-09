import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/driver_orders_cubit.dart'; // Import actualizado

enum _DeliveryMode { customerPresent, customerAbsent } 

class ConfirmDeliverySheet extends StatefulWidget {
  final Order order; // pedido -> order

  const ConfirmDeliverySheet({super.key, required this.order});

  @override
  State<ConfirmDeliverySheet> createState() => _ConfirmDeliverySheetState();
}

class _ConfirmDeliverySheetState extends State<ConfirmDeliverySheet> {
  _DeliveryMode _mode = _DeliveryMode.customerPresent;
  final _codeCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _photoPath; 

  @override
  void dispose() {
    _codeCtrl.dispose();
    super.dispose();
  }

  Future<void> _takePhoto() async { 
    final picker = ImagePicker();
    final photo = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 800,
      maxHeight: 600,
      imageQuality: 70,
    );
    if (photo != null) setState(() => _photoPath = photo.path);
  }

  Future<void> _confirm() async {
    if (_mode == _DeliveryMode.customerPresent) {
      if (!_formKey.currentState!.validate()) return;

      Navigator.of(context).pop();
      await context.read<DriverOrdersCubit>().confirmDelivery(
            orderId: widget.order.id,
            confirmationCode: _codeCtrl.text.trim(),
            photoPath: null,
          );
      return;
    }
    
    if (_photoPath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debes tomar una foto de evidencia'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    Navigator.of(context).pop();
    await context.read<DriverOrdersCubit>().confirmDelivery(
          orderId: widget.order.id,
          confirmationCode: null,
          photoPath: _photoPath,
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
                const Text(
                  'Confirmar Entrega',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  '#${widget.order.id.substring(0, 8).toUpperCase()} · ${widget.order.customerNameSnapshot}',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: _ModeSelector(
                        icon: Icons.person_outline,
                        label: 'Cliente\npresente',
                        isActive: _mode == _DeliveryMode.customerPresent,
                        color: Colors.green,
                        onTap: () => setState(
                            () => _mode = _DeliveryMode.customerPresent),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _ModeSelector(
                        icon: Icons.person_off_outlined,
                        label: 'Cliente\nausente',
                        isActive: _mode == _DeliveryMode.customerAbsent,
                        color: Colors.orange,
                        onTap: () => setState(
                            () => _mode = _DeliveryMode.customerAbsent),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (_mode == _DeliveryMode.customerPresent) ...[
                  const Text(
                    'Pide al cliente su código de confirmación',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _codeCtrl,
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
                if (_mode == _DeliveryMode.customerAbsent) ...[
                  const Text(
                    'Toma una foto como evidencia de entrega',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: _takePhoto,
                    child: Container(
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                        color: _photoPath != null
                            ? Colors.green.withValues(alpha: 0.05)
                            : Colors.orange.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: _photoPath != null
                              ? Colors.green
                              : Colors.orange.withValues(alpha: 0.5),
                          width: 1.5,
                        ),
                      ),
                      child: _photoPath == null
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
                                  onPressed: _takePhoto,
                                  child: const Text('Cambiar foto'),
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledButton(
                    onPressed: _confirm,
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

class _ModeSelector extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final Color color;
  final VoidCallback onTap;

  const _ModeSelector({
    required this.icon,
    required this.label,
    required this.isActive,
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
          color: isActive ? color.withValues(alpha: 0.1) : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isActive ? color : Colors.grey.shade300,
            width: isActive ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(icon, color: isActive ? color : Colors.grey, size: 28),
            const SizedBox(height: 6),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isActive ? color : Colors.grey,
                fontWeight:
                    isActive ? FontWeight.bold : FontWeight.normal,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}