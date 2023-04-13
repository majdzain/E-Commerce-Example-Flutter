// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'enums.dart';

class Failure {}

class ServerFailure extends Failure {
  String? message;
  ServerFailure({
    this.message,
  });
}

class LoginFailure extends Failure {
  List<LoginError>? errors;
  LoginFailure({
    this.errors,
  });
}

class RegisterFailure extends Failure {
  List<RegisterError>? errors;
  RegisterFailure({
    this.errors,
  });
}

class OfflineFailure extends Failure {}

class CheckTokenFailure extends Failure {}

class ProductsFailure extends Failure {}

class ProductFailure extends Failure {
  ProductError? error;
  ProductFailure({
    this.error,
  });
}

class UnauthenticatedFailure extends Failure {}
