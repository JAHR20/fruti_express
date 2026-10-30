import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/widgets/animated_empty_state.dart';
import 'package:fruti_express_jahr_admin/core/widgets/confirm_dialog.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_cubit.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_state.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/router/branch_routes.dart';
import 'package:go_router/go_router.dart';
import '../widgets/branch_list_tile.dart';

class AdminBranchesPage extends StatefulWidget {
  const AdminBranchesPage({super.key});

  @override
  State<AdminBranchesPage> createState() => _AdminBranchesPageState();
}

class _AdminBranchesPageState extends State<AdminBranchesPage> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    context.read<BranchCubit>().loadBranches();
  }

  void _openCreationWizard() async {
    await context.pushNamed(BranchRoutes.newBranchName);
    _loadData();
  }

  void _openEditionWizard(Branch branch, int initialStep) async {
    await context.pushNamed(
      BranchRoutes.newBranchName,
      extra: {'branch': branch, 'initialStep': initialStep},
    );
    _loadData();
  }

  void _openRatesScreen(String branchId) {
    context.pushNamed(BranchRoutes.ratesName, pathParameters: {'id': branchId});
  }

  void _showStatusDialog(BuildContext context, Branch branch) {
    final authState = context.read<AuthCubit>().state;
    if (authState is! AuthAuthenticated) return;

    final profile = authState.user;
    final bool activate = !branch.active;
    final colorScheme = Theme.of(context).colorScheme;

    showDialog(
      context: context,
      builder: (dialogContext) => ConfirmDialog(
        title: activate
            ? '¿Activar "${branch.name}"?'
            : '¿Desactivar "${branch.name}"?',
        message: activate
            ? 'La sucursal volverá a estar operativa y visible.'
            : 'Esta sucursal se marcará como inactiva temporalmente.',
        confirmText: activate ? 'Activar' : 'Desactivar',
        confirmColor: activate ? colorScheme.primary : colorScheme.error,
        onConfirm: () {
          context.read<BranchCubit>().changeBranchStatus(
            currentUser: profile,
            branchId: branch.id,
            newState: activate,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLowest,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        icon: const Icon(Icons.add, size: 20),
        label: const Text(
          'Nueva Sucursal',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        onPressed: () => _openCreationWizard(),
      ),
      body: BlocConsumer<BranchCubit, BranchState>(
        listenWhen: (previous, current) =>
            previous.errorMessage != current.errorMessage,
        listener: (context, state) {
          if (state.errorMessage != null &&
              ModalRoute.of(context)?.isCurrent == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: colorScheme.error,
              ),
            );
          }
        },
        builder: (context, state) {
          // 1. CARGA INICIAL
          if (state.isLoading && state.branches.isEmpty) {
            return Center(
              child: CircularProgressIndicator(color: colorScheme.primary),
            );
          }

          // 2. ERROR GLOBAL
          if (state.errorMessage != null && state.branches.isEmpty) {
            return Center(
              child: Text(
                'Error: ${state.errorMessage}',
                style: TextStyle(color: colorScheme.error),
              ),
            );
          }

          return RefreshIndicator(
            color: colorScheme.primary,
            onRefresh: () async {
              await context.read<BranchCubit>().loadBranches();
            },
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                // CASO A: ESTADO VACÍO
                if (state.branches.isEmpty)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: AnimatedEmptyState(
                      icon: Icon(Icons.storefront_outlined),
                      title: 'No hay sucursales',
                      subtitle:
                          'Aún no hay sucursales registradas en el sistema.',
                    ),
                  )
                // CASO B: LISTA DE SUCURSALES
                else
                  SliverPadding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      left: 16.0,
                      right: 16.0,
                      bottom: 80.0,
                    ),
                    sliver: SliverList.builder(
                      itemCount: state.branches.length,
                      itemBuilder: (context, index) {
                        final branch = state.branches[index];
                        final hasShippingConfigured = state
                            .branchesWithShippingConfigured
                            .contains(branch.id);
                        final hasRatesConfigured = state
                            .branchesWithRatesConfigured
                            .contains(branch.id);

                        final isFullyConfigured =
                            hasShippingConfigured && hasRatesConfigured;

                        return Card(
                          margin: const EdgeInsets.only(bottom: 24.0),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(
                              color: colorScheme.outlineVariant,
                              width: 1,
                            ),
                          ),
                          color: colorScheme.surface,
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              BranchListTile(
                                branch: branch,
                                onEdit: () => _openEditionWizard(branch, 0),
                                onChangeStatus: () =>
                                    _showStatusDialog(context, branch),
                              ),

                              Divider(
                                height: 1,
                                thickness: 1,
                                color: colorScheme.outlineVariant,
                              ),

                              if (!isFullyConfigured) ...[
                                Container(
                                  color: colorScheme.secondaryContainer,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.warning_amber_rounded,
                                        color: colorScheme.onSecondaryContainer,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          !hasShippingConfigured
                                              ? 'Falta configurar cobertura y envío'
                                              : 'Falta configurar precios de envío (Rates)',
                                          style: TextStyle(
                                            color: colorScheme
                                                .onSecondaryContainer,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          if (!hasShippingConfigured) {
                                            _openEditionWizard(branch, 1);
                                          } else {
                                            _openRatesScreen(
                                              branch.id,
                                            ); 
                                          }
                                        },
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          minimumSize: const Size(0, 0),
                                          foregroundColor:
                                              colorScheme.onSecondaryContainer,
                                        ),
                                        child: const Text('Completar'),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: colorScheme.outlineVariant,
                                ),
                              ],

                              Container(
                                color: colorScheme.surface,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: Column(
                                  children: [
                                    TextButton.icon(
                                      onPressed: () =>
                                          _openRatesScreen(branch.id),
                                      icon: Icon(
                                        Icons.two_wheeler,
                                        color: colorScheme.tertiary,
                                        size: 20,
                                      ),
                                      label: Text(
                                        'Configurar Precios de Envío',
                                        style: TextStyle(
                                          color: colorScheme.tertiary,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 40.0,
                                      ),
                                      child: Divider(
                                        height: 1,
                                        color: colorScheme.outlineVariant,
                                        thickness: 1,
                                      ),
                                    ),

                                    TextButton.icon(
                                      onPressed: () =>
                                          _openEditionWizard(branch, 1),
                                      icon: Icon(
                                        Icons.map_outlined,
                                        color: colorScheme.secondary,
                                        size: 20,
                                      ),
                                      label: Text(
                                        'Configurar Cobertura (Mapa y C.P.)',
                                        style: TextStyle(
                                          color: colorScheme.secondary,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
