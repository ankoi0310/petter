// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserChatModel _$UserChatModelFromJson(Map<String, dynamic> json) =>
    _UserChatModel(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      isOnline: json['isOnline'] as bool,
      lastSeen: const TimestampConverterNullable().fromJson(json['lastSeen']),
    );

Map<String, dynamic> _$UserChatModelToJson(_UserChatModel instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
      'isOnline': instance.isOnline,
      'lastSeen': const TimestampConverterNullable().toJson(instance.lastSeen),
    };
