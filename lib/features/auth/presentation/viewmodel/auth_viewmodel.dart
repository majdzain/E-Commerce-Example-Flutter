// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce_example_flutter/core/errors/failures.dart';
import 'package:e_commerce_example_flutter/features/auth/domain/models/user.dart';

import 'package:e_commerce_example_flutter/features/auth/domain/usecases/check_token_usecase.dart';
import 'package:e_commerce_example_flutter/features/auth/domain/usecases/login_usecase.dart';
import 'package:e_commerce_example_flutter/features/auth/domain/usecases/logout_usecase.dart';
import 'package:e_commerce_example_flutter/features/auth/domain/usecases/register_usecase.dart';
import 'package:e_commerce_example_flutter/features/auth/presentation/states/auth_state.dart';

import '../../../../core/errors/enums.dart';

class AuthViewModel extends StateNotifier<AuthState> {
  LoginUsecase loginUsecase;
  RegisterUsecase registerUsecase;
  LogoutUsecase logoutUsecase;
  CheckTokenUsecase checkTokenUsecase;
  User? user;
  AuthViewModel({
    required this.loginUsecase,
    required this.registerUsecase,
    required this.logoutUsecase,
    required this.checkTokenUsecase,
  }) : super(const AuthState.initial()) {
    checkToken();
  }

  void login(String email, String password) async {
    state = const AuthState.loggingIn();
    final either = await loginUsecase(email, password);
    either.fold((user) {
      this.user = user;
      state = AuthState.loggedIn(user: user);
    }, (failure) {
      if (failure is OfflineFailure) {
        state = AuthState.loginError(error: 'no_internet'.tr());
      } else if (failure is ServerFailure) {
        state = AuthState.loginError(error: 'went_wrong'.tr());
      } else if (failure is LoginFailure) {
        if (failure.errors == null || failure.errors!.isEmpty) {
          state = AuthState.loginError(error: 'went_wrong'.tr());
        } else {
          state = AuthState.loginError(
              errors: mapUserMessagesFromLoginErrors(failure.errors!));
        }
      }
    });
  }

  void register(String email, String name, String password,
      String passwordConfirmation) async {
    state = const AuthState.registering();
    final either =
        await registerUsecase(email, name, password, passwordConfirmation);
    either.fold((user) {
      this.user = user;
      state = AuthState.registered(user: user);
    }, (failure) {
      if (failure is OfflineFailure) {
        state = AuthState.registerError(error: 'no_internet'.tr());
      } else if (failure is ServerFailure) {
        state = AuthState.registerError(error: 'went_wrong'.tr());
      } else if (failure is RegisterFailure) {
        if (failure.errors == null || failure.errors!.isEmpty) {
          state = AuthState.registerError(error: 'went_wrong'.tr());
        } else {
          state = AuthState.registerError(
              errors: mapUserMessagesFromRegisterErrors(failure.errors!));
        }
      }
    });
  }

  void logout() async {
    state = const AuthState.loggingOut();
    final either = await logoutUsecase();
    either.fold((_) {
      user = null;
      state = const AuthState.loggedOut();
    }, (failure) {
      if (failure is OfflineFailure) {
        state = AuthState.logoutError(error: 'no_internet'.tr());
      } else if (failure is UnauthenticatedFailure) {
        state = const AuthState.unnauthenticated();
      }
    });
  }

  void checkToken() async {
    state = const AuthState.checkingToken();
    final either = await checkTokenUsecase();
    either.fold((user) {
      this.user = user;
      state = AuthState.checked(user: user);
    }, (failure) {
      if (failure is OfflineFailure) {
        state = AuthState.checkTokenError(error: 'no_internet'.tr());
      } else if (failure is ServerFailure) {
        state =
            AuthState.checkTokenError(error: 'went_wrong_when_reconnect'.tr());
      } else if (failure is UnauthenticatedFailure) {
        state = const AuthState.unnauthenticated();
      }
    });
  }
}
