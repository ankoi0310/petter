part of 'chat_message_bloc.dart';

@freezed
class ChatMessageState with _$ChatMessageState {
  const factory ChatMessageState.initial() = _Initial;
  const factory ChatMessageState.loading() = _Loading;
  const factory ChatMessageState.loaded(List<Message> messages) =
      _Loaded;
  const factory ChatMessageState.failure(Failure failure) = _Failure;
}
