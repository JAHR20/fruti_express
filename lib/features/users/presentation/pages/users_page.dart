import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_cubit.dart'; 
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/cubits/users_cubit.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/cubits/users_state.dart';
import '../widgets/user_card.dart'; 

class UsersPage extends StatefulWidget { 
  final Profile currentUser;

  const UsersPage({super.key, required this.currentUser}); 

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

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
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      context.read<UsersCubit>().searchUsers( 
        currentUser: widget.currentUser,
        query: query,
      );
    });
  }

  void _closeSearch() { 
    setState(() {
      _isSearching = false;
      _searchController.clear();
    });
    context.read<UsersCubit>().searchUsers(
      currentUser: widget.currentUser,
      query: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<UsersTab> allowedTabs = [
      if (widget.currentUser.isAdmin) UsersTab.all,
      UsersTab.deliveryPersons,
      UsersTab.customers,
    ];

    return DefaultTabController(
      length: allowedTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: _isSearching
              ? TextField(
                  controller: _searchController,
                  autofocus: true,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    hintText: 'Buscar por nombre o correo...',
                    hintStyle: TextStyle(color: Colors.white70),
                    border: InputBorder.none,
                  ),
                  onChanged: _onSearchChanged,
                )
              : const Text(
                  'Usuarios',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
          backgroundColor: const Color(0xFF1E3A8A),
          foregroundColor: Colors.white,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
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
            onTap: (index) {
              if (_isSearching) _closeSearch();
              _handleTabChange(allowedTabs[index]);
            },
          ),
          actions: [
            if (widget.currentUser.isStaff)
              IconButton(
                icon: Icon(_isSearching ? Icons.close : Icons.search),
                onPressed: () {
                  if (_isSearching) {
                    _closeSearch();
                  } else {
                    setState(() => _isSearching = true);
                  }
                },
              ),
          ],
        ),
        body: BlocConsumer<UsersCubit, UsersState>(
          listenWhen: (previous, current) =>
              previous.errorMessage != current.errorMessage,
          listener: (context, state) {
            if (state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage!),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state.isLoading && state.users.isEmpty) { 
              return const Center(child: CircularProgressIndicator());
            }

            if (state.users.isEmpty) {
              return Center(
                child: Text(
                  state.searchQuery.isNotEmpty
                      ? 'No se encontraron usuarios para "${state.searchQuery}"'
                      : 'No hay usuarios para mostrar.',
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(12),
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
            );
          },
        ),
      ),
    );
  }

  void _handleTabChange(UsersTab selectedTab) { // tabSeleccionado -> selectedTab
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