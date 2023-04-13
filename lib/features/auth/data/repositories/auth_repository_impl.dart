// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_example_flutter/core/errors/enums.dart';
import 'package:e_commerce_example_flutter/core/errors/exceptions.dart';

import 'package:e_commerce_example_flutter/core/errors/failures.dart';
import 'package:e_commerce_example_flutter/core/network/network_info.dart';
import 'package:e_commerce_example_flutter/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:e_commerce_example_flutter/features/auth/domain/models/user.dart';
import 'package:e_commerce_example_flutter/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  NetworkInfo networkInfo;
  AuthRemoteDatasource authRemoteDatasource;
  AuthRepositoryImpl({
    required this.networkInfo,
    required this.authRemoteDatasource,
  });
  @override
  Future<Either<User, Failure>> checkToken() async {
    if (await networkInfo.isConnected) {
      try {
        final mapUser = await authRemoteDatasource.checkToken();
        return Left(User.fromJson(mapUser));
      } on UnauthenticatedException {
        return Right(UnauthenticatedFailure());
      } on ServerException {
        return Right(ServerFailure());
      }
    } else {
      return Right(OfflineFailure());
    }
  }

  @override
  Future<Either<User, Failure>> login(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final mapUser = await authRemoteDatasource.login(email, password);
        return Left(User.fromJson(mapUser));
      } on LoginException catch (e) {
        return Right(LoginFailure(
            errors: e.messages != null
                ? mapLoginErrorsFromMessages(e.messages!)
                : null));
      } on ServerException {
        return Right(ServerFailure());
      }
    } else {
      return Right(OfflineFailure());
    }
  }

  @override
  Future<Either<Unit, Failure>> logout() async {
    if (await networkInfo.isConnected) {
      try {
        await authRemoteDatasource.logout();
        return const Left(unit);
      } on UnauthenticatedException {
        return Right(UnauthenticatedFailure());
      }
    } else {
      return Right(OfflineFailure());
    }
  }

  @override
  Future<Either<User, Failure>> register(String email, String name,
      String password, String passwordConfirmation) async {
    if (await networkInfo.isConnected) {
      try {
        final mapUser = await authRemoteDatasource.register(
            email, name, password, passwordConfirmation);
        return Left(User.fromJson(mapUser));
      } on RegisterException catch (e) {
        return Right(RegisterFailure(
            errors: e.messages != null
                ? mapRegisterErrorsFromMessages(e.messages!)
                : null));
      } on ServerException {
        return Right(ServerFailure());
      }
    } else {
      return Right(OfflineFailure());
    }
  }
}
