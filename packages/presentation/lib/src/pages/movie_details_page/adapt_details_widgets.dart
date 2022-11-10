import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/const/app.dart';
import 'package:presentation/style/dimens.dart';
import 'package:presentation/utils/widget_display_helper.dart';

class AdaptDetailsWidget {
  const AdaptDetailsWidget._();

  static double roleTextWidgetWidth(BuildContext context) {
    return WidgetDisplayHelper.isPhoneDisplay(context)
        ? MediaQuery.of(context).size.width.thirtyPercent
        : (MediaQuery.of(context).size.width - Dimens.size70).fifteenPercent;
  }

  static double imageWithNameWidgetWidth(BuildContext context) {
    return WidgetDisplayHelper.isPhoneDisplay(context)
        ? MediaQuery.of(context).size.width.twentyFivePercent
        : (MediaQuery.of(context).size.width - Dimens.size70).twentyFivePercent;
  }

  static double personNameTextShadowWidth(BuildContext context) {
    return WidgetDisplayHelper.isPhoneDisplay(context)
        ? MediaQuery.of(context).size.width.fiftyFivePercent - Dimens.size50
        : (MediaQuery.of(context).size.width - Dimens.size70).fifteenPercent;
  }

  static double detailsButtonWidth(BuildContext context) {
    return WidgetDisplayHelper.isPhoneDisplay(context)
        ? MediaQuery.of(context).size.width / AppConst.buttonsCount -
            Dimens.size24
        : MediaQuery.of(context).size.width / AppConst.buttonsCount -
            Dimens.size59;
  }
}
