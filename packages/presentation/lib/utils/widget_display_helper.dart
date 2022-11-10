import 'package:flutter/cupertino.dart';
import 'package:presentation/const/app.dart';

enum ScreenType { desktop, tablet, phone }

class WidgetDisplayHelper {
  const WidgetDisplayHelper._();

  static ScreenType getDisplayType(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    if (deviceWidth > AppConst.desktopMinWidth) return ScreenType.desktop;
    if (deviceWidth > AppConst.tabletMinWidth) return ScreenType.tablet;
    return ScreenType.phone;
  }

  static bool isBottomNavBarActive(BuildContext context) {
    final screenType = getDisplayType(context);
    return screenType == ScreenType.phone;
  }

  static bool isPhoneDisplay(BuildContext context) {
    final screenType = getDisplayType(context);
    return screenType == ScreenType.phone;
  }
}
