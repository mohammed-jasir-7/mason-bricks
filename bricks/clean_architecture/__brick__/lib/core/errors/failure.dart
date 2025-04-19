abstract class Failure {
  final String errorMessage;
  final String? code;
  const Failure({required this.errorMessage,this.code});
}

class ServerFailure extends Failure {
  ServerFailure({required String errorMessage,String? code})
      : super(errorMessage: errorMessage,code:code);
}
class NetworkFailure extends Failure {
  NetworkFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}
class FormatFailure extends Failure {
  FormatFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}
class LocationUnavailableFailure extends Failure {
  LocationUnavailableFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}

class LocalStorageFailure extends Failure {
  LocalStorageFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}
class LocationFailure extends Failure {
  LocationFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}
class AuthenticationFailure extends Failure {
  AuthenticationFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}


