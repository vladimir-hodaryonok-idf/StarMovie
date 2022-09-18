import 'package:presentation/src/navigation/base_page.dart';
import 'package:presentation/src/pages/splash_screen/splash_screen.dart';

final initialPageIndex = 0;

class AppData {
  final List<BasePage> pages;
  final int bottomNavIndex;

  AppData(this.pages, this.bottomNavIndex);

  factory AppData.init() {
    final pages = List<BasePage>.from([SplashScreen.page()]);
    return AppData(pages, initialPageIndex);
  }

  AppData copyWith({List<BasePage>? pages, int? bottomNavIndex}) => AppData(
        pages ?? this.pages,
        bottomNavIndex ?? this.bottomNavIndex,
      );
}
