class LoginData {
  final String errorMessage;
  final String login;
  final String password;

  const LoginData({
    required this.errorMessage,
    required this.login,
    required this.password,
  });

  LoginData copyWith({
    String? errorMessage,
    String? login,
    String? password,
  }) {
    return LoginData(
      errorMessage: errorMessage ?? this.errorMessage,
      login: login ?? this.login,
      password: password ?? this.password,
    );
  }

  factory LoginData.init() => const LoginData(
        errorMessage: '',
        login: '',
        password: '',
      );
}
