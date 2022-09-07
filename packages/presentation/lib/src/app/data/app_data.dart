import 'package:presentation/src/navigation/base_page.dart';
import 'package:presentation/src/pages/splash_screen/splash_screen.dart';

class AppData {
  final List<BasePage> pages;

  AppData(this.pages);

  factory AppData.init() {
    final pages = List<BasePage>.from([SplashScreen.page()]);
    return AppData(pages);
  }
}
