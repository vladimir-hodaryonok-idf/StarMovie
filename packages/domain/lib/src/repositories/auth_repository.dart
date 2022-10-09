import 'package:domain/domain.dart';

abstract class AuthRepository {
  Future<bool> isLoginAndPasswordCorrect(UserEmailPass user);

  Future<UserEmailPass?> loginWithGoogle();

  Future<UserEmailPass?> loginWithFaceBook();
}
