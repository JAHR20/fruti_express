import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/widgets/animated_empty_state.dart';
import 'package:fruti_express_jahr_admin/core/widgets/confirm_dialog.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/promo_banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/cubits/promo_banner_cubit.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/cubits/promo_banner_state.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/widgets/promo_banner_form_bottom_sheet.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/widgets/promo_banner_card.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';

class AdminPromoBannersPage extends StatefulWidget {
  const AdminPromoBannersPage({super.key});

  @override
  State<AdminPromoBannersPage> createState() => _AdminPromoBannersPageState();
}

class _AdminPromoBannersPageState extends State<AdminPromoBannersPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _bottomSheetController;

  @override
  void initState() {
    super.initState();
    _bottomSheetController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final authState = context.read<AuthCubit>().state;
      if (authState is! AuthAuthenticated) return;

      context.read<PromoBannerCubit>().loadAllBanners(
        currentUser: authState.user,
      );
    });
  }

  @override
  void dispose() {
    _bottomSheetController.dispose();
    super.dispose();
  }

  void _showFormModal(AppUser currentUser, {PromoBanner? banner}) {
    final bannerCubit = context.read<PromoBannerCubit>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      transitionAnimationController: _bottomSheetController,
      builder: (dialogContext) {
        return BlocProvider.value(
          value: bannerCubit,
          child: BlocConsumer<PromoBannerCubit, PromoBannerState>(
            listenWhen: (previous, current) =>
                previous.operationError != current.operationError ||
                previous.isOperationSuccessful != current.isOperationSuccessful,
            listener: (ctx, state) {
              final colors = Theme.of(ctx).colorScheme;

              if (state.operationError != null) {
                ScaffoldMessenger.of(ctx).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.operationError!,
                      style: TextStyle(color: colors.onError),
                    ),
                    backgroundColor: colors.error,
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
                      style: TextStyle(color: colors.onPrimary),
                    ),
                    backgroundColor: colors.primary,
                  ),
                );
              }
            },
            builder: (ctx, state) {
              return PromoBannerFormBottomSheet(
                bannerToEdit: banner,
                isSaving: state.isLoading || state.processingBannerId != null,
                onSave:
                    (
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
    AppUser currentUser,
  ) {
    final colors = Theme.of(context).colorScheme;

    showDialog(
      context: context,
      builder: (dialogContext) => ConfirmDialog(
        title: '¿Eliminar Banner?',
        message:
            '¿Estás seguro de eliminar la promoción "${banner.title}"? Esta acción no se puede deshacer.',
        confirmText: 'Eliminar',
        confirmColor: colors.error,
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
    final authState = context.watch<AuthCubit>().state;

    if (authState is! AuthAuthenticated) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final currentUser = authState.user;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
        icon: const Icon(Icons.add),
        label: const Text('Nuevo Banner'),
        onPressed: () => _showFormModal(currentUser),
      ),
      body: BlocBuilder<PromoBannerCubit, PromoBannerState>(
        builder: (context, state) {
          // 1. CARGA INICIAL
          if (state.isLoading && state.banners.isEmpty) {
            return Center(
              child: CircularProgressIndicator(color: colors.primary),
            );
          }

          // 2. ERROR GLOBAL
          if (state.errorMessage != null && state.banners.isEmpty) {
            return Center(
              child: Text(
                state.errorMessage!,
                style: TextStyle(color: colors.error, fontSize: 16),
              ),
            );
          }

          // 3. REFRESH INDICATOR ENVOLVIENDO TANTO ESTADO VACÍO COMO LISTA
          return RefreshIndicator(
            onRefresh: () async {
              await context.read<PromoBannerCubit>().loadAllBanners(
                currentUser: currentUser,
              );
            },
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(), // 👈 Obligatorio
              slivers: [
                // CASO A: ESTADO VACÍO
                if (state.banners.isEmpty)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: AnimatedEmptyState(
                      icon: Icon(Icons.note_add_outlined),
                      title: 'No hay banners',
                      subtitle:
                          'Aún no hay banners promocionales disponibles en el sistema.',
                    ),
                  )
                // CASO B: LISTA DE BANNERS
                else
                  SliverPadding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 16,
                      right: 16,
                      bottom: 80,
                    ),
                    sliver: SliverList.builder(
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
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
