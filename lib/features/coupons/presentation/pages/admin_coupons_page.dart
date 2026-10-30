import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/widgets/animated_empty_state.dart';
import 'package:fruti_express_jahr_admin/core/widgets/app_search_bar.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/coupons/presentation/widgets/coupon_tile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/core/widgets/pill_tab_bar.dart';
import '../../domain/entities/coupon.dart';
import '../cubits/coupon_cubit.dart';
import '../cubits/coupon_state.dart';
import '../widgets/coupon_form.dart';

class AdminCouponsPage extends StatefulWidget {
  const AdminCouponsPage({super.key});

  @override
  State<AdminCouponsPage> createState() => _AdminCouponsPageState();
}

class _AdminCouponsPageState extends State<AdminCouponsPage>
    with SingleTickerProviderStateMixin {
  late AppUser _currentUser;
  late AnimationController _bottomSheetController;

  @override
  void initState() {
    super.initState();

    final authState = context.read<AuthCubit>().state;

    _currentUser = authState.maybeMap(
      authenticated: (state) => state.user,
      orElse: () => throw Exception('No se encontró un usuario autenticado'),
    );

    _bottomSheetController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    context.read<CouponCubit>().loadCoupons(_currentUser);
  }

  @override
  void dispose() {
    _bottomSheetController.dispose();
    super.dispose();
  }

  void _showCouponForm(BuildContext context, {Coupon? coupon}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      transitionAnimationController: _bottomSheetController,
      builder: (dialogContext) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(dialogContext).viewInsets.bottom,
        ),
        child: BlocProvider.value(
          value: context.read<CouponCubit>(),
          child: BlocConsumer<CouponCubit, CouponState>(
            listenWhen: (previous, current) =>
                previous.operationSuccessful != current.operationSuccessful ||
                previous.operationError != current.operationError,
            listener: (ctx, state) {
              if (state.operationError != null) {
                ScaffoldMessenger.of(ctx).showSnackBar(
                  SnackBar(
                    content: Text(state.operationError!),
                    backgroundColor: Theme.of(ctx).colorScheme.error,
                  ),
                );
              }
              if (state.operationSuccessful == true) {
                Navigator.pop(ctx);
              }
            },
            builder: (ctx, state) {
              final isSaving =
                  state.isSavingOperation ||
                  (state.processingCouponId != null &&
                      state.processingCouponId == coupon?.id);

              return CouponForm(
                coupon: coupon,
                isSaving: isSaving,
                onSave:
                    (
                      code,
                      discountType,
                      discountValue,
                      minPurchaseAmount,
                      usageLimit,
                      validFrom,
                      validUntil,
                      isActive,
                    ) {
                      final isEditing = coupon != null;

                      final newCoupon = Coupon(
                        id: isEditing ? coupon.id : '',
                        code: code,
                        discountType: discountType,
                        discountValue: discountValue,
                        minPurchaseAmount: minPurchaseAmount,
                        validFrom: validFrom,
                        validUntil: validUntil,
                        usageLimit: usageLimit,
                        usedCount: isEditing ? coupon.usedCount : 0,
                        isActive: isActive,
                        createdAt: isEditing
                            ? coupon.createdAt
                            : DateTime.now(),
                        updatedAt: DateTime.now(),
                      );

                      if (isEditing) {
                        ctx.read<CouponCubit>().updateCoupon(
                          currentUser: _currentUser,
                          coupon: newCoupon,
                        );
                      } else {
                        ctx.read<CouponCubit>().createCoupon(
                          currentUser: _currentUser,
                          coupon: newCoupon,
                        );
                      }
                    },
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            const PillTabBar(
              tabs: [
                Tab(text: 'Todos'),
                Tab(text: 'Activos'),
                Tab(text: 'Inactivos'),
              ],
            ),
            AppSearchBar(
              hintText: 'Buscar cupón por código...',
              onChanged: (query) => context.read<CouponCubit>().search(query),
            ),
            Expanded(
              child: BlocBuilder<CouponCubit, CouponState>(
                builder: (context, state) {
                  // 1. CARGA INICIAL
                  if (state.isLoading && state.coupons.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(color: colors.primary),
                    );
                  }

                  // 2. ERROR GLOBAL
                  if (state.errorMessage != null && state.coupons.isEmpty) {
                    return _buildRefreshableEmptyState(
                      context,
                      child: Center(
                        child: Text(
                          state.errorMessage!,
                          style: TextStyle(color: colors.error),
                        ),
                      ),
                    );
                  }

                  // 3. SIN CUPONES EN EL SISTEMA
                  if (state.coupons.isEmpty) {
                    return _buildRefreshableEmptyState(
                      context,
                      child: const AnimatedEmptyState(
                        icon: Icon(Icons.confirmation_number_outlined),
                        title: 'No hay cupones',
                        subtitle: 'Aún no hay cupones disponibles \nen el sistema.',
                      ),
                    );
                  }

                  // 4. CON DATOS (Listos para las pestañas)
                  final filteredCoupons = state.coupons.where((c) {
                    return c.code.toLowerCase().contains(
                      state.searchQuery.toLowerCase(),
                    );
                  }).toList();

                  return TabBarView(
                    children: [
                      _buildList(filteredCoupons, context),
                      _buildList(
                        filteredCoupons.where((c) => c.isActive).toList(),
                        context,
                      ),
                      _buildList(
                        filteredCoupons.where((c) => !c.isActive).toList(),
                        context,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          label: const Text('Crear cupón'),
          icon: const Icon(Icons.add),
          onPressed: () => _showCouponForm(context),
        ),
      ),
    );
  }

  // Helper para hacer scrolleables los estados vacíos globales
  Widget _buildRefreshableEmptyState(BuildContext context, {required Widget child}) {
    final colorScheme = Theme.of(context).colorScheme;
    return RefreshIndicator(
      color: colorScheme.primary,
      onRefresh: () async {
        await context.read<CouponCubit>().loadCoupons(_currentUser);
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: child,
          ),
        ],
      ),
    );
  }

  // Método que construye cada lista individual de los Tabs
  Widget _buildList(List<Coupon> coupons, BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return RefreshIndicator(
      color: colorScheme.primary,
      onRefresh: () async {
        await context.read<CouponCubit>().loadCoupons(_currentUser);
      },
      // Si la pestaña/búsqueda está vacía, mostramos el EmptyState scrolleable
      child: coupons.isEmpty
          ? const CustomScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: AnimatedEmptyState(
                    icon: Icon(Icons.search_off_outlined),
                    title: 'Sin coincidencias',
                    subtitle: 'No se encontraron cupones para\nesta sección o búsqueda.',
                  ),
                ),
              ],
            )
          // Si hay datos, mostramos el ListView normal
          : ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 16.0, bottom: 80.0),
              itemCount: coupons.length,
              itemBuilder: (context, index) {
                final coupon = coupons[index];
                return CouponTile(
                  coupon: coupon,
                  currentUser: _currentUser,
                  onEdit: () => _showCouponForm(context, coupon: coupon),
                );
              },
            ),
    );
  }
}
