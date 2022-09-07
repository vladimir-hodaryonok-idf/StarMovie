import 'package:domain/domain.dart';
import 'package:presentation/src/base_bloc/bloc.dart';
import 'package:presentation/src/pages/home_page/home.dart';

abstract class SplashScreenBloc extends Bloc {
  factory SplashScreenBloc(
    InitialApiCallUseCase initialApiCall,
  ) =>
      _SplashScreenBloc(initialApiCall);
}

class _SplashScreenBloc extends BlocImpl implements SplashScreenBloc {
  final InitialApiCallUseCase initialApiCall;

  _SplashScreenBloc(this.initialApiCall) : super(null);

  @override
  void init() {
    super.init();
    handleSplashScreen();
  }

  void handleSplashScreen() async {
    await initialApiCall();
    appNavigator.popAndPush(Home.page());
  }
}
