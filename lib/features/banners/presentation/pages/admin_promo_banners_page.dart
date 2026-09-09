import 'package:flutter/material.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/widgets/confirm_dialog.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/promo_banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/cubits/promo_banner_cubit.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/cubits/promo_banner_state.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/widgets/promo_banner_form_dialog.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/widgets/promo_banner_card.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart'; 

class AdminPromoBannersPage extends StatefulWidget {
  const AdminPromoBannersPage({super.key});

  @override
  State<AdminPromoBannersPage> createState() => _AdminPromoBannersPageState();
}

class _AdminPromoBannersPageState extends State<AdminPromoBannersPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authState = context.read<AuthCubit>().state;
      if (authState is AuthAuthenticated) {
        context.read<PromoBannerCubit>().loadAllBanners(
          currentUser: authState.profile,
        );
      }
    });
  }

  void _showFormModal(Profile currentUser, {PromoBanner? banner}) { 
    final bannerCubit = context.read<PromoBannerCubit>();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return BlocProvider.value(
          value: bannerCubit,
          child: BlocConsumer<PromoBannerCubit, PromoBannerState>(
            listenWhen: (previous, current) =>
                previous.operationError != current.operationError ||
                previous.isOperationSuccessful != current.isOperationSuccessful,
            listener: (ctx, state) {
              if (state.operationError != null) {
                ScaffoldMessenger.of(ctx).showSnackBar(
                  SnackBar(
                    content: Text(state.operationError!),
                    backgroundColor: Colors.red,
                  ),
                );
              }

              if (state.isOperationSuccessful) {
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
              return PromoBannerFormDialog(
                bannerToEdit: banner,
                isSaving: state.isLoading || state.processingBannerId != null,
                onSave: (
                  title,
                  discount,
                  subtitle,
                  startColor,
                  endColor,
                  sortOrder,
                  image,
                ) {
                  final generatedBanner = PromoBanner( 
                    id: banner?.id ?? '',
                    title: title,
                    discount: discount,
                    subtitle: subtitle,
                    startColor: startColor,
                    endColor: endColor,
                    sortOrder: sortOrder,
                    isActive: banner?.isActive ?? true,
                    imageUrl: banner?.imageUrl,
                    createdAt: banner?.createdAt ?? DateTime.now(),
                  );

                  if (banner == null) {
                    ctx.read<PromoBannerCubit>().createBanner(
                      currentUser: currentUser,
                      banner: generatedBanner,
                      imageFile: image,
                    );
                  } else {
                    ctx.read<PromoBannerCubit>().updateBanner(
                      currentUser: currentUser,
                      banner: generatedBanner,
                      imageFile: image,
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

  void _confirmDeletion( 
    BuildContext context,
    PromoBanner banner,
    Profile currentUser,
  ) {
    showDialog(
      context: context,
      builder: (dialogContext) => ConfirmDialog(
        title: '¿Eliminar Banner?', 
        message: 
            '¿Estás seguro de eliminar la promoción "${banner.title}"? Esta acción no se puede deshacer.',
        confirmText: 'Eliminar',
        confirmColor: Colors.red, 
        onConfirm: () { 
          context.read<PromoBannerCubit>().deleteBanner(
            currentUser: currentUser,
            id: banner.id,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthCubit>().state as AuthAuthenticated;
    final currentUser = authState.profile;

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
        onPressed: () => _showFormModal(currentUser),
      ),
      body: BlocBuilder<PromoBannerCubit, PromoBannerState>(
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

              return PromoBannerCard(
                banner: banner,
                onStatusChanged: (newStatus) { 
                  context.read<PromoBannerCubit>().changeBannerStatus(
                    currentUser: currentUser,
                    id: banner.id,
                    isActive: newStatus,
                  );
                },
                onEdit: () =>
                    _showFormModal(currentUser, banner: banner),
                onDelete: () =>
                    _confirmDeletion(context, banner, currentUser),
              );
            },
          );
        },
      ),
    );
  }
}