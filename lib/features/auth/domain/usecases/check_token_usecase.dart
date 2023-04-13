import 'package:dartz/dartz.dart';
import 'package:e_commerce_example_flutter/core/errors/failures.dart';
import 'package:e_commerce_example_flutter/features/auth/domain/models/user.dart';
import 'package:e_commerce_example_flutter/features/auth/domain/repositories/auth_repository.dart';

class CheckTokenUsecase {
  AuthRepository authRepository;
  CheckTokenUsecase({
    required this.authRepository,
  });
  Future<Either<User, Failure>> call() async {
    return await authRepository.checkToken();
  }
}
