import 'package:domain/domain.dart';
import 'package:domain/src/use_cases/base/in_use_case.dart';

class ValidateLoginFormUseCase implements InUseCase<UserEmailPass> {
  @override
  Future<void> call(UserEmailPass form) {
    final validationResult = ValidationResult(
      login: _validateLogin(form.login),
      password: _validatePassword(form.password),
    );
    if (validationResult.isFailure) {
      throw ValidationException(validationResult);
    }
    return Future.value();
  }

  String? _validateLogin(String login) {
    if (login.trim().isEmpty) {
      return ValidationAndLogin.loginIsRequired;
    }
    if (login.length < _loginMinLength) {
      return ValidationAndLogin.loginMinLength;
    }
    return (_validate(_loginFormatPattern, login))
        ? null
        : ValidationAndLogin.invalidLoginFormat;
  }

  String? _validatePassword(String password) {
    if (password.trim().isEmpty) {
      return ValidationAndLogin.passwordIsRequired;
    }
    if (password.length < _passwordMinLength) {
      return ValidationAndLogin.passwordMinLength;
    }
    return _validate(_passwordPattern, password)
        ? null
        : ValidationAndLogin.invalidPassword;
  }

  bool _validate(String pattern, String value) {
    final RegExp validator = RegExp(pattern);
    return validator.hasMatch(value);
  }

  static const _passwordMinLength = 7;

  static const _loginMinLength = 8;

  static const _passwordPattern =
      '^([a-z]|[A-Z]|[0-9]){7}([a-z]|[A-Z]|[0-9])+\$';
  static const _loginFormatPattern =
      '^(([a-z]|[A-Z]|[0-9])([a-z]|[A-Z]|[0-9])+)@(([a-z]|[A-Z]|[0-9]){1}|([a-z]|[A-Z]|[0-9])+)+(\.([a-z]|[A-Z]){2,3})\$';
}
