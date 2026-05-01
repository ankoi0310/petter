part of 'chat_message_bloc.dart';

@freezed
class ChatMessageEvent with _$ChatMessageEvent {
  const factory ChatMessageEvent.subscriptionRequested() =
      _SubscriptionRequested;

  const factory ChatMessageEvent.messagesReceived(
    Either<Failure, List<Message>> result,
  ) = _MessagesReceived;

  const factory ChatMessageEvent.messageSent(String text) =
      _MessageSent;
}
