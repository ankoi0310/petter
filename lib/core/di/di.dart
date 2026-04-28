import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:petter/core/services/supabase_storage_service.dart';
import 'package:petter/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:petter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:petter/features/auth/domain/repositories/auth_repository.dart';
import 'package:petter/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:petter/features/auth/domain/usecases/sign_out_use_case.dart';
import 'package:petter/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:petter/features/auth/domain/usecases/watch_auth_state_use_case.dart';
import 'package:petter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:petter/features/pet/data/datasources/pet_remote_data_source.dart';
import 'package:petter/features/pet/data/repositories/pet_repository_impl.dart';
import 'package:petter/features/pet/domain/repositories/pet_repository.dart';
import 'package:petter/features/pet/domain/usecases/create_pet_use_case.dart';
import 'package:petter/features/pet/domain/usecases/get_pet_use_case.dart';
import 'package:petter/features/pet/domain/usecases/get_pets_use_case.dart';
import 'package:petter/features/pet/domain/usecases/get_user_pets_use_case.dart';
import 'package:petter/features/pet/domain/usecases/update_pet_use_case.dart';
import 'package:petter/features/pet/presentation/bloc/pet_bloc.dart';
import 'package:petter/features/user/data/datasources/user_remote_data_source.dart';
import 'package:petter/features/user/data/repositories/user_repository_impl.dart';
import 'package:petter/features/user/domain/repositories/user_repository.dart';
import 'package:petter/features/user/domain/usecases/get_profile_use_case.dart';
import 'package:petter/features/user/domain/usecases/update_profile_use_case.dart';
import 'package:petter/features/user/presentation/bloc/user_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt sl = GetIt.instance;

void initInjection() {
  sl
    ..registerLazySingleton(() => FirebaseAuth.instance)
    ..registerLazySingleton(
      () => FirebaseFirestore.instanceFor(
        app: Firebase.app(),
        databaseId: 'petter',
      ),
    )
    ..registerLazySingleton(() => Supabase.instance.client)
    ..registerLazySingleton<SupabaseStorageService>(
      () => SupabaseStorageServiceImpl(client: sl()),
    );

  _initAuth(sl);
  _initUser(sl);
  _initPet(sl);
}

void _initAuth(GetIt sl) {
  sl
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl(), sl()),
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

void _initUser(GetIt sl) {
  sl
    ..registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(sl(), sl()),
    )
    ..registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(sl()),
    )
    ..registerLazySingleton(() => GetProfileUseCase(sl()))
    ..registerLazySingleton(() => UpdateProfileUseCase(sl()))
    ..registerFactory(
      () => UserBloc(getProfile: sl(), updateProfile: sl()),
    );
}

void _initPet(GetIt sl) {
  sl
    ..registerLazySingleton<PetRemoteDataSource>(
      () => PetRemoteDataSourceImpl(sl(), sl()),
    )
    ..registerLazySingleton<PetRepository>(
      () => PetRepositoryImpl(sl()),
    )
    ..registerLazySingleton(() => GetPetsUseCase(sl()))
    ..registerLazySingleton(() => GetUserPetsUseCase(sl()))
    ..registerLazySingleton(() => GetPetUseCase(sl()))
    ..registerLazySingleton(() => CreatePetUseCase(sl()))
    ..registerLazySingleton(() => UpdatePetUseCase(sl()))
    ..registerFactory(
      () => PetBloc(
        getPets: sl(),
        getUserPets: sl(),
        getPet: sl(),
        createPet: sl(),
        updatePet: sl(),
      ),
    );
}
