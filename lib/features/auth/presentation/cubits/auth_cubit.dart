import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/failure_translator.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/use_cases/login_use_case.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/use_cases/register_use_case.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/use_cases/logout_use_case.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/use_cases/check_auth_status_use_case.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/use_cases/sign_in_with_google_use_case.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/use_cases/auth_state_changes_use_case.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final LogoutUseCase _logoutUseCase;
  final CheckAuthStatusUseCase _checkAuthStatusUseCase;
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  late final StreamSubscription _authSubscription;

  AuthCubit({
    required LoginUseCase loginUseCase,
    required RegisterUseCase registerUseCase,
    required LogoutUseCase logoutUseCase,
    required CheckAuthStatusUseCase checkAuthStatusUseCase,
    required SignInWithGoogleUseCase signInWithGoogleUseCase,
    required AuthStateChangesUseCase authStateChangesUseCase,
  }) : _loginUseCase = loginUseCase,
       _registerUseCase = registerUseCase,
       _logoutUseCase = logoutUseCase,
       _checkAuthStatusUseCase = checkAuthStatusUseCase,
       _signInWithGoogleUseCase = signInWithGoogleUseCase,
       super(const AuthState.initial()) {
    _authSubscription = authStateChangesUseCase().listen((user) {
      if (user != null) {
        emit(AuthState.authenticated(user));
      }
    });
  }

  Future<void> checkStatus() async {
    emit(const AuthState.loading());
    final result = await _checkAuthStatusUseCase().run();
    result.fold(
      (failure) => emit(
        AuthState.error(translateFailure(failure)),
      ),
      (user) => user != null
          ? emit(AuthState.authenticated(user))
          : emit(const AuthState.unauthenticated()),
    );
  }

  Future<void> login(String email, String password) async {
    emit(const AuthState.loading());
    final result = await _loginUseCase(email, password).run();
    result.fold(
      (failure) => emit(AuthState.error(translateFailure(failure))),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(const AuthState.loading());
    final result = await _registerUseCase(
      email: email,
      password: password,
    ).run();
    result.fold(
      (failure) => emit(AuthState.error(translateFailure(failure))),
      (user) => user != null
          ? emit(AuthState.authenticated(user))
          : emit(const AuthState.emailConfirmationPending()),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(const AuthState.loading());
    final result = await _signInWithGoogleUseCase().run();
    result.fold((failure) {
      emit(AuthState.error(translateFailure(failure)));
    }, (user) => emit(AuthState.authenticated(user)));
  }

  Future<void> logout() async {
    emit(const AuthState.loading());
    final result = await _logoutUseCase().run();
    result.fold(
      (failure) => emit(AuthState.error(translateFailure(failure))),
      (_) => emit(const AuthState.unauthenticated()),
    );
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }
}
