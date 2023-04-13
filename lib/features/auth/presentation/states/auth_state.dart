import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:e_commerce_example_flutter/features/auth/domain/models/user.dart';
part 'auth_state.freezed.dart';

extension DetectLoadingState on AuthState {
  bool get isLoading =>
      this is _AuthStateLoggingIn ||
      this is _AuthStateRegistering ||
      this is _AuthStateCheckingToken ||
      this is _AuthStateLoggingOut;
}

extension DetectDoneState on AuthState {
  bool get isLoggedIn => this is _AuthStateLoggedIn;
  bool get isLoggedOut => this is _AuthStateLoggedOut;
  bool get isRegistered => this is _AuthStateRegistered;
  bool get isChecked => this is _AuthStateChecked;
}

extension DetectErrorState on AuthState {
  String? get getLoginError => (this is _AuthStateLoginError)
      ? (this as _AuthStateLoginError).error
      : null;
  String? get getLogoutError => (this is _AuthStateLogoutError)
      ? (this as _AuthStateLogoutError).error
      : null;
  String? get getRegisterError => (this is _AuthStateRegisterError)
      ? (this as _AuthStateRegisterError).error
      : null;
  String? get getCheckTokenError => (this is _AuthStateCheckTokenError)
      ? (this as _AuthStateCheckTokenError).error
      : null;
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _AuthStateInitial;
  const factory AuthState.loggingIn() = _AuthStateLoggingIn;
  const factory AuthState.loggedIn({required User user}) = _AuthStateLoggedIn;
  const factory AuthState.loginError({List<String>? errors, String? error}) =
      _AuthStateLoginError;
  const factory AuthState.loggingOut() = _AuthStateLoggingOut;
  const factory AuthState.loggedOut() = _AuthStateLoggedOut;
  const factory AuthState.logoutError({required String error}) =
      _AuthStateLogoutError;
  const factory AuthState.registering() = _AuthStateRegistering;
  const factory AuthState.registered({required User user}) =
      _AuthStateRegistered;
  const factory AuthState.registerError({List<String>? errors, String? error}) =
      _AuthStateRegisterError;
  const factory AuthState.checkingToken() = _AuthStateCheckingToken;
  const factory AuthState.checked({required User user}) = _AuthStateChecked;
  const factory AuthState.checkTokenError({required String error}) =
      _AuthStateCheckTokenError;
  const factory AuthState.unnauthenticated() = _AuthStateUnauthenticatedError;
}
