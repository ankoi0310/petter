import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/error/failure.dart';
import 'package:petter/features/chat/domain/entities/message.dart';
import 'package:petter/features/chat/domain/usecases/send_message.dart';
import 'package:petter/features/chat/domain/usecases/watch_messages.dart';

part 'chat_message_event.dart';

part 'chat_message_state.dart';

part 'chat_message_bloc.freezed.dart';

class ChatMessageBloc
    extends Bloc<ChatMessageEvent, ChatMessageState> {
  ChatMessageBloc({
    required WatchMessagesUseCase watchMessages,
    required SendMessageUseCase sendMessage,
    required String roomId,
  }) : _watchMessages = watchMessages,
       _sendMessage = sendMessage,
       _roomId = roomId,
       super(const ChatMessageState.initial()) {
    on<_SubscriptionRequested>(_onSubscriptionRequested);
    on<_MessagesReceived>(_onMessagesReceived);
    on<_MessageSent>(_onMessageSent);
  }

  final WatchMessagesUseCase _watchMessages;
  final SendMessageUseCase _sendMessage;
  final String _roomId;

  StreamSubscription<Either<Failure, List<Message>>>?
  _messagesSubscription;

  Future<void> _onSubscriptionRequested(
    _SubscriptionRequested event,
    Emitter<ChatMessageState> emit,
  ) async {
    print('Đang lắng nghe phòng: $_roomId');
    emit(const ChatMessageState.loading());

    await _messagesSubscription?.cancel();

    // Lắng nghe luồng tin nhắn dựa trên roomId
    _messagesSubscription = _watchMessages(_roomId).listen(
      (result) => add(ChatMessageEvent.messagesReceived(result)),
    );
  }

  void _onMessagesReceived(
    _MessagesReceived event,
    Emitter<ChatMessageState> emit,
  ) {
    print('Receive data: ${event.result}');
    event.result.fold(
      (failure) => emit(ChatMessageState.failure(failure)),
      (messages) => emit(ChatMessageState.loaded(messages)),
    );
  }

  Future<void> _onMessageSent(
    _MessageSent event,
    Emitter<ChatMessageState> emit,
  ) async {
    if (event.text.trim().isEmpty) return;

    // Lưu lại danh sách tin nhắn hiện tại để không bị mất khi đang gửi
    final currentMessages = state.maybeWhen(
      loaded: (messages) => messages,
      orElse: () => <Message>[],
    );

    // Có thể emit một state tạm thời hoặc giữ nguyên state loaded
    // và chỉ bật cờ hiệu (isSending) nếu bạn muốn UI hiển thị loading nhỏ

    final result = await _sendMessage(
      SendMessageParams(roomId: _roomId, text: event.text),
    );

    result.fold(
      (failure) {
        print(failure.message);
        emit(ChatMessageState.failure(failure));
      },
      (_) {
        // Không cần làm gì vì Stream watchMessages sẽ tự động
        // cập nhật danh sách khi Firestore có dữ liệu mới
      },
    );
  }

  @override
  Future<void> close() {
    _messagesSubscription?.cancel();
    return super.close();
  }
}
