import 'package:domain/src/const/validation_and_login_result.dart';

class ValidationResult {
  final String? login;
  final String? password;

  const ValidationResult({
    this.login,
    this.password,
  });

  factory ValidationResult.loginFailure() => ValidationResult(
        login: ValidationAndLogin.invalidLogin,
        password: ValidationAndLogin.invalidPassword,
      );
}
