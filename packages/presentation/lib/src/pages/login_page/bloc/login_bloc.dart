import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/const/events_strings.dart';
import 'package:presentation/generated/l10n.dart';
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
          localizationResultMapper);

  void onLoginChange(String text);

  void onPasswordChange(String text);

  Future<void> auth();

  Future<void> authGoogle();

  Future<void> authFacebook();

  GlobalKey<FormState> get formKey;

  String? validateLogin();

  String? validatePassword();
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
    final validationResult = formValidator(user);
    final localizedResult = localizationResultMapper(validationResult);
    emit(
      data: tile.fromValidationResult(result: localizedResult),
      isLoading: true,
    );
    if (formKey.currentState?.validate() ?? false) {
      _tryLogin(await loginWithEmailAndPass(user));
    }
  }

  @override
  Future<void> authFacebook() async {
    logButton(EventName.facebookBtn);
    _tryLogin(await loginFaceBookUseCase());
  }

  @override
  Future<void> authGoogle() async {
    logButton(EventName.googleBtn);
    _tryLogin(await loginGoogleUseCase());
  }

  void _tryLogin(bool isAbleToLogin) {
    if (isAbleToLogin) {
      appNavigator.push(LoggedPage.page());
      return;
    }
    final result = ValidationResult(
      login: S.current.invalidLogin,
      password: S.current.invalidPassword,
    );
    emit(
      data: tile.fromValidationResult(result: result),
      isLoading: false,
    );
    formKey.currentState?.validate();
  }

  @override
  void onLoginChange(String text) {
    emit(
        data: tile.copyWith(
      login: text,
      passwordValidation: tile.passwordValidation,
    ));
    formKey.currentState?.validate();
  }

  @override
  void onPasswordChange(String text) {
    emit(
        data: tile.copyWith(
      password: text,
      loginValidation: tile.loginValidation,
    ));
    formKey.currentState?.validate();
  }

  @override
  String? validateLogin() => tile.loginValidation;

  @override
  String? validatePassword() => tile.passwordValidation;
}
