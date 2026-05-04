import 'package:freezed_annotation/freezed_annotation.dart';

enum Gender {
  @JsonValue('male')
  male('Đực'),
  @JsonValue('female')
  female('Cái');

  const Gender(this.label);

  final String label;
}
