import 'package:freezed_annotation/freezed_annotation.dart';

enum NotificationType {
  @JsonValue('adoptionRequest')
  adoptionRequest('Yêu cầu'),
  @JsonValue('system')
  system('Hệ thống');

  const NotificationType(this.label);

  final String label;
}
