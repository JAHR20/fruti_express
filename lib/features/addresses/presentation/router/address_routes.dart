import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/customer_shipping_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_cubit.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_state.dart';

import '../cubits/address_cubit.dart';
import '../pages/my_addresses_page.dart';

abstract class AddressRoutes {
  static const String myAddressesPath = '/customer/addresses';
  static const String myAddressesName = 'customer-addresses';

  static List<RouteBase> buildRoutes() {
    return [
      GoRoute(
        path: myAddressesPath,
        name: myAddressesName,
        builder: (context, state) {
          final profile = (sl<AuthCubit>().state as AuthAuthenticated).profile;

          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => sl<AddressCubit>()..loadAddresses(profile.id),
              ),
              BlocProvider(create: (_) => sl<BranchCubit>()..loadBranches()),
              BlocProvider(create: (_) => sl<CustomerShippingCubit>()),
            ],
            child: BlocListener<BranchCubit, BranchState>(
              listener: (context, branchState) {
                if (branchState.branches.isNotEmpty) {
                  context
                      .read<CustomerShippingCubit>()
                      .loadBranchConfigurations(branchState.branches);
                }
              },
              child: MyAddressesPage(userId: profile.id),
            ),
          );
        },
      ),
    ];
  }
}
