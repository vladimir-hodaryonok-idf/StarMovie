import 'package:flutter/cupertino.dart';
import 'package:presentation/style/dimens.dart';

enum ScreenType { desktop, tablet, phone }

class SizePicker {
  const SizePicker._();
  static ScreenType getDisplayType(BuildContext context){
    final deviceWidth = MediaQuery.of(context).size.shortestSide;
    if (deviceWidth > 900) return ScreenType.desktop;
    if (deviceWidth > 600) return ScreenType.tablet;
    return ScreenType.phone;
  }
}

class GridViewDisplayAdapter{//todo class naming
  const GridViewDisplayAdapter._();
  static int columnsAccordingWithWidth(BuildContext context){
    final deviceWidth = MediaQuery.of(context).size.width;
    return deviceWidth ~/Dimens.size180;
  }
  static listItemWidth(ScreenType screenType){

  }

  // static double itemAspectRation(ScreenType screenType){
  //   print(screenType);
  //   switch(screenType){
  //     case ScreenType.phone: return Dimens.aspectRatio1to22;
  //     default: return 1.0;
  //   }
  // }
}