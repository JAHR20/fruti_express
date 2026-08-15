import 'package:flutter/material.dart' hide Banner;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/widgets/confirm_dialog.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/cubits/banner_cubit.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/cubits/banner_state.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/widgets/banner_form_dialog.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/widgets/tarjeta_banner.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

class AdminBannersPage extends StatefulWidget {
  const AdminBannersPage({super.key});

  @override
  State<AdminBannersPage> createState() => _AdminBannersPageState();
}

class _AdminBannersPageState extends State<AdminBannersPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authState = context.read<AuthCubit>().state;
      if (authState is AuthAuthenticated) {
        context.read<BannerCubit>().cargarTodosLosBanners(
          usuarioActual: authState.perfil,
        );
      }
    });
  }

  void _mostrarModalFormulario(Perfil usuarioActual, {Banner? banner}) {
    final bannerCubit = context.read<BannerCubit>();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return BlocProvider.value(
          value: bannerCubit,
          child: BlocConsumer<BannerCubit, BannerState>(
            listenWhen: (previous, current) =>
                previous.operacionError != current.operacionError ||
                previous.operacionExitosa != current.operacionExitosa,
            listener: (ctx, state) {
              if (state.operacionError != null) {
                ScaffoldMessenger.of(ctx).showSnackBar(
                  SnackBar(
                    content: Text(state.operacionError!),
                    backgroundColor: Colors.red,
                  ),
                );
              }

              if (state.operacionExitosa) {
                Navigator.of(dialogContext).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      banner == null
                          ? 'Banner creado con éxito'
                          : 'Banner actualizado',
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
            builder: (ctx, state) {
              return BannerFormDialog(
                bannerAEditar: banner,
                guardando: state.isLoading || state.bannerProcesandoId != null,
                onGuardar:
                    (
                      titulo,
                      descuento,
                      subtitulo,
                      colorInicio,
                      colorFin,
                      orden,
                      imagen,
                    ) {
                      final bannerGenerado = Banner(
                        id: banner?.id ?? '',
                        titulo: titulo,
                        descuento: descuento,
                        subtitulo: subtitulo,
                        colorInicio: colorInicio,
                        colorFin: colorFin,
                        orden: orden,
                        activo: banner?.activo ?? true,
                        imagenUrl: banner?.imagenUrl,
                        fechaCreacion: banner?.fechaCreacion ?? DateTime.now(),
                      );

                      if (banner == null) {
                        ctx.read<BannerCubit>().crearBanner(
                          usuarioActual: usuarioActual,
                          banner: bannerGenerado,
                          imagenArchivo: imagen,
                        );
                      } else {
                        ctx.read<BannerCubit>().actualizarBanner(
                          usuarioActual: usuarioActual,
                          banner: bannerGenerado,
                          imagenArchivo: imagen,
                        );
                      }
                    },
              );
            },
          ),
        );
      },
    );
  }

  void _confirmarEliminacion(
    BuildContext context,
    Banner banner,
    Perfil usuarioActual,
  ) {
    showDialog(
      context: context,
      builder: (dialogContext) => ConfirmDialog(
        titulo: '¿Eliminar Banner?',
        mensaje:
            '¿Estás seguro de eliminar la promoción "${banner.titulo}"? Esta acción no se puede deshacer.',
        textoConfirmar: 'Eliminar',
        colorConfirmar: Colors.red,
        onConfirmar: () {
          context.read<BannerCubit>().eliminarBanner(
            usuarioActual: usuarioActual,
            id: banner.id,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthCubit>().state as AuthAuthenticated;
    final usuarioActual = authState.perfil;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Gestión de Banners',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Nuevo Banner'),
        onPressed: () => _mostrarModalFormulario(usuarioActual),
      ),
      body: BlocBuilder<BannerCubit, BannerState>(
        builder: (context, state) {
          if (state.isLoading && state.banners.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
            );
          }

          if (state.errorMessage != null && state.banners.isEmpty) {
            return Center(
              child: Text(
                state.errorMessage!,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          }

          if (state.banners.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.view_carousel_outlined,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No hay banners activos.\n¡Crea tu primera promoción!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: 80,
            ),
            itemCount: state.banners.length,
            itemBuilder: (context, index) {
              final banner = state.banners[index];

              return TarjetaBanner(
                banner: banner,
                onEstadoCambiado: (nuevoEstado) {
                  context.read<BannerCubit>().cambiarEstadoBanner(
                    usuarioActual: usuarioActual,
                    id: banner.id,
                    activo: nuevoEstado,
                  );
                },
                onEditar: () =>
                    _mostrarModalFormulario(usuarioActual, banner: banner),
                onEliminar: () =>
                    _confirmarEliminacion(context, banner, usuarioActual),
              );
            },
          );
        },
      ),
    );
  }
}
