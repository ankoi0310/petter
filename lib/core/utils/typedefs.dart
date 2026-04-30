import 'package:fpdart/fpdart.dart';
import 'package:petter/core/error/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultFutureList<T> = ResultFuture<List<T>>;

typedef VoidFuture = ResultFuture<Unit>;

typedef ResultStream<T> = Stream<Either<Failure, T>>;
typedef ResultStreamList<T> = ResultStream<List<T>>;

typedef ServerTask<T> = TaskEither<Failure, T>;

typedef JsonData = Map<String, dynamic>;
