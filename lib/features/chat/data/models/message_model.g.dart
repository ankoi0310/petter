// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageModel _$MessageModelFromJson(Map<String, dynamic> json) =>
    _MessageModel(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      text: json['text'] as String,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      isRead: json['isRead'] as bool? ?? false,
      attachment: json['attachment'] as String?,
    );

Map<String, dynamic> _$MessageModelToJson(_MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'text': instance.text,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'isRead': instance.isRead,
      'attachment': instance.attachment,
    };
