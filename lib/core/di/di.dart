import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:petter/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:petter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:petter/features/auth/domain/repositories/auth_repository.dart';
import 'package:petter/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:petter/features/auth/domain/usecases/sign_out_use_case.dart';
import 'package:petter/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:petter/features/auth/domain/usecases/watch_auth_state_use_case.dart';
import 'package:petter/features/auth/presentation/bloc/auth_bloc.dart';

final GetIt sl = GetIt.instance;

void initInjection() {
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  _initAuth(sl);
}

void _initAuth(GetIt sl) {
  sl
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl()),
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl()),
    )
    ..registerLazySingleton(() => SignUpUseCase(sl()))
    ..registerLazySingleton(() => SignInUseCase(sl()))
    ..registerLazySingleton(() => SignOutUseCase(sl()))
    ..registerLazySingleton(() => WatchAuthStateUseCase(sl()))
    ..registerLazySingleton(
      () => AuthBloc(
        signUp: sl(),
        signIn: sl(),
        signOut: sl(),
        watchAuthState: sl(),
      ),
    );
}
