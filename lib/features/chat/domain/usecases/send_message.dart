import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/chat/domain/repositories/chat_repository.dart';

part 'send_message.freezed.dart';

@freezed
abstract class SendMessageParams with _$SendMessageParams {
  const factory SendMessageParams({
    required String roomId,
    required String text,
  }) = _SendMessageParams;
}

class SendMessageUseCase implements UseCase<void, SendMessageParams> {
  const SendMessageUseCase(this._repository);

  final ChatRepository _repository;

  @override
  ResultFuture<void> call(SendMessageParams params) {
    return _repository.sendMessage(params);
  }
}
