import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/chat/domain/entities/chat_room.dart';
import 'package:petter/features/chat/domain/repositories/chat_repository.dart';

class WatchChatRoomsUseCase
    implements StreamUseCase<List<ChatRoom>, NoParams> {
  const WatchChatRoomsUseCase(this._repository);

  final ChatRepository _repository;

  @override
  ResultStreamList<ChatRoom> call(NoParams params) {
    return _repository.watchChatRooms();
  }
}
