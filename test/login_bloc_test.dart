// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:domain/domain.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/navigation/app_navigator.dart';
import 'package:needle_di/needle_di.dart';

import 'login_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<LogButtonUseCase>(),
  MockSpec<GlobalKey<FormState>>(),
  MockSpec<ResultToLocalizedMapper>(),
  MockSpec<LoginWithEmailAndPassUseCase>(),
  MockSpec<LoginGoogleUseCase>(),
  MockSpec<LoginFaceBookUseCase>(),
  MockSpec<AppNavigator>(),
])
void main() {
  final appNav = MockAppNavigator();
  Needle.instance.registerSingleton<AppNavigator>(instance: appNav);
  final loginWithEmail = MockLoginWithEmailAndPassUseCase();
  final loginGoogleUseCase = MockLoginGoogleUseCase();
  final loginFaceBookUseCase = MockLoginFaceBookUseCase();
  final logButton = MockLogButtonUseCase();
  final LoginBloc bloc = LoginBloc(
    loginWithEmail,
    loginGoogleUseCase,
    loginFaceBookUseCase,
    logButton,
    ValidateLoginFormUseCase(),
    MockGlobalKey(),
    MockResultToLocalizedMapper(),
  );
  group('Auth_Test', () {
    test('ValidationFail_Test', () async {
      bloc.onPasswordChange('fake');
      bloc.onLoginChange('fake');
      await bloc.auth();
      verify(logButton(any)).called(1);
      verifyNever(loginWithEmail(any));
      verifyNever(appNav.push(any));
    });
    test('ValidationSuccess_Test', () async {
      bloc.validationResult = null;
      bloc.onLoginChange('test@email.com');
      bloc.onPasswordChange('passsword123');
      when(loginWithEmail(any)).thenAnswer((_) => Future.value());
      await bloc.auth();
      verify(logButton(any)).called(1);
      verify(loginWithEmail(any)).called(1);
      verify(appNav.push(any)).called(1);
    });

    test('LoginWithEmailFailure_Test', () async {
      bloc.validationResult = null;
      bloc.onLoginChange('test@email.com');
      bloc.onPasswordChange('passsword123');
      when(await loginWithEmail(any))
          .thenThrow(const ValidationException(ValidationResult()));
      await bloc.auth();
      verify(logButton(any)).called(1);
      verify(loginWithEmail(any)).called(1);
      verifyNever(appNav.push(any));
    });
  });
  group('GoogleAuth_Test', () {
    test('Success_Test', () async {
      when(loginGoogleUseCase()).thenAnswer((_) => Future.value());
      await bloc.authGoogle();
      verify(logButton(any)).called(1);
      verify(loginGoogleUseCase()).called(1);
      verify(appNav.push(any)).called(1);
    });
    test('Failure_Test', () async {
      when(loginGoogleUseCase())
          .thenThrow(const ValidationException(ValidationResult()));
      await bloc.authGoogle();
      verify(logButton(any)).called(1);
      verify(loginGoogleUseCase()).called(1);
      verifyNever(appNav.push(any));
    });
  });
  group('Facebook_Test', () {
    test('Success_Test', () async {
      when(loginFaceBookUseCase()).thenAnswer((_) => Future.value());
      await bloc.authFacebook();
      verify(logButton(any)).called(1);
      verify(loginFaceBookUseCase()).called(1);
      verify(appNav.push(any)).called(1);
    });
    test('Failure_Test', () async {
      when(loginFaceBookUseCase())
          .thenThrow(const ValidationException(ValidationResult()));
      await bloc.authFacebook();
      verify(logButton(any)).called(1);
      verify(loginFaceBookUseCase()).called(1);
      verifyNever(appNav.push(any));
    });
  });
}
