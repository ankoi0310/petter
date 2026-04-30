import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure.auth(String message) = _AuthFailure;
  const factory Failure.chat(String message) = _ChatFailure;
  const factory Failure.server(String message) = _ServerFailure;
  const factory Failure.unknown(String message) = _UnknownFailure;
}
