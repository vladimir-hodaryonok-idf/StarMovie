import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/style/dimens.dart';
import 'package:presentation/utils/widget_display_helper.dart';

class AdaptHomeWidgets {
  const AdaptHomeWidgets._();

  static int columnsAccordingWithWidth(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return WidgetDisplayHelper.isPhoneDisplay(context)
        ? deviceWidth ~/ Dimens.size170
        : deviceWidth ~/ (Dimens.size170 + Dimens.size70);
  }

  static double statusButtonWidth(BuildContext context) {
    return WidgetDisplayHelper.isPhoneDisplay(context)
        ? MediaQuery.of(context).size.width.fiftyPercents - Dimens.size24
        : MediaQuery.of(context).size.width.fiftyPercents - Dimens.size59;
  }

  static double movieChildAspectRatio(BuildContext context) =>
      WidgetDisplayHelper.isPhoneDisplay(context)
          ? Dimens.aspectRatio9to20
          : Dimens.aspectRatio9to20;
}
