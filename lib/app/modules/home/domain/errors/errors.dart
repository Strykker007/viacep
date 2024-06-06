abstract class Failure implements Exception {
  String? get message;
}

class GetAddressError extends Failure {
  @override
  final String? message;

  GetAddressError({this.message});
}

class ServerFailure extends Failure {
  @override
  final String? message;

  ServerFailure({this.message});
}
