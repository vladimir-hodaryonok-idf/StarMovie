import 'package:presentation/src/base_bloc/bloc.dart';
import 'package:presentation/src/pages/home_page/home.dart';

abstract class SplashScreenBloc extends Bloc{
  factory SplashScreenBloc() => _SplashScreenBloc();
}

class _SplashScreenBloc extends BlocImpl implements SplashScreenBloc{
  _SplashScreenBloc() : super(null);

  @override
  void init() {
    super.init();
    appNavigator.handleSplashScreen(initialCall(), Home.page());
  }
  Future<void> initialCall() => Future.delayed(Duration(seconds: 3));
}