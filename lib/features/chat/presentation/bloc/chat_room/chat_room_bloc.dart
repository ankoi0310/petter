import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/error/failure.dart';
import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/features/chat/domain/entities/chat_room.dart';
import 'package:petter/features/chat/domain/usecases/create_chat_room.dart';
import 'package:petter/features/chat/domain/usecases/watch_chat_rooms.dart';
import 'package:petter/features/user/domain/entities/user.dart';
import 'package:petter/features/user/domain/usecases/get_profile_use_case.dart';

part 'chat_room_event.dart';

part 'chat_room_state.dart';

part 'chat_room_bloc.freezed.dart';

class ChatRoomBloc extends Bloc<ChatRoomEvent, ChatRoomState> {
  ChatRoomBloc({
    required WatchChatRoomsUseCase watchChatRooms,
    required CreateChatRoomUseCase createChatRoom,
    required GetProfileUseCase getProfile,
  }) : _watchChatRooms = watchChatRooms,
       _createChatRoom = createChatRoom,
       _getProfile = getProfile,
       super(const ChatRoomState.initial()) {
    on<_SubscriptionRequested>(_onSubscriptionRequested);
    on<_RoomsReceived>(_onRoomsReceived);
    on<_RoomCreated>(_onRoomCreated);
  }

  final WatchChatRoomsUseCase _watchChatRooms;
  final CreateChatRoomUseCase _createChatRoom;
  final GetProfileUseCase _getProfile;

  StreamSubscription<Either<Failure, List<ChatRoom>>>?
  _roomsSubscription;

  Future<void> _onSubscriptionRequested(
    _SubscriptionRequested event,
    Emitter<ChatRoomState> emit,
  ) async {
    emit(const ChatRoomState.loading());

    await _roomsSubscription?.cancel();

    // Lắng nghe Stream danh sách phòng chat
    _roomsSubscription = _watchChatRooms(
      NoParams(),
    ).listen((result) => add(ChatRoomEvent.roomsReceived(result)));
  }

  void _onRoomsReceived(
    _RoomsReceived event,
    Emitter<ChatRoomState> emit,
  ) {
    event.result.fold(
      (failure) => emit(ChatRoomState.failure(failure)),
      (rooms) => emit(ChatRoomState.loaded(rooms)),
    );
  }

  Future<void> _onRoomCreated(
    _RoomCreated event,
    Emitter<ChatRoomState> emit,
  ) async {
    final currentUser = event.currentUser;
    final userResult = await _getProfile(event.ownerId);

    await userResult.fold(
      (failure) async => emit(ChatRoomState.failure(failure)),
      (owner) async {
        final roomResult = await _createChatRoom(
          CreateChatRoomParams(
            memberIds: [currentUser.id, owner.id],
            memberNames: {
              currentUser.id: currentUser.name,
              owner.id: owner.name,
            },
            memberAvatars: {
              currentUser.id: currentUser.avatar,
              owner.id: owner.avatar,
            },
          ),
        );

        roomResult.fold(
          (failure) => emit(ChatRoomState.failure(failure)),
          (room) => emit(ChatRoomState.roomReady(room)),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _roomsSubscription?.cancel();
    return super.close();
  }
}
