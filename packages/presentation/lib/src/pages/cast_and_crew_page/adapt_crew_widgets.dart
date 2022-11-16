import 'package:flutter/material.dart';
import 'package:presentation/style/dimens.dart';
import 'package:presentation/utils/widget_display_helper.dart';

class AdaptCrewWidgets {
  const AdaptCrewWidgets._();
  static int columnsAccordingWithWidth(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return WidgetDisplayHelper.isPhoneDisplay(context)
        ? deviceWidth ~/ Dimens.size170
        : deviceWidth ~/ (Dimens.size300 + Dimens.size70);
  }
}