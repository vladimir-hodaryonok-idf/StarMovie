import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class GoogleAuthService {
  Future<OAuthCredential?> loginAndAuthenticate();
  Map<String,dynamic>? getUserData();
}

class GoogleAuthServiceImpl implements GoogleAuthService {
  GoogleSignInAccount? googleUser;

  @override
  Future<OAuthCredential?> loginAndAuthenticate() async {
    googleUser = await GoogleSignIn(scopes: <String>["email"]).signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      return GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
    }
    return null;
  }

  @override
  Map<String, dynamic>? getUserData() {
    if(googleUser != null){
      return {
        'email':googleUser!.email,
        'id':googleUser!.id,
      };
    }
    return null;
  }
}
