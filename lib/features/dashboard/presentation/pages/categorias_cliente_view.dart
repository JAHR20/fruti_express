import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/config/router/admin_router.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/carrito/presentation/cubits/carrito_cubit.dart';
import 'package:fruti_express_jahr_admin/features/carrito/presentation/cubits/carrito_state.dart';
import 'package:fruti_express_jahr_admin/features/categorias/presentation/cubits/categoria_cubit.dart';
import 'package:fruti_express_jahr_admin/features/categorias/presentation/cubits/categoria_state.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/widgets/categorias_adaptativas.dart';
import 'package:go_router/go_router.dart';

class CategoriasClienteView extends StatelessWidget {
  const CategoriasClienteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Categorías',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        elevation: 0,
      ),
      body: BlocBuilder<CategoriaCubit, CategoriaState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(
              child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
            ),
            error: (message) => Center(
              child: Text(
                message,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
            loaded: (categorias) {
              if (categorias.isEmpty) {
                // Aquí usamos un ListView vacío para que el usuario igual pueda hacer pull-to-refresh
                // y ver si ya agregaste categorías
                return RefreshIndicator(
                  color: const Color(0xFFF9A826),
                  onRefresh: () async {
                    final authState = context.read<AuthCubit>().state;

                    // Extraemos el perfil (ajusta esto dependiendo de cómo tengas tu estado de Auth)
                    final perfilActual = authState.maybeMap(
                      authenticated: (state) => state.perfil,
                      orElse: () => null,
                    );

                    // 🌟 2. Si tenemos el perfil, disparamos la recarga pasándoselo como argumento
                    if (perfilActual != null) {
                      await context.read<CategoriaCubit>().cargarCategorias(
                        perfilActual,
                      );
                    }
                  },
                  child: ListView(
                    children: const [
                      SizedBox(height: 100),
                      Center(
                        child: Text(
                          'No hay categorías disponibles por el momento.',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                );
              }

              // 🌟 ENVOLVEMOS EL WIDGET PRINCIPAL
              return RefreshIndicator(
                color: const Color(0xFFF9A826), // El color naranja de tu app
                backgroundColor: Colors.white,
                onRefresh: () async {
                  final authState = context.read<AuthCubit>().state;

                  // Extraemos el perfil (ajusta esto dependiendo de cómo tengas tu estado de Auth)
                  final perfilActual = authState.maybeMap(
                    authenticated: (state) => state.perfil,
                    orElse: () => null,
                  );

                  // 🌟 2. Si tenemos el perfil, disparamos la recarga pasándoselo como argumento
                  if (perfilActual != null) {
                    await context.read<CategoriaCubit>().cargarCategorias(
                      perfilActual,
                    );
                  }
                },
                child: CategoriasAdaptativas(
                  categorias: categorias,
                  onTap: (categoria) {
                    final stateCarrito = context.read<CarritoCubit>().state;
                    final sucursalDinamica = stateCarrito.maybeMap(
                      loaded: (s) => s.sucursalId,
                      orElse: () => null,
                    );

                    if (sucursalDinamica != null) {
                      context.push(
                        AppRouter.productosCategoria,
                        extra: {
                          'categoria': categoria,
                          'sucursalId': sucursalDinamica,
                        },
                      );
                    }
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
