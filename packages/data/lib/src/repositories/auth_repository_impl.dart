import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

const _usersCollection = 'StarMovie_users';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final FacebookAuth facebookAuth;

  const AuthRepositoryImpl({
    required this.firebaseAuth,
    required this.firebaseFirestore,
    required this.facebookAuth,
  });

  @override
  Future<bool> isLoginAndPasswordCorrect(UserEmailPass user) async {
    const login = 'login';
    const password = 'password';
    final QuerySnapshot<Map<String, dynamic>> query = await firebaseFirestore
        .collection(_usersCollection)
        .where(login, isEqualTo: user.login)
        .where(password, isEqualTo: user.password)
        .get();
    if(query.docs.isEmpty) return false;
    return true;
  }

  @override
  Future<UserEmailPass?> loginWithFaceBook() async {
    final LoginResult loginResult = await facebookAuth
        .login(permissions: ['email', 'public_profile', 'user_birthday']);
    final user = await facebookAuth.getUserData();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken?.token ?? '');

    firebaseAuth.signInWithCredential(facebookAuthCredential);
    return UserEmailPass(
      user['email'] ?? '',
      user['id'] ?? '',
    );
  }

  @override
  Future<UserEmailPass?> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    if (googleUser == null) return null;
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    firebaseAuth.signInWithCredential(credential);
    return UserEmailPass(
      googleUser.email,
      googleUser.id,
    );
  }
}
