import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  context.pushNamed(
    BranchRoutes.ratesName,
    pathParameters: {
      'id': branchId,
    },
  );
}

  void _showStatusDialog(BuildContext context, Branch branch) { 
    final authState = context.read<AuthCubit>().state;
    if (authState is! AuthAuthenticated) return;

    final profile = authState.profile; 
    final bool activate = !branch.active; 

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
        confirmColor: activate ? Colors.green : Colors.red,
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Sucursales'),
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Nueva Sucursal'),
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
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading && state.branches.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
            );
          }

          if (state.errorMessage != null && state.branches.isEmpty) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          }

          final list = state.branches; // lista -> list
          if (list.isEmpty) {
            return const Center(child: Text('No hay sucursales registradas.'));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final branch = list[index];
                final hasShippingConfigured = state
                    .branchesWithShippingConfigured
                    .contains(branch.id);
                    
                return Column(
                  children: [
                    BranchListTile(
                      branch: branch,
                      onEdit: () => _openEditionWizard(branch, 0),
                      onChangeStatus: () =>
                          _showStatusDialog(context, branch),
                    ),

                    if (!hasShippingConfigured)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.warning_amber_rounded,
                              color: Colors.orange,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Text(
                                'Falta configurar cobertura y envío',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () => _openEditionWizard(branch, 1),
                              child: const Text('Completar'),
                            ),
                          ],
                        ),
                      ),

                    TextButton.icon(
                      onPressed: () => _openRatesScreen(branch.id),
                      icon: const Icon(Icons.two_wheeler, color: Colors.green),
                      label: const Text(
                        'Configurar Precios de Envío',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                    const Divider(),
                    TextButton.icon(
                      onPressed: () => _openEditionWizard(branch, 1),
                      icon: const Icon(Icons.map, color: Colors.blue),
                      label: const Text(
                        'Configurar Cobertura (Mapa y C.P.)',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}