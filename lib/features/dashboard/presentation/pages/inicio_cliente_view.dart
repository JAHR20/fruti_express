import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/core/enums/modo_entrega.dart';
import 'package:fruti_express_jahr_admin/features/carrito/presentation/cubits/carrito_cubit.dart';
import 'package:fruti_express_jahr_admin/features/carrito/presentation/cubits/carrito_state.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/presentation/cubits/direcciones_cubit.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/presentation/cubits/direcciones_state.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/presentation/widgets/direccion_card.dart';

// 🌟 IMPORTAMOS EL COORDINADOR Y SU ESTADO
import 'package:fruti_express_jahr_admin/features/envios/presentation/cubits/coordinador_cliente_cubit.dart';
import 'package:fruti_express_jahr_admin/features/envios/presentation/cubits/coordinador_cliente_state.dart';

import 'package:fruti_express_jahr_admin/features/dashboard/presentation/widgets/barra_busqueda.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/widgets/carrusel_ofertas.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/widgets/categorias_rapidas.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/widgets/cuadricula_productos.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

class InicioClienteView extends StatefulWidget {
  const InicioClienteView({super.key});

  @override
  State<InicioClienteView> createState() => _InicioClienteViewState();
}

class _InicioClienteViewState extends State<InicioClienteView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authState = context.read<AuthCubit>().state;
      if (authState is AuthAuthenticated) {
        context.read<DireccionesCubit>().cargarDirecciones(authState.perfil.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final perfilUsuario = context.select<AuthCubit, Perfil?>(
      (cubit) => cubit.state is AuthAuthenticated
          ? (cubit.state as AuthAuthenticated).perfil
          : null,
    );
    final carritoState = context.watch<CarritoCubit>().state;

    final direccionActual = carritoState.maybeMap(
      loaded: (s) => s.direccionSeleccionada,
      orElse: () => null,
    );
    final modoEntrega = carritoState.maybeMap(
      loaded: (s) => s.modoEntrega,
      orElse: () => null,
    );

    String textoUbicacion = modoEntrega == ModoEntrega.pickUp
        ? 'Recoger en Sucursal'
        : (direccionActual?.alias ?? 'Seleccionar dirección');
    IconData iconoUbicacion = modoEntrega == ModoEntrega.pickUp
        ? Icons.storefront
        : Icons.location_on;

    return MultiBlocListener(
      listeners: [
        BlocListener<CoordinadorClienteCubit, CoordinadorClienteState>(
          listener: (context, state) {
            state.maybeWhen(
              procesando: () {},
              cambioExitoso: (sucursal, fueAutomatico) {
                if (!fueAutomatico) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ubicación actualizada'), backgroundColor: Colors.green),
                  );
                }
              },
              sinCobertura: (direccion) {
                _mostrarModalPickUpInicio(context, direccion);
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          if (perfilUsuario != null) {
                            context.read<DireccionesCubit>().cargarDirecciones(
                              perfilUsuario.id,
                            );
                          }
                          _abrirSelectorDirecciones(context);
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xFF4DB6AC),
                              child: Icon(iconoUbicacion, color: Colors.white),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Entregar a',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          textoUbicacion,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Color(0xFF1E3A8A),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 18,
                                        color: Color(0xFF1E3A8A),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.red[50],
                      child: const Icon(
                        Icons.notifications_none,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const BarraBusqueda(),
              const CarruselOfertas(),
              const CategoriasRapidas(),
              const SizedBox(height: 16),
              const CuadriculaProductos(),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  // 🌟 MODAL ULTRA LIMPIO
  void _abrirSelectorDirecciones(BuildContext context) {
    // Ya no necesitamos pedirle a la vista que lea las sucursales ni configuraciones
    final coordinador = context.read<CoordinadorClienteCubit>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (modalContext) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          maxChildSize: 0.9,
          minChildSize: 0.4,
          expand: false,
          builder: (_, controller) {
            return BlocBuilder<DireccionesCubit, DireccionesState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const Center(
                    child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
                  ),
                  loaded: (direcciones) {
                    if (direcciones.isEmpty) {
                      return const Center(
                        child: Text('No tienes direcciones guardadas.'),
                      );
                    }
                    return Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Mis Direcciones',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            controller: controller,
                            itemCount: direcciones.length,
                            itemBuilder: (context, index) {
                              final direccion = direcciones[index];
                              return DireccionCard(
                                direccion: direccion,
                                estaSeleccionada: context
                                    .read<CarritoCubit>()
                                    .state
                                    .maybeMap(
                                      loaded: (s) =>
                                          s.direccionSeleccionada?.id ==
                                          direccion.id,
                                      orElse: () => false,
                                    ),
                                onTap: () {
                                  Navigator.pop(modalContext);
                                  // 🌟 100% DESACOPLADO. La vista solo dice "Cambia a esta dirección"
                                  coordinador.cambiarDireccionManual(direccion);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                  orElse: () => const SizedBox.shrink(),
                );
              },
            );
          },
        );
      },
    );
  }

  // 🌟 RESTAURAMOS EL MODAL DE PICKUP QUE SE HABÍA BORRADO
  void _mostrarModalPickUpInicio(BuildContext context, Direccion direccion) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (modalContext) {
        return Padding(
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
                    context.read<CoordinadorClienteCubit>().confirmarPickup(
                      direccion,
                    );
                    Navigator.pop(modalContext);
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
                  onPressed: () {
                    Navigator.pop(modalContext);
                    _abrirSelectorDirecciones(context);
                  },
                  child: const Text(
                    'Elegir otra dirección',
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
        );
      },
    );
  }
}
