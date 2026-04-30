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
import 'package:petter/features/category/data/datasources/category_remote_data_source.dart';
import 'package:petter/features/category/data/repositories/category_repository_impl.dart';
import 'package:petter/features/category/domain/repositories/category_repository.dart';
import 'package:petter/features/category/domain/usecases/watch_categories_use_case.dart';
import 'package:petter/features/category/presentation/bloc/category_bloc.dart';
import 'package:petter/features/chat/data/datasources/chat_remote_data_source.dart';
import 'package:petter/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:petter/features/chat/domain/repositories/chat_repository.dart';
import 'package:petter/features/chat/domain/usecases/create_chat_room.dart';
import 'package:petter/features/chat/domain/usecases/send_message.dart';
import 'package:petter/features/chat/domain/usecases/watch_chat_rooms.dart';
import 'package:petter/features/chat/domain/usecases/watch_messages.dart';
import 'package:petter/features/chat/presentation/bloc/chat_message/chat_message_bloc.dart';
import 'package:petter/features/chat/presentation/bloc/chat_room/chat_room_bloc.dart';
import 'package:petter/features/favorite/data/datasources/favorite_remote_data_source.dart';
import 'package:petter/features/favorite/data/repositories/favorite_repository_impl.dart';
import 'package:petter/features/favorite/domain/repositories/favorite_repository.dart';
import 'package:petter/features/favorite/domain/usecases/add_to_favorite_use_case.dart';
import 'package:petter/features/favorite/domain/usecases/remove_from_favorite_use_case.dart';
import 'package:petter/features/favorite/domain/usecases/watch_favorites_use_case.dart';
import 'package:petter/features/favorite/presentation/bloc/favorite_bloc.dart';
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
  _initCategory(sl);
  _initPet(sl);
  _initFavorite(sl);
  _initChat(sl);
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

void _initCategory(GetIt sl) {
  sl
    ..registerLazySingleton<CategoryRemoteDataSource>(
      () => CategoryRemoteDataSourceImpl(sl()),
    )
    ..registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(sl()),
    )
    ..registerLazySingleton(() => WatchCategoriesUseCase(sl()))
    ..registerFactory(() => CategoryBloc(watchCategories: sl()));
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

void _initFavorite(GetIt sl) {
  sl
    ..registerLazySingleton<FavoriteRemoteDataSource>(
      () => FavoriteRemoteDataSourceImpl(sl()),
    )
    ..registerLazySingleton<FavoriteRepository>(
      () => FavoriteRepositoryImpl(sl()),
    )
    ..registerLazySingleton(() => WatchFavoritesUseCase(sl(), sl()))
    ..registerLazySingleton(() => AddToFavoriteUseCase(sl()))
    ..registerLazySingleton(() => RemoveFromFavoriteUseCase(sl()))
    ..registerFactory(
      () => FavoriteBloc(
        watchAuthState: sl(),
        watchFavorites: sl(),
        addToFavorite: sl(),
        removeFromFavorite: sl(),
      ),
    );
}

void _initChat(GetIt sl) {
  sl
    ..registerLazySingleton<ChatRemoteDataSource>(
      () => ChatRemoteDataSourceImpl(sl(), sl()),
    )
    ..registerLazySingleton<ChatRepository>(
      () => ChatRepositoryImpl(sl()),
    )
    ..registerLazySingleton(() => WatchChatRoomsUseCase(sl()))
    ..registerLazySingleton(() => CreateChatRoomUseCase(sl()))
    ..registerLazySingleton(() => WatchMessagesUseCase(sl()))
    ..registerLazySingleton(() => SendMessageUseCase(sl()))
    ..registerLazySingleton(
      () => ChatRoomBloc(watchChatRooms: sl(), createChatRoom: sl()),
    )
    ..registerFactoryParam<ChatMessageBloc, String, String>(
      (roomId, _) => ChatMessageBloc(
        watchMessages: sl(),
        sendMessage: sl(),
        roomId: roomId,
      ),
    );
}
