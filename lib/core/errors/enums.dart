import 'package:easy_localization/easy_localization.dart';

enum LoginError {
  invalidEmailError,
  credentialsError,
}

List<LoginError> mapLoginErrorsFromMessages(List<String> messages) {
  List<LoginError> errors = [];
  if (messages.contains("These credentials do not match our records.") ||
      (messages.contains("The selected email is invalid.") &&
          !messages.contains("The email must be a valid email address."))) {
    errors.add(LoginError.credentialsError);
  }
  if (messages.contains("The email must be a valid email address.")) {
    errors.add(LoginError.invalidEmailError);
  }
  return errors;
}

List<String> mapUserMessagesFromLoginErrors(List<LoginError> errors) {
  List<String> messages = [];
  if (errors.contains(LoginError.credentialsError)) {
    messages.add('email_password_error');
  }
  if (errors.contains(LoginError.invalidEmailError)) {
    messages.add('invalid_email_error');
  }
  return messages;
}

enum RegisterError {
  takenEmailError,
  invalidEmailError,
  passwordConfirmationError,
  passwordLessError
}

List<RegisterError> mapRegisterErrorsFromMessages(List<String> messages) {
  List<RegisterError> errors = [];
  if (messages.contains("The email must be a valid email address.")) {
    errors.add(RegisterError.invalidEmailError);
  }
  if (messages.contains("The email has already been taken.")) {
    errors.add(RegisterError.takenEmailError);
  }
  if (messages.contains("The password confirmation does not match.")) {
    errors.add(RegisterError.passwordConfirmationError);
  }
  if (messages.contains("The password must be at least 8 characters.")) {
    errors.add(RegisterError.passwordLessError);
  }

  return errors;
}

List<String> mapUserMessagesFromRegisterErrors(List<RegisterError> errors) {
  List<String> messages = [];
  if (errors.contains(RegisterError.invalidEmailError)) {
    messages.add('invalid_email_error');
  }
  if (errors.contains(RegisterError.takenEmailError)) {
    messages.add('taken_email_error');
  }
  if (errors.contains(RegisterError.passwordConfirmationError)) {
    messages.add('passwords_match_error');
  }
  if (errors.contains(RegisterError.passwordLessError)) {
    messages.add('password_less_error');
  }

  return messages;
}

enum ProductError {
  notFoundError,
}

ProductError? getProductErrorFromStatusCode(int statusCode) {
  if (statusCode == 404) {
    return ProductError.notFoundError;
  }
  return null;
}

String? getUserMessageFromProductError(ProductError error) {
  if (error == ProductError.notFoundError) {
    return 'product_not_found';
  }
  return null;
}
