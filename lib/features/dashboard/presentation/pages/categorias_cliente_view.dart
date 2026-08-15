import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/config/router/admin_router.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/carrito/presentation/cubits/carrito_cubit.dart';
import 'package:fruti_express_jahr_admin/features/categorias/presentation/cubits/categoria_cubit.dart';
import 'package:fruti_express_jahr_admin/features/categorias/presentation/cubits/categoria_state.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/widgets/categorias_adaptativas.dart';
import 'package:go_router/go_router.dart';

class CategoriasClienteView extends StatelessWidget {
  const CategoriasClienteView({super.key});

  Future<void> _recargar(BuildContext context) async {
    final authState = context.read<AuthCubit>().state;

    final perfilActual = authState.maybeMap(
      authenticated: (state) => state.perfil,
      orElse: () => null,
    );

    if (perfilActual != null) {
      await context.read<CategoriaCubit>().cargarCategorias(perfilActual);
    }
  }

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
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
            );
          }

          if (state.errorMessage != null) {
            return Center(
              child: Text(
                state.errorMessage!,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          }

          if (state.categorias.isEmpty) {
            return RefreshIndicator(
              color: const Color(0xFFF9A826),
              onRefresh: () => _recargar(context),
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

          return RefreshIndicator(
            color: const Color(0xFFF9A826),
            backgroundColor: Colors.white,
            onRefresh: () => _recargar(context),
            child: CategoriasAdaptativas(
              categorias: state.categorias,
              onTap: (categoria) {
                final stateCarrito = context.read<CarritoCubit>().state;
                final sucursalDinamica = stateCarrito.sucursalId;

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
      ),
    );
  }
}
