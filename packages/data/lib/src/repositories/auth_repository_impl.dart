import 'package:data/src/constants/strings.dart';
import 'package:data/src/remote/service/facebook_auth_service.dart';
import 'package:data/src/remote/service/firebase_auth_service.dart';
import 'package:data/src/remote/service/firebase_firerstore_service.dart';
import 'package:data/src/remote/service/google_auth_service.dart';
import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService firebaseAuth;
  final FireStoreService firebaseFirestore;
  final GoogleAuthService googleAuthService;
  final FacebookAuthService facebookAuth;

  const AuthRepositoryImpl({
    required this.firebaseAuth,
    required this.firebaseFirestore,
    required this.facebookAuth,
    required this.googleAuthService,
  });

  @override
  Future<bool> isLoginAndPasswordCorrect(UserEmailPass user) async {
    final usersFromRemote = await firebaseFirestore.findUserInCloud(user);
    return usersFromRemote.isNotEmpty;
  }

  @override
  Future<UserEmailPass?> loginWithFaceBook() async {
    final OAuthCredential? facebookAuthCredential = await facebookAuth.login();
    if (facebookAuthCredential != null) {
      final user = await facebookAuth.getUserData();
      firebaseAuth.signInWithCredential(facebookAuthCredential);
      return UserEmailPass(
        user[DataStrings.email] ?? '',
        user[DataStrings.id] ?? '',
      );
    }
    return null;
  }

  @override
  Future<UserEmailPass?> loginWithGoogle() async {
    final credential = await googleAuthService.loginAndAuthenticate();
    if (credential != null) {
      final googleUser = googleAuthService.getUserData();
      firebaseAuth.signInWithCredential(credential);
      return UserEmailPass(
        googleUser?[DataStrings.email] ?? '',
        googleUser?[DataStrings.id] ?? '',
      );
    }
    return null;
  }
}
