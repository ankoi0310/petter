import 'package:petter/core/error/failure.dart';

String mapFailureMessage(Failure failure) => failure.when(
  auth: (message) => message,
  chat: (message) => message,
  server: (message) => message,
  unknown: (message) => message,
);
