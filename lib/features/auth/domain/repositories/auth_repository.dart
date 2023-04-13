import 'package:dartz/dartz.dart';
import 'package:e_commerce_example_flutter/core/errors/failures.dart';
import 'package:e_commerce_example_flutter/features/auth/domain/models/user.dart';

abstract class AuthRepository {
  Future<Either<User, Failure>> login(String email, String password);
  Future<Either<User, Failure>> register(
      String email, String name, String password, String passwordConfirmation);
  Future<Either<Unit, Failure>> logout();
  Future<Either<User, Failure>> checkToken();
}
