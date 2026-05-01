import 'package:freezed_annotation/freezed_annotation.dart';

enum RequestStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('reviewing')
  reviewing,
  @JsonValue('approved')
  approved,
  @JsonValue('rejected')
  rejected,
  @JsonValue('cancelled')
  cancelled,
}
