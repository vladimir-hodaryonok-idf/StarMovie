// ignore_for_file: depend_on_referenced_packages
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:presentation/generated/l10n.dart';
import 'package:star_movie/sand_box.dart' as app;

void main() {
  if (Platform.isAndroid) {
    const loginKey = 'login';
    const passwordKey = 'password';
    const personalBtnLabel = 'Personal';
    const loggedWidgetLabel = 'Successfully logged in';
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    group('Login_Test', () {
      testWidgets('Login', (widgetTester) async {
        final Map<String, dynamic> secrets = await readSecret();
        await app.main();
        await widgetTester.pumpAndSettle(const Duration(seconds: 3));
        final personalButton = find.byTooltip(personalBtnLabel);
        await widgetTester.tap(personalButton);

        await widgetTester.pumpAndSettle();
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
        await widgetTester.enterText(loginField, secrets[loginKey]);
        await widgetTester.enterText(passwordField, secrets[passwordKey]);
        await widgetTester.tap(loginButton);
        await widgetTester.pumpAndSettle(const Duration(seconds: 2));

        final successLoggedAndNavigated = find.text(loggedWidgetLabel);
        expect(successLoggedAndNavigated, findsOneWidget);
      });
    });
  }
}

Future<Map<String, dynamic>> readSecret() async {
  const secretsPath = 'login_secrets.json';
  return rootBundle.loadStructuredData<Map<String, dynamic>>(
    secretsPath,
    (value) async => json.decode(value),
  );
}
