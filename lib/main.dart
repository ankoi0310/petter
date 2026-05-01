import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:petter/app.dart';
import 'package:petter/core/constant/app_constants.dart';
import 'package:petter/core/di/di.dart';
import 'package:petter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:petter/features/category/presentation/bloc/category_bloc.dart';
import 'package:petter/features/chat/presentation/bloc/chat_room/chat_room_bloc.dart';
import 'package:petter/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:petter/features/pet/presentation/bloc/pet_bloc.dart';
import 'package:petter/features/user/presentation/bloc/user_bloc.dart';
import 'package:petter/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.setLanguageCode('vi');

  await dotenv.load();

  await Supabase.initialize(
    url: AppConstants.supabaseUrl,
    anonKey: AppConstants.supabasePublishableKey,
  );

  initInjection();

  PaintingBinding.instance.imageCache.maximumSizeBytes =
      100 * 1024 * 1024;
  PaintingBinding.instance.imageCache.maximumSize = 1000;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: sl<AuthBloc>()),
        BlocProvider(create: (_) => sl<UserBloc>()),
        BlocProvider(create: (_) => sl<CategoryBloc>()),
        BlocProvider(create: (_) => sl<PetBloc>()),
        BlocProvider(create: (_) => sl<FavoriteBloc>()),
        BlocProvider(
          create: (_) {
            return sl<ChatRoomBloc>()
              ..add(const ChatRoomEvent.subscriptionRequested());
          },
        ),
      ],
      child: const MyApp(),
    ),
  );
}
