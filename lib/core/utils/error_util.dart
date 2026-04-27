import 'package:petter/core/error/failure.dart';

String mapFailureMessage(Failure failure) => failure.when(
  auth: (msg) => msg,
  server: (msg) => msg,
  unknown: (msg) => msg,
);
