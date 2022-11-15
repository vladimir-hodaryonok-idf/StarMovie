import 'package:data/src/constants/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

abstract class FacebookAuthService {
  Future<OAuthCredential?> login();

  Future<Map<String, dynamic>> getUserData();
}

class FacebookAuthServiceImpl implements FacebookAuthService {
  final FacebookAuth facebookAuth;

  const FacebookAuthServiceImpl(this.facebookAuth);

  @override
  Future<Map<String, dynamic>> getUserData() => facebookAuth.getUserData();

  @override
  Future<OAuthCredential?> login() async {
    final LoginResult loginResult = await facebookAuth.login(permissions: [
      DataStrings.email,
      DataStrings.public_profile,
      DataStrings.user_birthday,
    ]);
    if (loginResult.status == LoginStatus.success) {
      return FacebookAuthProvider.credential(
          loginResult.accessToken?.token ?? '');
    }
    return null;
  }
}
