import 'package:domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _loginKey = 'loggedUserEmail';
const _passwordKey = 'loggedUserPassword';

class PreferencesLocalRepositoryImpl implements PreferencesLocalRepository {
  final SharedPreferences sharedPreferences;

  const PreferencesLocalRepositoryImpl({required this.sharedPreferences});

  @override
  Future<void> saveLoggedUser(UserEmailPass user) async {
    Future.wait([
      sharedPreferences.setString(_loginKey, user.login),
      sharedPreferences.setString(_passwordKey, user.password)
    ]);
  }
}
