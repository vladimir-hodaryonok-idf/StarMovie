import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:presentation/style/dimens.dart';

enum ScreenType { desktop, tablet, phone }

class WidgetDisplayHelper {
  const WidgetDisplayHelper._();

  static ScreenType getDisplayType(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    if (deviceWidth > 900) return ScreenType.desktop;
    if (deviceWidth > 600) return ScreenType.tablet;
    return ScreenType.phone;
  }

  static int columnsAccordingWithWidth(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    if (getDisplayType(context) == ScreenType.phone) {
      return deviceWidth ~/ 170;
    }
    return deviceWidth ~/ (170 + Dimens.size70);
  }

  static bool isBottomNavBarActive(BuildContext context) {
    final screenType = getDisplayType(context);
    return screenType == ScreenType.phone;
  }

  static double statusButtonWidth(BuildContext context) {
    final screenType = getDisplayType(context);
    return screenType == ScreenType.phone
        ? MediaQuery.of(context).size.width.fiftyPercents - Dimens.size24
        : MediaQuery.of(context).size.width.fiftyPercents - Dimens.size59;
  }

  static double movieChildAspectRatio(BuildContext context) {
    if (getDisplayType(context) == ScreenType.phone) {
      return Dimens.aspectRatio9to20;
    }
    return Dimens.aspectRatio9to16;
  }
}
