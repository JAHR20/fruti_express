import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/cubits/product_cubit.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_cubit.dart';

import '../cubits/inventory_cubit.dart';
import '../pages/admin_inventory_page.dart';

abstract class InventoryRoutes {
  static const String adminInventoryPath = '/dashboard/inventory';
  static const String adminInventoryName = 'admin-inventory';

  static List<RouteBase> buildRoutes() {
    return [
      GoRoute(
        path: adminInventoryPath,
        name: adminInventoryName,
        builder: (context, state) {
          final currentUser =
              (sl<AuthCubit>().state as AuthAuthenticated).profile;

          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) {
                  final cubit = sl<InventoryCubit>();
                  if (currentUser.branchId != null &&
                      currentUser.branchId!.isNotEmpty) {
                    cubit.loadInventory(currentUser.branchId!); 
                  }
                  return cubit;
                },
              ),
              BlocProvider(
                create: (context) =>
                    sl<ProductCubit>()..loadAllProducts(), 
              ),
              BlocProvider(
                create: (context) {
                  final cubit = sl<BranchCubit>();
                  if (currentUser.branchId == null ||
                      currentUser.branchId!.isEmpty) {
                    cubit.loadBranches(); 
                  }
                  return cubit;
                },
              ),
            ],
            child: const AdminInventoryPage(),
          );
        },
      ),
    ];
  }
}