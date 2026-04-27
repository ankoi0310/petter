import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/error_util.dart';
import 'package:petter/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:petter/features/auth/domain/usecases/sign_out_use_case.dart';
import 'package:petter/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:petter/features/auth/domain/usecases/watch_auth_state_use_case.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required SignUpUseCase signUp,
    required SignInUseCase signIn,
    required SignOutUseCase signOut,
    required WatchAuthStateUseCase watchAuthState,
  }) : _signUp = signUp,
       _signIn = signIn,
       _signOut = signOut,
       _watchAuthState = watchAuthState,
       super(const AuthState.initial()) {
    on<_Started>(_onStarted);
    on<_SignUp>(_onSignUp);
    on<_SignIn>(_onSignIn);
    on<_SignOut>(_onSignOut);

    _subscription = _watchAuthState(NoParams()).listen((
      isAuthenticated,
    ) {
      add(const AuthEvent.started());
    });
  }

  final SignUpUseCase _signUp;
  final SignInUseCase _signIn;
  final SignOutUseCase _signOut;
  final WatchAuthStateUseCase _watchAuthState;
  StreamSubscription<bool>? _subscription;

  Future<void> _onStarted(
    _Started event,
    Emitter<AuthState> emit,
  ) async {
    final isAuth = await _watchAuthState(NoParams()).first;
    emit(
      isAuth
          ? const AuthState.authenticated()
          : const AuthState.unauthenticated(),
    );
  }

  Future<void> _onSignUp(
    _SignUp event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await _signUp(
      SignUpParams(email: event.email, password: event.password),
    );

    result.fold(
      (failure) => emit(AuthState.error(mapFailureMessage(failure))),
      (_) => emit(const AuthState.authenticated()),
    );
  }

  Future<void> _onSignIn(
    _SignIn event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await _signIn(
      SignInParams(email: event.email, password: event.password),
    );

    result.fold(
      (failure) => emit(AuthState.error(mapFailureMessage(failure))),
      (_) => emit(const AuthState.authenticated()),
    );
  }

  Future<void> _onSignOut(
    _SignOut event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _signOut(NoParams());
    result.fold(
      (failure) => emit(AuthState.error(mapFailureMessage(failure))),
      (_) => emit(const AuthState.unauthenticated()),
    );
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
