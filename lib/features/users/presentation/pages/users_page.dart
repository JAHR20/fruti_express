import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/widgets/animated_empty_state.dart';
import 'package:fruti_express_jahr_admin/core/widgets/app_search_bar.dart';
import 'package:fruti_express_jahr_admin/core/widgets/pill_tab_bar.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_cubit.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/cubits/users_cubit.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/cubits/users_state.dart';
import '../widgets/user_card.dart';

class UsersPage extends StatefulWidget {
  final AppUser currentUser;
  const UsersPage({super.key, required this.currentUser});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    super.initState();
    if (widget.currentUser.isAdmin) {
      context.read<UsersCubit>().loadUsers(widget.currentUser);
    } else {
      context.read<UsersCubit>().loadCustomers(widget.currentUser);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final List<UsersTab> allowedTabs = [
      if (widget.currentUser.isAdmin) UsersTab.all,
      UsersTab.deliveryPersons,
      UsersTab.customers,
    ];

    // Helper seguro para refrescar datos (evita warnings de BuildContext post-await)
    Future<void> handleRefresh() async {
      final usersCubit = context.read<UsersCubit>();
      if (widget.currentUser.isAdmin) {
        await usersCubit.loadUsers(widget.currentUser);
      } else {
        await usersCubit.loadCustomers(widget.currentUser);
      }
    }

    return DefaultTabController(
      length: allowedTabs.length,
      child: Column(
        children: [
          PillTabBar(
            tabs: allowedTabs.map((tab) {
              switch (tab) {
                case UsersTab.all:
                  return const Tab(text: 'Todos');
                case UsersTab.deliveryPersons:
                  return const Tab(text: 'Repartidores');
                case UsersTab.customers:
                  return const Tab(text: 'Clientes');
              }
            }).toList(),
            onTap: (index) => _handleTabChange(allowedTabs[index]),
          ),

          if (widget.currentUser.isStaff)
            AppSearchBar(
              hintText: 'Buscar por nombre o correo...',
              debounceDuration: const Duration(milliseconds: 1000),
              onChanged: (query) {
                context.read<UsersCubit>().searchUsers(
                  currentUser: widget.currentUser,
                  query: query,
                );
              },
            ),

          Expanded(
            child: BlocConsumer<UsersCubit, UsersState>(
              listenWhen: (previous, current) =>
                  previous.errorMessage != current.errorMessage,
              listener: (context, state) {
                if (state.errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.errorMessage!,
                        style: TextStyle(color: colorScheme.onError),
                      ),
                      backgroundColor: colorScheme.error,
                    ),
                  );
                }
              },
              builder: (context, state) {
                // 1. CARGA INICIAL
                if (state.isLoading && state.users.isEmpty) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: colorScheme.secondary,
                    ),
                  );
                }

                // 2. ERROR GLOBAL (Ahora scrolleable)
                if (state.errorMessage != null && state.users.isEmpty) {
                  return RefreshIndicator(
                    color: colorScheme.primary,
                    onRefresh: handleRefresh,
                    child: CustomScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(
                            child: Text(
                              state.errorMessage!,
                              style: TextStyle(color: colorScheme.error),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                // 3. ESTADO VACÍO (Ahora scrolleable con RefreshIndicator)
                if (state.users.isEmpty) {
                  return RefreshIndicator(
                    color: colorScheme.primary,
                    onRefresh: handleRefresh,
                    child: const CustomScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: AnimatedEmptyState(
                            icon: Icon(Icons.person, size: 64),
                            title: 'Sin usuarios',
                            subtitle:
                                'Aún no hay usuarios registrados\nen el sistema',
                          ),
                        ),
                      ],
                    ),
                  );
                }

                // 4. LISTA CON DATOS (Usando CustomScrollView + SliverList)
                return RefreshIndicator(
                  color: colorScheme.primary,
                  onRefresh: handleRefresh,
                  child: CustomScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.all(12),
                        sliver: SliverList.builder(
                          itemCount: state.users.length,
                          itemBuilder: (context, index) {
                            final targetUser = state.users[index];
                            return UserCard(
                              targetUser: targetUser,
                              currentUser: widget.currentUser,
                              branchCubit: context.read<BranchCubit>(),
                              isProcessing: state.processingUserId == targetUser.id,
                              onStatusChanged: (newStatus) {
                                context.read<UsersCubit>().changeUserStatus(
                                  currentUser: widget.currentUser,
                                  targetUserId: targetUser.id,
                                  activate: newStatus,
                                );
                              },
                              onRoleChanged: (newRole, branchId) {
                                context.read<UsersCubit>().changeRole(
                                  currentUser: widget.currentUser,
                                  targetUserId: targetUser.id,
                                  newRole: newRole,
                                  assignedBranchId: branchId,
                                );
                              },
                            );
                          },
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
  }

  void _handleTabChange(UsersTab selectedTab) {
    final cubit = context.read<UsersCubit>();
    switch (selectedTab) {
      case UsersTab.all:
        cubit.loadUsers(widget.currentUser);
        break;
      case UsersTab.deliveryPersons:
        cubit.loadDeliveryPersons(currentUser: widget.currentUser);
        break;
      case UsersTab.customers:
        cubit.loadCustomers(widget.currentUser);
        break;
    }
  }
}