import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/coupons/presentation/widgets/coupon_tile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import '../../domain/entities/coupon.dart';
import '../cubits/coupon_cubit.dart';
import '../cubits/coupon_state.dart';
import '../widgets/coupon_form.dart';

class AdminCouponsPage extends StatefulWidget {
  const AdminCouponsPage({super.key});

  @override
  State<AdminCouponsPage> createState() => _AdminCouponsPageState();
}

class _AdminCouponsPageState extends State<AdminCouponsPage> {
  late Profile _currentUser;

  @override
  void initState() {
    super.initState();
    
    final authState = context.read<AuthCubit>().state;
    
    _currentUser = authState.maybeMap(
      authenticated: (state) => state.profile, 
      orElse: () => throw Exception('No se encontró un usuario autenticado'), 
    );
    
    context.read<CouponCubit>().loadCoupons(_currentUser);
  }

  void _showCouponForm(BuildContext context, {Coupon? coupon}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => BlocProvider.value(
        value: context.read<CouponCubit>(), // Pasamos el Cubit existente
        child: CouponForm(
          coupon: coupon,
          currentUser: _currentUser, // 🌟 Pasamos el usuario (Opción 2)
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gestión de Cupones'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Todos'),
              Tab(text: 'Activos'),
              Tab(text: 'Inactivos'),
            ],
          ),
        ),
        body: Column(
          children: [
            // BARRA DE BÚSQUEDA
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar cupón por código...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: (query) => context.read<CouponCubit>().search(query),
              ),
            ),
            
            // LISTA DE RESULTADOS
            Expanded(
              child: BlocBuilder<CouponCubit, CouponState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state.errorMessage != null && state.coupons.isEmpty) {
                    return Center(child: Text(state.errorMessage!));
                  }

                  if (state.coupons.isEmpty) {
                    return const Center(child: Text('No hay cupones registrados.'));
                  }

                  // Aplicamos el filtro de búsqueda local
                  final filteredCoupons = state.coupons.where((c) {
                    return c.code.toLowerCase().contains(state.searchQuery.toLowerCase());
                  }).toList();

                  return TabBarView(
                    children: [
                      // Pestaña Todos
                      _buildList(filteredCoupons, context),
                      // Pestaña Activos
                      _buildList(filteredCoupons.where((c) => c.isActive).toList(), context),
                      // Pestaña Inactivos
                      _buildList(filteredCoupons.where((c) => !c.isActive).toList(), context),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showCouponForm(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildList(List<Coupon> coupons, BuildContext context) {
    if (coupons.isEmpty) return const Center(child: Text('No hay resultados para esta búsqueda.'));
    
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 80), // Espacio para que el FAB no tape el último
      itemCount: coupons.length,
      itemBuilder: (context, index) {
        final coupon = coupons[index];
        return CouponTile(
          coupon: coupon,
          currentUser: _currentUser, // 🌟 Pasamos el usuario al Tile
          onEdit: () => _showCouponForm(context, coupon: coupon),
        );
      },
    );
  }
}