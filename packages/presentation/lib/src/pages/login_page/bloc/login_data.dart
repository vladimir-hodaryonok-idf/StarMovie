import 'package:domain/domain.dart';

class LoginData {
  final String login;
  final String password;
  final String? loginValidation;
  final String? passwordValidation;

  const LoginData({
    required this.login,
    required this.password,
    this.loginValidation,
    this.passwordValidation,
  });

  LoginData copyWith({
    String? login,
    String? password,
    String? loginValidation,
    String? passwordValidation,
  }) =>
      LoginData(
        login: login ?? this.login,
        password: password ?? this.password,
        loginValidation: loginValidation,
        passwordValidation: passwordValidation,
      );

  LoginData fromValidationResult({required ValidationResult result}) =>
      LoginData(
        login: this.login,
        password: this.password,
        loginValidation: result.login,
        passwordValidation: result.password,
      );

  factory LoginData.init() => const LoginData(
        login: '',
        password: '',
      );
}
