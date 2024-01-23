sealed class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  final int code;
  ServerFailure({
    super.message = '',
    this.code = 140,
  });
}
