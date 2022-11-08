// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:domain/domain.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/const/events_strings.dart';
import 'package:presentation/presentation.dart';

import 'login_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<LoginWithEmailAndPassUseCase>(),
  MockSpec<LoginGoogleUseCase>(),
  MockSpec<LoginFaceBookUseCase>(),
  MockSpec<LogButtonUseCase>(),
  MockSpec<ValidateLoginFormUseCase>(),
  MockSpec<GlobalKey<FormState>>(),
  MockSpec<ResultToLocalizedMapper>(),
  MockSpec<EventName>(),
])
void main() {
    final LoginWithEmailAndPassUseCase loginWithEmailAndPass =
        MockLoginWithEmailAndPassUseCase();
    final LoginGoogleUseCase loginGoogleUseCase = MockLoginGoogleUseCase();
    final LoginFaceBookUseCase loginFaceBookUseCase =
        MockLoginFaceBookUseCase();
    final LogButtonUseCase logButton = MockLogButtonUseCase();
    final ValidateLoginFormUseCase formValidator =
        MockValidateLoginFormUseCase();
    final GlobalKey<FormState> formKey = MockGlobalKey();
    final ResultToLocalizedMapper localizationResultMapper =
        MockResultToLocalizedMapper();
    final LoginBloc bloc = LoginBloc(
      loginWithEmailAndPass,
      loginGoogleUseCase,
      loginFaceBookUseCase,
      logButton,
      formValidator,
      formKey,
      localizationResultMapper,
    );
    when(logButton(argThat())).thenAnswer((_) => Future.value());
    group('Auth_Test', () {
      test('SuccessTest', () {

      });
    });
}
