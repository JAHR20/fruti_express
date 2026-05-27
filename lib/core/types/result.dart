import 'package:fpdart/fpdart.dart';
import '../errors/failures.dart';

/// Resultado asincrónico funcional (Lazy)
typedef ResultTask<T> = TaskEither<Failure, T>;

/// Resultado síncrono
typedef Result<T> = Either<Failure, T>;

typedef ResultStream<T> = Stream<Either<Failure, T>>;

typedef ResultTaskUnit = ResultTask<Unit>;
