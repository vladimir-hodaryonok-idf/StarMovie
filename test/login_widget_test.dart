// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:presentation/presentation.dart';
import 'package:domain/domain.dart';
import 'package:needle_di/needle_di.dart';
import 'package:presentation/src/navigation/app_navigator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:presentation/generated/l10n.dart';

import 'login_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<LogButtonUseCase>(),
  MockSpec<LoginWithEmailAndPassUseCase>(),
  MockSpec<LoginGoogleUseCase>(),
  MockSpec<LoginFaceBookUseCase>(),
  MockSpec<AppNavigator>(),
])
void main() {
  final appNav = MockAppNavigator();
  Needle.instance.registerSingleton<AppNavigator>(instance: appNav);
  Needle.instance.registerFactory<LoginBloc>(
    () => LoginBloc(
      MockLoginWithEmailAndPassUseCase(),
      MockLoginGoogleUseCase(),
      MockLoginFaceBookUseCase(),
      MockLogButtonUseCase(),
      ValidateLoginFormUseCase(),
      GlobalKey<FormState>(),
      ResultToLocalizedMapper(),
    ),
  );

  testWidgets('EmptyFieldTest', (widgetTester) async {
    await widgetTester.pumpWidget(const TestWidget(child: Login()));

    await widgetTester.idle();
    await widgetTester.pump();
    await widgetTester.pump(const Duration(seconds: 1));

    final loginButton = find.widgetWithText(ElevatedButton, S.current.loginBtn);

    await widgetTester.tap(loginButton);
    await widgetTester.pump();

    final loginError = find.text(S.current.loginIsRequired);
    final passwordError = find.text(S.current.passwordIsRequired);

    expect(loginError, findsOneWidget);
    expect(passwordError, findsOneWidget);
  });

  testWidgets('InvalidInput', (widgetTester) async {
    const invalidLogin = 'invalidLogin';
    const invalidPassword = 'invalid%Password';
    await widgetTester.pumpWidget(const TestWidget(child: Login()));

    await widgetTester.idle();
    await widgetTester.pump();
    await widgetTester.pump(const Duration(seconds: 1));

    final loginButton = find.widgetWithText(
      ElevatedButton,
      S.current.loginBtn,
    );
    final loginField = find.widgetWithText(
      TextFormField,
      S.current.loginUserName,
    );
    final passwordField = find.widgetWithText(
      TextFormField,
      S.current.loginPassword,
    );
    await widgetTester.enterText(loginField, invalidLogin);
    await widgetTester.enterText(passwordField, invalidPassword);
    await widgetTester.tap(loginButton);
    await widgetTester.pump();

    final loginError = find.text(S.current.invalidLoginFormat);
    final passwordError = find.text(S.current.invalidPassword);

    expect(loginError, findsOneWidget);
    expect(passwordError, findsOneWidget);
  });
}

class TestWidget extends StatelessWidget {
  const TestWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('en'),
      home: Scaffold(
        body: child,
      ),
    );
  }
}
