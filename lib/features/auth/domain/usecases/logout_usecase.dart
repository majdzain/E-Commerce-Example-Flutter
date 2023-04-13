import 'package:dartz/dartz.dart';
import 'package:e_commerce_example_flutter/core/errors/failures.dart';
import 'package:e_commerce_example_flutter/features/auth/domain/repositories/auth_repository.dart';

class LogoutUsecase {
  AuthRepository authRepository;
  LogoutUsecase({
    required this.authRepository,
  });
  Future<Either<Unit, Failure>> call() async {
    return await authRepository.logout();
  }
}
