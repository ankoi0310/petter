import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:petter/core/services/firebase_cloud_message_service.dart';
import 'package:petter/core/services/supabase_storage_service.dart';
import 'package:petter/features/adoption/data/datasources/adoption_remote_data_source.dart';
import 'package:petter/features/adoption/data/repositories/adoption_repository_impl.dart';
import 'package:petter/features/adoption/domain/repositories/adoption_repository.dart';
import 'package:petter/features/adoption/domain/usecases/create_adoption_request_use_case.dart';
import 'package:petter/features/adoption/domain/usecases/get_adoption_requests_use_case.dart';
import 'package:petter/features/adoption/domain/usecases/get_my_adoption_requests_use_case.dart';
import 'package:petter/features/adoption/domain/usecases/update_adoption_request_status_use_case.dart';
import 'package:petter/features/adoption/presentation/bloc/adoption_bloc.dart';
import 'package:petter/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:petter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:petter/features/auth/domain/repositories/auth_repository.dart';
import 'package:petter/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:petter/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:petter/features/auth/domain/usecases/sign_out_use_case.dart';
import 'package:petter/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:petter/features/auth/domain/usecases/watch_auth_state_use_case.dart';
import 'package:petter/features/auth/presentation/bloc/auth_bloc.dart';
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
import 'package:petter/features/notification/data/datasources/notification_remote_data_source.dart';
import 'package:petter/features/notification/data/repositories/notification_repository_impl.dart';
import 'package:petter/features/notification/domain/repositories/notification_repository.dart';
import 'package:petter/features/notification/domain/usecases/create_notification_use_case.dart';
import 'package:petter/features/notification/domain/usecases/get_notifications_use_case.dart';
import 'package:petter/features/notification/domain/usecases/read_all_notifications_use_case.dart';
import 'package:petter/features/notification/domain/usecases/read_notification_use_case.dart';
import 'package:petter/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:petter/features/pet/data/datasources/pet_remote_data_source.dart';
import 'package:petter/features/pet/data/repositories/pet_repository_impl.dart';
import 'package:petter/features/pet/domain/repositories/pet_repository.dart';
import 'package:petter/features/pet/domain/usecases/create_pet_use_case.dart';
import 'package:petter/features/pet/domain/usecases/get_pet_use_case.dart';
import 'package:petter/features/pet/domain/usecases/get_pets_use_case.dart';
import 'package:petter/features/pet/domain/usecases/get_user_pets_use_case.dart';
import 'package:petter/features/pet/domain/usecases/update_pet_use_case.dart';
import 'package:petter/features/pet/presentation/bloc/pet_bloc.dart';
import 'package:petter/features/species/data/datasources/species_remote_data_source.dart';
import 'package:petter/features/species/data/repositories/species_repository_impl.dart';
import 'package:petter/features/species/domain/repositories/species_repository.dart';
import 'package:petter/features/species/domain/usecases/watch_species_use_case.dart';
import 'package:petter/features/species/presentation/bloc/species_bloc.dart';
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
      () => NotificationService(auth: sl(), database: sl()),
    )
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
  _initSpecies(sl);
  _initPet(sl);
  _initAdoption(sl);
  _initFavorite(sl);
  _initChat(sl);
  _initNotification(sl);
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
    ..registerLazySingleton(() => ResetPasswordUseCase(sl()))
    ..registerLazySingleton(() => SignOutUseCase(sl()))
    ..registerLazySingleton(() => WatchAuthStateUseCase(sl()))
    ..registerLazySingleton(
      () => AuthBloc(
        signUp: sl(),
        signIn: sl(),
        resetPassword: sl(),
        signOut: sl(),
        watchAuthState: sl(),
        notificationService: sl(),
      ),
    );
}

void _initUser(GetIt sl) {
  sl
    ..registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(sl(), sl(), sl()),
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

void _initSpecies(GetIt sl) {
  sl
    ..registerLazySingleton<SpeciesRemoteDataSource>(
      () => SpeciesRemoteDataSourceImpl(sl()),
    )
    ..registerLazySingleton<SpeciesRepository>(
      () => SpeciesRepositoryImpl(sl()),
    )
    ..registerLazySingleton(() => WatchSpeciesUseCase(sl()))
    ..registerFactory(() => SpeciesBloc(watchSpecies: sl()));
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

void _initAdoption(GetIt sl) {
  sl
    ..registerLazySingleton<AdoptionRemoteDataSource>(
      () => AdoptionRemoteDataSourceImpl(sl(), sl()),
    )
    ..registerLazySingleton<AdoptionRepository>(
      () => AdoptionRepositoryImpl(sl()),
    )
    ..registerLazySingleton(() => GetAdoptionRequestsUseCase(sl()))
    ..registerLazySingleton(() => GetMyAdoptionRequestsUseCase(sl()))
    ..registerLazySingleton(() => CreateAdoptionRequestUseCase(sl()))
    ..registerLazySingleton(() => UpdateAdoptionRequestUseCase(sl()))
    ..registerFactory(
      () => AdoptionBloc(
        getAdoptionRequests: sl(),
        getMyAdoptionRequests: sl(),
        createAdoptionRequest: sl(),
        updateAdoptionRequest: sl(),
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
      () => ChatRoomBloc(
        watchChatRooms: sl(),
        createChatRoom: sl(),
        getProfile: sl(),
      ),
    )
    ..registerFactoryParam<ChatMessageBloc, String, dynamic>(
      (roomId, _) => ChatMessageBloc(
        watchMessages: sl(),
        sendMessage: sl(),
        roomId: roomId,
      ),
    );
}

void _initNotification(GetIt sl) {
  sl
    ..registerLazySingleton<NotificationRemoteDataSource>(
      () => NotificationRemoteDataSourceImpl(sl(), sl()),
    )
    ..registerLazySingleton<NotificationRepository>(
      () => NotificationRepositoryImpl(sl()),
    )
    ..registerLazySingleton(() => GetNotificationsUseCase(sl()))
    ..registerLazySingleton(() => CreateNotificationUseCase(sl()))
    ..registerLazySingleton(() => ReadNotificationUseCase(sl()))
    ..registerLazySingleton(() => ReadAllNotificationsUseCase(sl()))
    ..registerLazySingleton(
      () => NotificationBloc(
        getNotifications: sl(),
        createNotification: sl(),
        readNotification: sl(),
        readAllNotifications: sl(),
      ),
    );
}
