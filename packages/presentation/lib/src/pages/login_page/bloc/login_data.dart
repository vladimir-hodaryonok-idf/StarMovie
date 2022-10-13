import 'package:domain/domain.dart';

class LoginData {
  final String errorMessage;
  final String login;
  final String password;
  final String? loginValidation;
  final String? passwordValidation;

  const LoginData({
    required this.errorMessage,
    required this.login,
    required this.password,
    this.loginValidation,
    this.passwordValidation,
  });

  LoginData copyWith({
    String? errorMessage,
    String? login,
    String? password,
  }) =>
      LoginData(
        errorMessage: errorMessage ?? this.errorMessage,
        login: login ?? this.login,
        password: password ?? this.password,
        loginValidation: this.loginValidation,
        passwordValidation: this.passwordValidation,
      );

  LoginData fromValidationResult({required ValidationResult result}) =>
      LoginData(
        errorMessage: this.errorMessage,
        login: this.login,
        password: this.password,
        loginValidation: result.login,
        passwordValidation: result.password,
      );

  factory LoginData.init() => const LoginData(
        errorMessage: '',
        login: '',
        password: '',
      );
}
