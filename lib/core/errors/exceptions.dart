// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServerException implements Exception {
  int? statusCode;
  String? error;
  ServerException({this.statusCode, this.error});
}

class LoginException implements Exception {
  List<String>? messages;
  LoginException({
    this.messages,
  });
}

class RegisterException implements Exception {
  List<String>? messages;
  RegisterException({
    this.messages,
  });
}

class CheckTokenException implements Exception {}

class ProductsException implements Exception {}

class ProductException implements Exception {
  int? statusCode;
  ProductException({
    this.statusCode,
  });
}

class UnauthenticatedException implements Exception {}
