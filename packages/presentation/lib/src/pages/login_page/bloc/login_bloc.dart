import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/analitics/service.dart';
import 'package:presentation/src/base_bloc/bloc.dart';
import 'package:presentation/src/navigation/base_arguments.dart';
import 'package:presentation/src/pages/logged_page/logged.dart';
import 'package:presentation/src/pages/login_page/validator/validator.dart';

import 'login_data.dart';

abstract class LoginBloc extends Bloc<BaseArguments, LoginData> {
  factory LoginBloc(
    LoginWithEmailAndPassUseCase loginWithEmailAndPass,
    LoginGoogleUseCase loginGoogleUseCase,
    LoginFaceBookUseCase loginFaceBookUseCase,
    Analytics firebaseAnalytics,
    LoginValidator loginValidator,
  ) =>
      _LoginBloc(
        loginWithEmailAndPass,
        loginGoogleUseCase,
        loginFaceBookUseCase,
        firebaseAnalytics,
        loginValidator,
      );

  TextEditingController get textLoginController;

  TextEditingController get textPasswordController;

  Future<void> auth();

  Future<void> authGoogle();

  Future<void> authFacebook();
}

class _LoginBloc extends BlocImpl<BaseArguments, LoginData>
    implements LoginBloc {
  final LoginWithEmailAndPassUseCase loginWithEmailAndPass;
  final LoginGoogleUseCase loginGoogleUseCase;
  final LoginFaceBookUseCase loginFaceBookUseCase;
  final Analytics analytics;
  final LoginValidator loginValidator;

  _LoginBloc(
    this.loginWithEmailAndPass,
    this.loginGoogleUseCase,
    this.loginFaceBookUseCase,
    this.analytics,
    this.loginValidator,
  ) : super(LoginData.init());

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  TextEditingController get textLoginController => _loginController;

  @override
  TextEditingController get textPasswordController => _passwordController;

  @override
  Future<void> auth() async {
    final login = _loginController.text;
    final password = _passwordController.text;

    emit(data: tile, isLoading: false);
    if (!loginValidator(login, password)) {
      emit(data: tile.copyWith(errorMessage: 'Fill in your login or password'));
      return;
    }
    emit(data: tile, isLoading: true);
    analytics.logWithEmailAndPassClick();
    final UserEmailPass user = UserEmailPass(login, password);
    _tryLogin(await loginWithEmailAndPass(user));
  }

  @override
  Future<void> authFacebook() async {
    analytics.logOnFacebookAuthClick();
    _tryLogin(await loginFaceBookUseCase());
  }

  @override
  Future<void> authGoogle() async {
    analytics.logOnGoogleAuthClick();
    _tryLogin(await loginGoogleUseCase());
  }

  void _tryLogin(bool isAbleToLogin) {
    if (isAbleToLogin) {
      appNavigator.push(LoggedPage.page());
      return;
    }
    emit(
      data: tile.copyWith(errorMessage: 'Fail while logging'),
      isLoading: false,
    );
  }
}
