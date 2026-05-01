// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatRoomModel _$ChatRoomModelFromJson(Map<String, dynamic> json) =>
    _ChatRoomModel(
      id: json['id'] as String,
      members: (json['members'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      lastMessage: json['lastMessage'] as String?,
      lastMessageSent: const TimestampConverterNullable().fromJson(
        json['lastMessageSent'],
      ),
      unreadCount:
          (json['unreadCount'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const {},
    );

Map<String, dynamic> _$ChatRoomModelToJson(_ChatRoomModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'members': instance.members,
      'lastMessage': instance.lastMessage,
      'lastMessageSent': const TimestampConverterNullable().toJson(
        instance.lastMessageSent,
      ),
      'unreadCount': instance.unreadCount,
    };
