import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/config/router/admin_router.dart';
import 'package:fruti_express_jahr_admin/core/enums/modo_entrega.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/carrito/presentation/cubits/carrito_cubit.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/presentation/cubits/direcciones_cubit.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/presentation/cubits/direcciones_state.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/presentation/widgets/direccion_card.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/presentation/widgets/formulario_direccion_bottom_sheet.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/cubits/pedido_cubit.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/cubits/pedido_state.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/sucursal_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/features/envios/presentation/cubits/envio_cliente_cubit.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String? _direccionSeleccionadaId;

  @override
  void initState() {
    super.initState();
    final perfil = context.read<AuthCubit>().state.whenOrNull(
      authenticated: (p) => p,
    );
    if (perfil != null) {
      context.read<DireccionesCubit>().cargarDirecciones(perfil.id);
    }
  }

  void _manejarSeleccionDireccion(Direccion direccion) {
    final sucursales = context.read<SucursalCubit>().state.sucursales;

    final configuraciones = context
        .read<EnvioClienteCubit>()
        .state
        .configuraciones;

    final sucursalGanadora = context
        .read<CarritoCubit>()
        .validarCoberturaDireccion(
          direccion: direccion,
          sucursales: sucursales,
          configuraciones: configuraciones,
        );

    if (sucursalGanadora != null) {
      setState(() => _direccionSeleccionadaId = direccion.id);
    } else {
      _mostrarModalPickUp(context, direccion, () {
        setState(() => _direccionSeleccionadaId = direccion.id);
      });
    }
  }

  void _confirmarPedido() {
    if (_direccionSeleccionadaId == null) {
      return _mostrarError('Selecciona una dirección de envío');
    }

    final perfil = context.read<AuthCubit>().state.whenOrNull(
      authenticated: (p) => p,
    );
    if (perfil == null) {
      return _mostrarError('Sesión expirada. Vuelve a iniciar sesión.');
    }

    final estadoCarrito = context.read<CarritoCubit>().state;
    if (estadoCarrito.sucursalId == null) {
      return _mostrarError('Error: No hay sucursal activa o carrito vacío');
    }

    final direccionesState = context.read<DireccionesCubit>().state;
    if (direccionesState.direcciones.isEmpty) return;
    final direcciones = direccionesState.direcciones;

    final direccion = direcciones.firstWhere(
      (d) => d.id == _direccionSeleccionadaId,
    );
    final modoSeleccionado =
        estadoCarrito.modoEntrega ?? ModoEntrega.aDomicilio;

    if (modoSeleccionado != ModoEntrega.pickUp) {
      final sucursales = context.read<SucursalCubit>().state.sucursales;

      final configuraciones = context
          .read<EnvioClienteCubit>()
          .state
          .configuraciones;

      final sucursalGanadora = context
          .read<CarritoCubit>()
          .validarCoberturaDireccion(
            direccion: direccion,
            sucursales: sucursales,
            configuraciones: configuraciones,
          );

      if (sucursalGanadora == null) {
        return _mostrarModalPickUp(context, direccion, () {
          setState(() => _direccionSeleccionadaId = direccion.id);
        });
      }
    }

    final subtotal = estadoCarrito.items.fold<int>(
      0,
      (suma, item) => suma + (item.cantidad * item.precioUnitario),
    );

    context.read<PedidoCubit>().crearDesdeCarrito(
      items: estadoCarrito.items,
      direccion: direccion,
      perfil: perfil,
      subtotal: subtotal,
      sucursalId: estadoCarrito.sucursalId!,
      modoEntrega: modoSeleccionado,
    );
  }

  void _autoSeleccionarDireccion(List<Direccion> direcciones) {
    if (_direccionSeleccionadaId != null || direcciones.isEmpty) return;
    setState(() {
      _direccionSeleccionadaId =
          direcciones
              .where((d) => d.esPrincipal)
              .map((d) => d.id)
              .firstOrNull ??
          direcciones.first.id;
    });
  }

  void _mostrarError(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje), backgroundColor: Colors.red),
    );
  }

  void _abrirFormularioDireccion(BuildContext context) {
    final cubit = context.read<DireccionesCubit>();
    final perfil = context.read<AuthCubit>().state.whenOrNull(
      authenticated: (p) => p,
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: FormularioDireccionBottomSheet(usuarioId: perfil?.id ?? ''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PedidoCubit, PedidoState>(
      listener: (context, state) {
        state.maybeWhen(
          procesando: () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ),
          esperandoPago: (pedidoCreado) {
            Navigator.of(context).pop(); 
            context.read<CarritoCubit>().vaciarCarrito();
            context.go(
              AppRouter.pedidoExitoso,
              extra: pedidoCreado,
            ); 
          },
          error: (mensaje) {
            Navigator.of(context).pop();
            _mostrarError(mensaje);
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          title: const Text(
            'Confirmar Pedido',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xFF1E3A8A),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: BlocBuilder<DireccionesCubit, DireccionesState>(
          builder: (context, state) {
            if (state.isLoading && state.direcciones.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
              );
            }

            if (state.errorMessage != null && state.direcciones.isEmpty) {
              return Center(
                child: Text(
                  state.errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            if (state.direcciones.isEmpty) {
              return _VistaSinDirecciones(
                onAgregar: () => _abrirFormularioDireccion(context),
              );
            }

            WidgetsBinding.instance.addPostFrameCallback(
              (_) => _autoSeleccionarDireccion(state.direcciones),
            );

            return ListView(
              padding: const EdgeInsets.all(24.0),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Dirección de entrega',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () => _abrirFormularioDireccion(context),
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text('Nueva'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ...state.direcciones.map(
                  (direccion) => DireccionCard(
                    direccion: direccion,
                    estaSeleccionada: direccion.id == _direccionSeleccionadaId,
                    onTap: () => _manejarSeleccionDireccion(direccion),
                  ),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: _BotonConfirmarPedido(
          habilitado: _direccionSeleccionadaId != null,
          onPressed: _confirmarPedido,
        ),
      ),
    );
  }
}


class _VistaSinDirecciones extends StatelessWidget {
  final VoidCallback onAgregar;
  const _VistaSinDirecciones({required this.onAgregar});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_off_outlined,
              size: 80,
              color: Colors.grey.shade300,
            ),
            const SizedBox(height: 16),
            const Text(
              '¿A dónde lo enviamos?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Agrega una dirección para recibir tu pedido.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF9A826),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: onAgregar,
              icon: const Icon(Icons.add_location_alt_outlined),
              label: const Text('Agregar Dirección'),
            ),
          ],
        ),
      ),
    );
  }
}

class _BotonConfirmarPedido extends StatelessWidget {
  final bool habilitado;
  final VoidCallback onPressed;
  const _BotonConfirmarPedido({
    required this.habilitado,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E3A8A),
              disabledBackgroundColor: Colors.grey.shade300,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: habilitado ? onPressed : null,
            child: const Text(
              'Confirmar Pedido',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _mostrarModalPickUp(
  BuildContext context,
  Direccion direccion,
  VoidCallback onSeleccionada,
) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (ctx) => Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.storefront, size: 60, color: Colors.orange.shade400),
          const SizedBox(height: 16),
          const Text(
            '¡Estás un poco lejos! 🛵',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Por el momento nuestros repartidores no llegan a esta dirección. ¿Qué te gustaría hacer?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF9A826),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                context.read<CarritoCubit>().establecerModoEntrega(
                  ModoEntrega.pickUp,
                );
                onSeleccionada();
                Navigator.pop(ctx);
              },
              child: const Text(
                'Pasar a recoger a sucursal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text(
                'Elegir otra dirección de envío',
                style: TextStyle(
                  color: Color(0xFF1E3A8A),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
