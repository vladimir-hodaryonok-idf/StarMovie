import 'package:data/src/constants/strings.dart';
import 'package:domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesLocalRepositoryImpl implements PreferencesLocalRepository {
  final SharedPreferences sharedPreferences;

  const PreferencesLocalRepositoryImpl({required this.sharedPreferences});

  @override
  Future<void> saveLoggedUser(UserEmailPass user) async {
    Future.wait([
      sharedPreferences.setString(DataStrings.loginKey, user.login),
      sharedPreferences.setString(DataStrings.passwordKey, user.password)
    ]);
  }
}
