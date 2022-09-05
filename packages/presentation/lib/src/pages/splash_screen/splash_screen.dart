import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/src/navigation/base_page.dart';

const splashAsset = 'packages/presentation/assets/splash_screen/splash.svg';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const _routeName = '/SplashScreen';

  static page() => BasePage(
        key: const ValueKey(_routeName),
        name: _routeName,
        builder: (context) => const SplashScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffE51937),
              Color(0xffDB5252),
            ],
          ),
        ),
        child: Center(
          child: SvgPicture.asset(splashAsset),
        ),
      ),
    );
  }
}
