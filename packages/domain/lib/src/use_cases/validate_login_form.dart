import 'package:domain/domain.dart';
import 'package:domain/src/use_cases/base/in_out_use_case.dart';

class ValidateLoginFormUseCase
    implements InOutUseCase<UserEmailPass, ValidationResult> {
  @override
  ValidationResult call(UserEmailPass form) => ValidationResult(
        login: _validateLogin(form.login),
        password: _validatePassword(form.password),
      );

  String? _validateLogin(String login) {
    if (_validate(_emptyStringPattern, login)) return _loginIsRequired;
    return (_validate(_loginFormatPattern, login)) ? null : _invalidLoginFormat;
  }

  String? _validatePassword(String password) {
    if (_validate(_emptyStringPattern, password)) return _passwordIsRequired;
    return _validate(_passwordPattern, password) ? null : _invalidPassword;
  }

  bool _validate(String pattern, String value) {
    final RegExp validator = RegExp(pattern);
    final matches = validator.allMatches(value);
    return matches.isNotEmpty;
  }

  static const _loginIsRequired = 'Login is required';
  static const _invalidLoginFormat =
      'Login should be \'Email\' and at least 8 symbols';
  static const _passwordIsRequired = 'Password is required';
  static const _invalidPassword = 'Invalid password';
  static const _emptyStringPattern = '^\$';
  static const _passwordPattern =
      '^([a-z]|[A-Z]|[0-9]){7}([a-z]|[A-Z]|[0-9])+\$';
  static const _loginFormatPattern =
      '^(([a-z]|[A-Z]|[0-9])([a-z]|[A-Z]|[0-9])+)@(([a-z]|[A-Z]|[0-9]){1}|([a-z]|[A-Z]|[0-9])+)+(\.([a-z]|[A-Z]){2,3})\$';
}
