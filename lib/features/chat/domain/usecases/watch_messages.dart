import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/chat/domain/entities/message.dart';
import 'package:petter/features/chat/domain/repositories/chat_repository.dart';

class WatchMessagesUseCase
    implements StreamUseCase<List<Message>, String> {
  const WatchMessagesUseCase(this._repository);

  final ChatRepository _repository;

  @override
  ResultStreamList<Message> call(String roomId) {
    return _repository.watchMessages(roomId);
  }
}
