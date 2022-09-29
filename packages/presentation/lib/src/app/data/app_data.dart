import 'package:presentation/src/navigation/base_page.dart';
import 'package:presentation/src/pages/splash_screen/splash_screen.dart';

final initialPageIndex = 0;

class AppData {
  final List<BasePage> pages;
  final int bottomNavIndex;
  final bool isShowNavBar;

  const AppData(
    this.pages,
    this.bottomNavIndex,
    this.isShowNavBar,
  );

  factory AppData.init() {
    final pages = List<BasePage>.from([SplashScreen.page()]);
    return AppData(pages, initialPageIndex, false);
  }

  AppData copyWith(
          {List<BasePage>? pages,
          int? bottomNavIndex,
          bool? isShowNavBar,
          Sh}) =>
      AppData(
        pages ?? this.pages,
        bottomNavIndex ?? this.bottomNavIndex,
        isShowNavBar ?? this.isShowNavBar,
      );
}
