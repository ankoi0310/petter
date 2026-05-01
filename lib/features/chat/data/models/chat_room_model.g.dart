// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatRoomModel _$ChatRoomModelFromJson(Map<String, dynamic> json) =>
    _ChatRoomModel(
      id: json['id'] as String,
      memberIds: (json['memberIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      memberNames: Map<String, String>.from(json['memberNames'] as Map),
      memberAvatars: Map<String, String>.from(json['memberAvatars'] as Map),
      unreadCount: Map<String, int>.from(json['unreadCount'] as Map),
      lastMessage: json['lastMessage'] as String?,
      lastMessageSent: const TimestampConverterNullable().fromJson(
        json['lastMessageSent'],
      ),
    );

Map<String, dynamic> _$ChatRoomModelToJson(_ChatRoomModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memberIds': instance.memberIds,
      'memberNames': instance.memberNames,
      'memberAvatars': instance.memberAvatars,
      'unreadCount': instance.unreadCount,
      'lastMessage': instance.lastMessage,
      'lastMessageSent': const TimestampConverterNullable().toJson(
        instance.lastMessageSent,
      ),
    };
