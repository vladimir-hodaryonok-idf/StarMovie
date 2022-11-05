import 'package:domain/domain.dart';
import 'package:presentation/generated/l10n.dart';
import 'package:presentation/src/base_bloc/bloc.dart';
import 'package:presentation/src/navigation/base_arguments.dart';
import 'package:presentation/src/pages/home_page/home.dart';
import 'package:presentation/src/pages/splash_screen/bloc/alert_dialog_data.dart';

abstract class SplashScreenBloc extends Bloc<BaseArguments, AlertDialogData?> {
  factory SplashScreenBloc(
    CheckAppVersionUseCase checkVersion,
    UpdateAppUseCase updateApp,
  ) =>
      _SplashScreenBloc(checkVersion, updateApp);
}

class _SplashScreenBloc extends BlocImpl<BaseArguments, AlertDialogData?>
    implements SplashScreenBloc {
  final CheckAppVersionUseCase checkVersion;
  final UpdateAppUseCase updateApp;

  _SplashScreenBloc(
    this.checkVersion,
    this.updateApp,
  ) : super(null);

  @override
  void init() {
    super.init();
    _handleSplashScreen();
  }

  void _handleSplashScreen() async {
    try {
      final versionCheckResult = await checkVersion();
      switch (versionCheckResult) {
        case VersionCheckResult.actualVersion:
          _useCurrent();
          break;
        case VersionCheckResult.ableToUpdate:
          emit(
            data: AlertDialogData(
              title: S.current.newVersionAvailable,
              content: S.current.newVersionAvailableContent,
              updateCallBack: _update,
              useCurrentCallBack: _useCurrent,
            ),
          );
          break;
        case VersionCheckResult.shouldUpdate:
          emit(
            data: AlertDialogData(
              title: S.current.updateRequired,
              content: S.current.updateRequiredContent,
              updateCallBack: _update,
            ),
          );
          break;
      }
    } on Error {
      emit(
        data: AlertDialogData(
          title: S.current.cantCheckVersion,
          content: S.current.cantCheckVersionContent,
          updateCallBack: _handleSplashScreen,
        ),
      );
    }
  }

  void _update() async => await updateApp();

  void _useCurrent() => appNavigator.popAndPush(Home.page());
}
