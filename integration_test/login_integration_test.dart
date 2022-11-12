// ignore_for_file: depend_on_referenced_packages
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:presentation/generated/l10n.dart';
import 'package:star_movie/production.dart' as app;

void main() {
  if (Platform.isAndroid) {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    group('Login_Test', () {
      testWidgets('Login', (widgetTester) async {
        await app.main();
        await widgetTester.pumpAndSettle(const Duration(seconds: 5));
        final personalButton = find.byTooltip('Personal');
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
        await widgetTester.enterText(loginField, 'vladimir@idfinance.com');
        await widgetTester.enterText(passwordField, 'idfinance');
        await widgetTester.tap(loginButton);
        await widgetTester.pumpAndSettle(const Duration(seconds: 2));

        final successLoggedAndNavigated = find.text('Successfully logged in');
        expect(successLoggedAndNavigated, findsOneWidget);
      });
    });
  }
}
