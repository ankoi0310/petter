import 'package:petter/core/utils/typedefs.dart';

abstract class UseCase<ReturnType, Params> {
  ResultFuture<ReturnType> call(Params params);
}

abstract class StreamUseCase<ReturnType, Params> {
  ResultStream<ReturnType> call(Params params);
}

class NoParams {}
