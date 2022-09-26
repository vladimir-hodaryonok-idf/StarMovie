import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/src/base_bloc/bloc_screen.dart';
import 'package:presentation/src/navigation/base_page.dart';
import 'package:presentation/src/pages/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:presentation/style/colors.dart';
import 'package:presentation/utils/images_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});
  static const _routeName = '/SplashScreen';

  static page() => BasePage(
        key: const ValueKey(_routeName),
        name: _routeName,
        builder: (context) => const SplashScreen(),
        isShowNavBar: false,
      );

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState
    extends BlocScreenState<SplashScreen, SplashScreenBloc> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(MyColors.splashScreenUp),
              Color(MyColors.splashScreenBottom),
            ],
          ),
        ),
        child: Center(
          child: SvgPicture.asset(AssetsImages.splashAsset),
        ),
      ),
    );
  }
}
