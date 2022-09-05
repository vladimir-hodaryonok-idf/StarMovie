import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/src/base_bloc/bloc_screen.dart';
import 'package:presentation/src/navigation/base_page.dart';
import 'package:presentation/src/pages/splash_screen/bloc/splash_screen_bloc.dart';

const splashAsset = 'packages/presentation/assets/splash_screen/splash.svg';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const _routeName = '/SplashScreen';

  static page() => BasePage(
        key: const ValueKey(_routeName),
        name: _routeName,
        builder: (context) => const SplashScreen(),
      );

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState
    extends BlocScreenState<SplashScreen, SplashScreenBloc> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc.dataStream,
        builder: (_, snapShot) {
          return Material(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffE51937), Color(0xffDB5252)],
                ),
              ),
              child: Center(
                child: SvgPicture.asset(splashAsset),
              ),
            ),
          );
        });
  }
}
