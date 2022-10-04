import 'package:domain/domain.dart';

abstract class AuthRepository {
  Future<List<UserEmailPass>> fetchUsers();

  Future<UserEmailPass?> loginWithGoogle();

  Future<UserEmailPass?> loginWithFaceBook();
}
