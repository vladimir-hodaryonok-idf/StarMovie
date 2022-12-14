import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/const/events_strings.dart';
import 'package:presentation/src/base_bloc/bloc.dart';
import 'package:presentation/src/navigation/base_arguments.dart';
import 'package:presentation/src/pages/logged_page/logged.dart';
import 'package:presentation/src/pages/login_page/mappers/result_to_localized.dart';

import 'login_data.dart';

abstract class LoginBloc extends Bloc<BaseArguments, LoginData> {
  factory LoginBloc(
    LoginWithEmailAndPassUseCase loginWithEmailAndPass,
    LoginGoogleUseCase loginGoogleUseCase,
    LoginFaceBookUseCase loginFaceBookUseCase,
    LogButtonUseCase logButton,
    ValidateLoginFormUseCase formValidator,
    GlobalKey<FormState> formKey,
    ResultToLocalizedMapper localizationResultMapper,
  ) =>
      _LoginBloc(
        loginWithEmailAndPass,
        loginGoogleUseCase,
        loginFaceBookUseCase,
        logButton,
        formValidator,
        formKey,
        localizationResultMapper,
      );
  ValidationResult? validationResult;

  void onLoginChange(String text);

  void onPasswordChange(String text);

  Future<void> auth();

  Future<void> authGoogle();

  Future<void> authFacebook();

  GlobalKey<FormState> get formKey;

  String? validateLogin();

  String? validatePassword();
  void navigateToLoggedPage();
}

class _LoginBloc extends BlocImpl<BaseArguments, LoginData>
    implements LoginBloc {
  final LoginWithEmailAndPassUseCase loginWithEmailAndPass;
  final LoginGoogleUseCase loginGoogleUseCase;
  final LoginFaceBookUseCase loginFaceBookUseCase;
  final LogButtonUseCase logButton;
  final ValidateLoginFormUseCase formValidator;
  final GlobalKey<FormState> formKey;
  final ResultToLocalizedMapper localizationResultMapper;
  @override
  ValidationResult? validationResult = null;

  _LoginBloc(
    this.loginWithEmailAndPass,
    this.loginGoogleUseCase,
    this.loginFaceBookUseCase,
    this.logButton,
    this.formValidator,
    this.formKey,
    this.localizationResultMapper,
  ) : super(LoginData.init());

  @override
  void init() {
    emit(data: tile);
    super.init();
  }

  @override
  Future<void> auth() async {
    logButton(EventName.emailAndPasswordBtn);
    final UserEmailPass user = UserEmailPass(tile.login, tile.password);
    try {
      await formValidator(user);
      await loginWithEmailAndPass(user);
      navigateToLoggedPage();
    } on ValidationException catch (e) {
      handleValidationException(e);
    }
  }

  @override
  Future<void> authFacebook() async {
    logButton(EventName.facebookBtn);
    try {
      await loginFaceBookUseCase();
      navigateToLoggedPage();
    } on ValidationException catch (e) {
      handleValidationException(e);
    }
  }

  @override
  Future<void> authGoogle() async {
    logButton(EventName.googleBtn);
    try {
      await loginGoogleUseCase();
      navigateToLoggedPage();
    } on ValidationException catch (e) {
      handleValidationException(e);
    }
  }
  @override
  void navigateToLoggedPage() => appNavigator.push(LoggedPage.page());

  void handleValidationException(ValidationException e) {
    validationResult = localizationResultMapper(e.validationError);
    formKey.currentState?.validate();
  }

  @override
  void onLoginChange(String text) {
    emit(data: tile.copyWith(login: text));
    if (validationResult != null && validationResult!.login != null) {
      validationResult = ValidationResult(password: validationResult?.password);
    }
    formKey.currentState?.validate();
  }

  @override
  void onPasswordChange(String text) {
    emit(data: tile.copyWith(password: text));
    if (validationResult != null && validationResult!.password != null) {
      validationResult = ValidationResult(login: validationResult?.login);
    }
    formKey.currentState?.validate();
  }

  @override
  String? validateLogin() => validationResult?.login;

  @override
  String? validatePassword() => validationResult?.password;
}
