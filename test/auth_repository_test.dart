// ignore_for_file: depend_on_referenced_packages
import 'package:data/data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:domain/domain.dart';

import 'auth_repository_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<FirebaseAuthService>(),
    MockSpec<FireStoreService>(),
    MockSpec<GoogleAuthService>(),
    MockSpec<FacebookAuthService>(),
    MockSpec<UserEmailPass>(),
    MockSpec<OAuthCredential>(),
  ],
)
void main() {
  final firebaseFirestoreService = MockFireStoreService();
  final firebaseAuth = MockFirebaseAuthService();
  final facebookAuth = MockFacebookAuthService();
  final googleAuth = MockGoogleAuthService();
  final user = MockUserEmailPass();

  final AuthRepository authRepository = AuthRepositoryImpl(
    firebaseAuth: firebaseAuth,
    firebaseFirestore: firebaseFirestoreService,
    facebookAuth: facebookAuth,
    googleAuthService: googleAuth,
  );

  const userDataResponse = {
    'login': 'anyLogin',
    'password': 'anyPassword',
  };

  group('LoginWithFaceBook_Test', () {
    test('SuccessTest', () async {
      when(facebookAuth.login()).thenAnswer((_) async => MockOAuthCredential());
      when(facebookAuth.getUserData())
          .thenAnswer((_) async => userDataResponse);
      when(firebaseAuth.signInWithCredential(MockOAuthCredential()))
          .thenAnswer((_) => Future.value());
      expect(await authRepository.loginWithFaceBook(), isNotNull);
      verify(facebookAuth.getUserData()).called(1);
      verify(firebaseAuth.signInWithCredential(any)).called(1);
    });
    test('FailureTest', () async {
      clearInteractions(facebookAuth);
      when(facebookAuth.login()).thenAnswer((_) async => null);
      expect(await authRepository.loginWithFaceBook(), null);
      verifyNever(facebookAuth.getUserData());
      verifyNever(firebaseAuth.signInWithCredential(any));
    });
  });

  group('LoginWithGoogle_Test', () {
    test('SuccessTest', () async {
      when(googleAuth.loginAndAuthenticate())
          .thenAnswer((_) async => MockOAuthCredential());
      when(googleAuth.getUserData()).thenReturn(userDataResponse);
      when(firebaseAuth.signInWithCredential(any))
          .thenAnswer((_) => Future.value());
      expect(await authRepository.loginWithGoogle(), isNotNull);
      verify(googleAuth.getUserData()).called(1);
      verify(firebaseAuth.signInWithCredential(any)).called(1);
    });
    test('FailureTest', () async {
      clearInteractions(googleAuth);
      when(googleAuth.loginAndAuthenticate()).thenAnswer((_) async => null);
      expect(await authRepository.loginWithGoogle(), null);
      verifyNever(googleAuth.getUserData());
      verifyNever(firebaseAuth.signInWithCredential(any));
    });
  });

  group('IsLoginSuccess_Test', () {
    test('SuccessTest', () async {
      when(firebaseFirestoreService.findUserInCloud(any))
          .thenAnswer((_) async => [userDataResponse]);
      expect(await authRepository.isLoginAndPasswordCorrect(user), true);
    });
    test('FailureTest', () async {
      when(firebaseFirestoreService.findUserInCloud(any))
          .thenAnswer((_) async => []);
      expect(await authRepository.isLoginAndPasswordCorrect(user), false);
    });
  });
}
