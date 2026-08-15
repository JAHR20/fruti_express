import 'package:fpdart/fpdart.dart';
import '../errors/failures.dart';

typedef ResultTask<T> = TaskEither<Failure, T>;

typedef Result<T> = Either<Failure, T>;

typedef ResultStream<T> = Stream<Either<Failure, T>>;

typedef ResultTaskUnit = ResultTask<Unit>;
