import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petter/app.dart';
import 'package:petter/core/di/di.dart';
import 'package:petter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:petter/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  initInjection();

  runApp(
    MultiBlocProvider(
      providers: [BlocProvider.value(value: sl<AuthBloc>())],
      child: const MyApp(),
    ),
  );
}
