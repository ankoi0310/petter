part of 'chat_room_bloc.dart';

@freezed
class ChatRoomEvent with _$ChatRoomEvent {
  const factory ChatRoomEvent.subscriptionRequested() =
      _SubscriptionRequested;

  const factory ChatRoomEvent.roomsReceived(
    Either<Failure, List<ChatRoom>> result,
  ) = _RoomsReceived;

  const factory ChatRoomEvent.roomCreated(List<String> members) =
      _RoomCreated;
}
