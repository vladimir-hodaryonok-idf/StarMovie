import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/src/navigation/base_page.dart';
import 'package:presentation/style/colors.dart';
import 'package:presentation/utils/images_container.dart';

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
