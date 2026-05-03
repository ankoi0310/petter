import 'package:freezed_annotation/freezed_annotation.dart';

enum RequestStatus {
  @JsonValue('pending')
  pending('Chờ xác nhận'),
  @JsonValue('reviewing')
  reviewing('Đang xem xét'),
  @JsonValue('approved')
  approved('Đã chấp nhận'),
  @JsonValue('rejected')
  rejected('Đã từ chối');

  const RequestStatus(this.label);

  final String label;
}
