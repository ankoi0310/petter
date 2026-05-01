part of 'chat_room_bloc.dart';

@freezed
class ChatRoomState with _$ChatRoomState {
  const factory ChatRoomState.initial() = _Initial;

  const factory ChatRoomState.loading() = _Loading;

  const factory ChatRoomState.loaded(List<ChatRoom> rooms) = _Loaded;

  const factory ChatRoomState.roomReady(ChatRoom room) = _RoomReady;

  const factory ChatRoomState.failure(Failure failure) = _Failure;
}
