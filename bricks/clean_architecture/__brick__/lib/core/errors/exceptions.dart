class ServerException implements Exception{
 final String message;
 final String? code;

  ServerException({required this.message, this.code});
   @override
  String toString() {
    return message;
  }
}



class AuthencationException implements Exception{
 final String message;

  AuthencationException({required this.message});
   @override
  String toString() {
    return message;
  }
}
