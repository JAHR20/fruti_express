import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/config/router/admin_router.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:go_router/go_router.dart';


class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});



  @override
  Widget build(BuildContext context) {
    BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial || state is AuthUnauthenticated) { 
          context.go(AppRouter.login); 
        }
      },
    );
    return const Scaffold(
      body: Center(
        child: Text(
          '¡Bienvenido al Panel de Administración!',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}