import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/error/failure.dart';
import 'package:petter/core/services/firebase_cloud_message_service.dart';
import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/error_util.dart';
import 'package:petter/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:petter/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:petter/features/auth/domain/usecases/sign_out_use_case.dart';
import 'package:petter/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:petter/features/auth/domain/usecases/watch_auth_state_use_case.dart';
import 'package:petter/features/user/domain/entities/user.dart';

part 'auth_bloc.freezed.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required SignUpUseCase signUp,
    required SignInUseCase signIn,
    required ResetPasswordUseCase resetPassword,
    required SignOutUseCase signOut,
    required WatchAuthStateUseCase watchAuthState,
    required NotificationService notificationService,
  }) : _signUp = signUp,
       _signIn = signIn,
       _resetPassword = resetPassword,
       _signOut = signOut,
       _watchAuthState = watchAuthState,
       _notificationService = notificationService,
       super(const .initial()) {
    on<_Started>(_onStarted);
    on<_SignUp>(_onSignUp);
    on<_SignIn>(_onSignIn);
    on<_ResetPassword>(_onResetPassword);
    on<_SignOut>(_onSignOut);

    _subscription = _watchAuthState(NoParams()).listen((user) {
      add(const AuthEvent.started());
    });
  }

  final SignUpUseCase _signUp;
  final SignInUseCase _signIn;
  final ResetPasswordUseCase _resetPassword;
  final SignOutUseCase _signOut;
  final WatchAuthStateUseCase _watchAuthState;
  final NotificationService _notificationService;
  StreamSubscription<Either<Failure, User?>>? _subscription;

  Future<void> _onStarted(
    _Started event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _watchAuthState(NoParams()).first;
    await result.fold(
      (failure) async => emit(const .unauthenticated()),
      (user) async {
        // await _notificationService.requestPermission();
        // await _notificationService.setFcmToken();
        emit(
          user != null
              ? .authenticated(user)
              : const .unauthenticated(),
        );
      },
    );
  }

  Future<void> _onSignUp(
    _SignUp event,
    Emitter<AuthState> emit,
  ) async {
    emit(const .loading());

    final result = await _signUp(
      SignUpParams(
        name: event.displayName,
        phone: event.phoneNumber,
        email: event.email,
        password: event.password,
      ),
    );

    result.fold(
      (failure) => emit(.error(mapFailureMessage(failure))),
      (user) => emit(.authenticated(user)),
    );
  }

  Future<void> _onSignIn(
    _SignIn event,
    Emitter<AuthState> emit,
  ) async {
    emit(const .loading());

    final result = await _signIn(
      SignInParams(email: event.email, password: event.password),
    );

    result.fold(
      (failure) => emit(.error(mapFailureMessage(failure))),
      (user) => emit(.authenticated(user)),
    );
  }

  Future<void> _onResetPassword(
    _ResetPassword event,
    Emitter<AuthState> emit,
  ) async {
    emit(const .loading());

    final result = await _resetPassword(event.email);

    result.fold(
      (failure) => emit(.error(failure.message)),
      (_) => emit(const .resetPasswordSuccess()),
    );
  }

  Future<void> _onSignOut(
    _SignOut event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _signOut(NoParams());
    result.fold(
      (failure) => emit(.error(mapFailureMessage(failure))),
      (_) => emit(const .unauthenticated()),
    );
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
