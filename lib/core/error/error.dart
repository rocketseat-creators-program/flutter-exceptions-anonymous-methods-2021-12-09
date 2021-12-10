class Failure implements Exception {
  final String? message;

  Failure({this.message});
}

class LoginFailure extends Failure {
  LoginFailure({required String message}) : super(message: message);
}

class NetworkFailue extends Failure {}
