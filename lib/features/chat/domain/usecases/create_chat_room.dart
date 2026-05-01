import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/chat/domain/entities/chat_room.dart';
import 'package:petter/features/chat/domain/repositories/chat_repository.dart';

class CreateChatRoomParams {
  const CreateChatRoomParams({required this.members});

  final List<String> members;
}

class CreateChatRoomUseCase
    implements UseCase<ChatRoom, CreateChatRoomParams> {
  const CreateChatRoomUseCase(this._repository);

  final ChatRepository _repository;
  @override
  ResultFuture<ChatRoom> call(CreateChatRoomParams params) {
    return _repository.createChatRoom(params);
  }
}
