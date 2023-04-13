import 'package:dartz/dartz.dart';
import 'package:e_commerce_example_flutter/core/errors/failures.dart';
import 'package:e_commerce_example_flutter/features/auth/domain/models/user.dart';
import 'package:e_commerce_example_flutter/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase {
  AuthRepository authRepository;
  LoginUsecase({
    required this.authRepository,
  });
  Future<Either<User, Failure>> call(String email, String password) async {
    return await authRepository.login(email, password);
  }
}
