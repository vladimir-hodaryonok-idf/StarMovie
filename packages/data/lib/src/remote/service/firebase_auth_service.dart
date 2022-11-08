import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthService {
  Future<void> signInWithCredential(OAuthCredential credential);
}

class FirebaseAuthServiceImpl implements FirebaseAuthService {
  final FirebaseAuth firebaseAuth;

  const FirebaseAuthServiceImpl(this.firebaseAuth);

  @override
  Future<void> signInWithCredential(OAuthCredential credential) =>
      firebaseAuth.signInWithCredential(credential);
}
