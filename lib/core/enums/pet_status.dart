import 'package:freezed_annotation/freezed_annotation.dart';

enum PetStatus {
  @JsonValue('available')
  available,
  @JsonValue('pending')
  pending,
  @JsonValue('adopted')
  adopted,
}
