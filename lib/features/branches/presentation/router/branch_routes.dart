import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/pages/shipping_rates_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/shipping_admin_cubit.dart';

import '../cubits/branch_cubit.dart';
import '../cubits/wizard_branch_cubit.dart'; 
import '../pages/admin_branches_page.dart';
import '../pages/create_branch_wizard_screen.dart'; 

abstract class BranchRoutes {
  static const String listPath = '/dashboard/branches';
  static const String listName = 'admin-branches';
  
  static const String newBranchPath = 'nueva'; 
  static const String newBranchName = 'admin-branches-new';
  
  static const String ratesPath = ':id/rates';
  static const String ratesName = 'admin-branches-rates';

  static List<RouteBase> buildRoutes() {
    return [
      GoRoute(
        path: listPath,
        name: listName,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => sl<BranchCubit>(),
            child: const AdminBranchesPage(),
          );
        },
        routes: [
          GoRoute(
            path: newBranchPath,
            name: newBranchName,
            builder: (context, state) {
              final extra = state.extra as Map<String, dynamic>?;
              final branch = extra?['branch'] as Branch?; 
              final initialStep = extra?['initialStep'] as int? ?? 0; 

              return MultiBlocProvider(
                providers: [
                  BlocProvider(create: (_) => sl<WizardBranchCubit>()),
                  BlocProvider(create: (_) => sl<ShippingAdminCubit>()),
                ],
                child: CreateBranchWizardScreen(
                  branch: branch,
                  initialStep: initialStep,
                ),
              );
            },
          ),
          GoRoute(
            path: ratesPath,
            name: ratesName,
            builder: (context, state) {
              final branchId = state.pathParameters['id']!;
              return BlocProvider(
                create: (_) => sl<ShippingAdminCubit>(),
                child: ShippingRatesScreen(branchId: branchId),
              );
            },
          ),
        ],
      ),
    ];
  }
}