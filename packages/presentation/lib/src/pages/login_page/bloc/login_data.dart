class LoginData {
  final String login;
  final String password;

  const LoginData({
    required this.login,
    required this.password,
  });

  LoginData copyWith({
    String? login,
    String? password,
  }) =>
      LoginData(
        login: login ?? this.login,
        password: password ?? this.password,
      );

  factory LoginData.init() => const LoginData(
        login: '',
        password: '',
      );
}
