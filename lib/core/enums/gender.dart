import 'package:freezed_annotation/freezed_annotation.dart';

enum Gender {
  @JsonValue('male')
  male,
  @JsonValue('female')
  female,
}
