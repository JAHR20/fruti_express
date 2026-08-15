import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/use_cases/login_use_case.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/use_cases/register_use_case.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/use_cases/logout_use_case.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/use_cases/check_auth_status_use_case.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final LogoutUseCase _logoutUseCase;
  final CheckAuthStatusUseCase _checkAuthStatusUseCase;

  AuthCubit({
    required LoginUseCase loginUseCase,
    required RegisterUseCase registerUseCase,
    required LogoutUseCase logoutUseCase,
    required CheckAuthStatusUseCase checkAuthStatusUseCase,
  })  : _loginUseCase = loginUseCase,
        _registerUseCase = registerUseCase,
        _logoutUseCase = logoutUseCase,
        _checkAuthStatusUseCase = checkAuthStatusUseCase,
        super(const AuthState.initial()); 

  Future<void> checkStatus() async {
    emit(const AuthState.loading());
    final result = await _checkAuthStatusUseCase().run();
    result.fold(
      (failure) => emit(AuthState.error('Error de sesión: ${failure.errorMessage}')),
      (perfil) => perfil != null
          ? emit(AuthState.authenticated(perfil))
          : emit(const AuthState.unauthenticated()),
    );
  }

  Future<void> login(String email, String password) async {
    emit(const AuthState.loading());
    final result = await _loginUseCase(email, password).run();
    result.fold(
      (failure) => emit(AuthState.error(failure.errorMessage)),
      (perfil) => emit(AuthState.authenticated(perfil)),
    );
  }

  Future<void> register({
    required String nombre,
    required String apellidoPaterno,
    String? apellidoMaterno,
    String? alias,
    required String telefono,
    required String email,
    required String password,
  }) async {
    emit(const AuthState.loading());
    final result = await _registerUseCase(
      nombre: nombre,
      apellidoPaterno: apellidoPaterno,
      apellidoMaterno: apellidoMaterno,
      alias: alias,
      telefono: telefono,
      email: email,
      password: password,
    ).run();
    result.fold(
      (failure) => emit(AuthState.error(failure.errorMessage)),
      (perfil) => emit(AuthState.authenticated(perfil)),
    );
  }

  Future<void> logout() async {
  emit(const AuthState.loading());
  final result = await _logoutUseCase().run();
  result.fold(
    (failure) => emit(AuthState.error(failure.errorMessage)),
    (_) async {
      emit(const AuthState.unauthenticated());
    },
  );
}
}