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
//
// @GenerateNiceMocks([
//   MockSpec<LogButtonUseCase>(),
//   // MockSpec<GlobalKey<FormState>>(),
//   // MockSpec<ResultToLocalizedMapper>(),
//   MockSpec<LoginWithEmailAndPassUseCase>(),
//   MockSpec<LoginGoogleUseCase>(),
//   MockSpec<LoginFaceBookUseCase>(),
//   MockSpec<AppNavigator>(),
// ])
// void main() {
//   final appNav = MockAppNavigator();
//   Needle.instance.registerSingleton<AppNavigator>(instance: appNav);
//   final formKey = GlobalKey<FormState>();
//   final bloc = LoginBloc(
//     MockLoginWithEmailAndPassUseCase(),
//     MockLoginGoogleUseCase(),
//     MockLoginFaceBookUseCase(),
//     MockLogButtonUseCase(),
//     ValidateLoginFormUseCase(),
//     formKey,
//     MockResultToLocalizedMapper(),
//   );
//
//   Needle.instance.registerSingleton<LoginBloc>(
//       instance: bloc);
//
//   testWidgets('LoginWidget_Test', (widgetTester) async {
//     await widgetTester.pumpWidget(
//       MaterialApp(
//         localizationsDelegates: const [
//           S.delegate,
//           GlobalMaterialLocalizations.delegate,
//           GlobalWidgetsLocalizations.delegate,
//           GlobalCupertinoLocalizations.delegate,
//         ],
//         supportedLocales: S.delegate.supportedLocales,
//         home: Scaffold(
//           appBar: AppBar(
//             title: Text('test'),
//           ),
//           body: Login(),
//         ),
//       ),
//     );
//     final loginTextField = find.text('test',skipOffstage: false);
//     expect(loginTextField, findsOneWidget);
//   });
//
//
// }

void main() {
  testWidgets('MyWidget has a title and message', (tester) async {
    await tester.pumpWidget(const MyWidget(title: 'T', message: 'M'));
    final titleFinder = find.text('Flutter Demo');
    final messageFinder = find.text('M');

    // Use the `findsOneWidget` matcher provided by flutter_test to verify
    // that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
}
class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}