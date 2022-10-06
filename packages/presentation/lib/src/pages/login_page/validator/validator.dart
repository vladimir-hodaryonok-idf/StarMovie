class LoginValidator {
  bool call(String login, String password) =>
      login.isNotEmpty && password.isNotEmpty;
}
