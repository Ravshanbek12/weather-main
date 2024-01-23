import '../either/either.dart';
import '../failure/failure.dart';

sealed class UseCase<Type, Params> {
  const UseCase();

  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {
  const NoParams();
}
