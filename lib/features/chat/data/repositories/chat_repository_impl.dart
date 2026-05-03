import 'package:fpdart/fpdart.dart';
import 'package:petter/core/error/exception.dart';
import 'package:petter/core/error/failure.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/chat/data/datasources/chat_remote_data_source.dart';
import 'package:petter/features/chat/data/mapper/chat_room_mapper.dart';
import 'package:petter/features/chat/data/mapper/message_mapper.dart';
import 'package:petter/features/chat/domain/entities/chat_room.dart';
import 'package:petter/features/chat/domain/entities/message.dart';
import 'package:petter/features/chat/domain/repositories/chat_repository.dart';
import 'package:petter/features/chat/domain/usecases/create_chat_room.dart';
import 'package:petter/features/chat/domain/usecases/send_message.dart';

class ChatRepositoryImpl implements ChatRepository {
  const ChatRepositoryImpl(this._remoteDataSource);

  final ChatRemoteDataSource _remoteDataSource;

  @override
  ResultStreamList<ChatRoom> watchChatRooms() {
    return _remoteDataSource
        .watchChatRooms()
        .map<Either<Failure, List<ChatRoom>>>((models) {
          final entities = models
              .map((model) => model.toEntity())
              .toList();
          return right(entities);
        })
        .handleError((dynamic error) {
          return left<Failure, List<ChatRoom>>(
            Failure.server(error.toString()),
          );
        });
  }

  @override
  ResultFuture<ChatRoom> createChatRoom(
    CreateChatRoomParams params,
  ) async {
    try {
      final model = await _remoteDataSource.createChatRoom(params);
      return right(model.toEntity());
    } on ChatException catch (e) {
      return left(Failure.chat(e.message));
    }
  }

  @override
  ResultStreamList<Message> watchMessages(String roomId) {
    return _remoteDataSource
        .watchMessages(roomId)
        .map<Either<Failure, List<Message>>>((models) {
          final entities = models
              .map((model) => model.toEntity())
              .toList();
          return right(entities);
        })
        .handleError((dynamic error) {
          return left<Failure, List<Message>>(
            Failure.server(error.toString()),
          );
        });
  }

  @override
  VoidFuture sendMessage(SendMessageParams params) async {
    try {
      await _remoteDataSource.sendMessage(params);
      return right(unit);
    } on ChatException catch (e) {
      return left(Failure.chat(e.message));
    }
  }
}
