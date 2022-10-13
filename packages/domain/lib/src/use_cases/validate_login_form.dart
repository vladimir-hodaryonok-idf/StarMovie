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
    const invalidFormat = 'Email length - 7 from a-z,A-Z,0-9,@';
    const loginPattern =
        '^(([a-z]|[A-Z]|[0-9])([a-z]|[A-Z]|[0-9])+)@(([a-z]|[A-Z]|[0-9]){1}|([a-z]|[A-Z]|[0-9])+)+(\.([a-z]|[A-Z]){2,3})\$';
    final RegExp validator = RegExp(loginPattern);
    final matches = validator.allMatches(login);
    return matches.isNotEmpty ? null : invalidFormat;
  }

  String? _validatePassword(String password) {
    const invalidPassword = 'Min. length - 8, only chars and numbers';
    const passwordPattern = '^([a-z]|[A-Z]|[0-9]){7}([a-z]|[A-Z]|[0-9])+\$';
    final RegExp validator = RegExp(passwordPattern);
    final matches = validator.allMatches(password);
    return matches.isNotEmpty ? null : invalidPassword;
  }
}
