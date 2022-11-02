import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:presentation/const/app.dart';
import 'package:presentation/style/dimens.dart';

enum ScreenType { desktop, tablet, phone }

class WidgetDisplayHelper {
  const WidgetDisplayHelper._();

  static ScreenType getDisplayType(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    if (deviceWidth > AppConst.desktopMinWidth) return ScreenType.desktop;
    if (deviceWidth > AppConst.tabletMinWidth) return ScreenType.tablet;
    return ScreenType.phone;
  }

  static int columnsAccordingWithWidth(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    if (getDisplayType(context) == ScreenType.phone) {
      return deviceWidth ~/ Dimens.size170;
    }
    return deviceWidth ~/ (Dimens.size170 + Dimens.size70);
  }

  static bool isBottomNavBarActive(BuildContext context) {
    final screenType = getDisplayType(context);
    return screenType == ScreenType.phone;
  }

  static double statusButtonWidth(BuildContext context) {
    return isPhoneDisplay(context)
        ? MediaQuery.of(context).size.width.fiftyPercents - Dimens.size24
        : MediaQuery.of(context).size.width.fiftyPercents - Dimens.size59;
  }

  static double detailsButtonWidth(BuildContext context) {
    return isPhoneDisplay(context)
        ? MediaQuery.of(context).size.width / AppConst.buttonsCount -
            Dimens.size24
        : MediaQuery.of(context).size.width / AppConst.buttonsCount -
            Dimens.size59;
  }

  static double movieChildAspectRatio(BuildContext context) =>
      isPhoneDisplay(context)
          ? Dimens.aspectRatio9to20
          : Dimens.aspectRatio9to20;

  static double roleTextWidgetWidth(BuildContext context) {
    return isPhoneDisplay(context)
        ? MediaQuery.of(context).size.width.thirtyPercent
        : (MediaQuery.of(context).size.width - Dimens.size70).fifteenPercent;
  }

  static double imageWithNameWidgetWidth(BuildContext context) {
    return isPhoneDisplay(context)
        ? MediaQuery.of(context).size.width.twentyFivePercent
        : (MediaQuery.of(context).size.width - Dimens.size70).twentyFivePercent;
  }

  static double personNameTextShadowWidth(BuildContext context){
    return isPhoneDisplay(context)
        ? MediaQuery.of(context).size.width.fiftyFivePercent - Dimens.size50
        : (MediaQuery.of(context).size.width - Dimens.size70).fifteenPercent;
  }

  static bool isPhoneDisplay(BuildContext context) {
    final screenType = getDisplayType(context);
    return screenType == ScreenType.phone;
  }
}
