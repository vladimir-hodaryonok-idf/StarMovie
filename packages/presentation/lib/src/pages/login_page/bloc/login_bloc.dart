import 'package:domain/domain.dart';
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
    LogEventUseCase logEvent,
    LoginValidator loginValidator,
  ) =>
      _LoginBloc(
        loginWithEmailAndPass,
        loginGoogleUseCase,
        loginFaceBookUseCase,
        logEvent,
        loginValidator,
      );

  void onLoginChange(String text);

  void onPasswordChange(String text);

  Future<void> auth();

  Future<void> authGoogle();

  Future<void> authFacebook();
}

class _LoginBloc extends BlocImpl<BaseArguments, LoginData>
    implements LoginBloc {
  final LoginWithEmailAndPassUseCase loginWithEmailAndPass;
  final LoginGoogleUseCase loginGoogleUseCase;
  final LoginFaceBookUseCase loginFaceBookUseCase;
  final LogEventUseCase logEvent;
  final LoginValidator loginValidator;

  _LoginBloc(
    this.loginWithEmailAndPass,
    this.loginGoogleUseCase,
    this.loginFaceBookUseCase,
    this.logEvent,
    this.loginValidator,
  ) : super(LoginData.init());

  @override
  Future<void> auth() async {
    emit(data: tile, isLoading: false);
    if (!loginValidator(tile.login, tile.password)) {
      emit(data: tile.copyWith(errorMessage: 'Fill in your login or password'));
      return;
    }
    emit(data: tile, isLoading: true);
    logEvent('AuthWithEmailAndPassword_clicked');
    final UserEmailPass user = UserEmailPass(tile.login, tile.password);
    _tryLogin(await loginWithEmailAndPass(user));
  }

  @override
  Future<void> authFacebook() async {
    logEvent('AuthWithFacebook_clicked');
    _tryLogin(await loginFaceBookUseCase());
  }

  @override
  Future<void> authGoogle() async {
    logEvent('AuthWithGoogle_clicked');
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

  @override
  void onLoginChange(String text) => emit(data: tile.copyWith(login: text));

  @override
  void onPasswordChange(String text) =>
      emit(data: tile.copyWith(password: text));
}
