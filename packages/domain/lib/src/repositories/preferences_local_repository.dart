import 'package:domain/domain.dart';

abstract class PreferencesLocalRepository{
  Future<void> saveLoggedUser(UserEmailPass user);
}