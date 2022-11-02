import 'package:flutter/material.dart';
import 'package:presentation/src/pages/home_page/widgets/shadow_movie_item.dart';
import 'package:presentation/style/dimens.dart';
import 'package:presentation/utils/widget_display_helper.dart';
import 'package:shimmer/shimmer.dart';

class MovieDetailsShadow extends StatelessWidget {
  const MovieDetailsShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Row(
        children: [
          ShadowContainer(
            width: Dimens.size50,
            height: Dimens.size50,
            borderRadius: Dimens.size25,
          ),
          ShadowContainer(
            width: WidgetDisplayHelper.personNameTextShadowWidth(context),
            height: Dimens.size24,
          ),
          ShadowContainer(
            width: Dimens.size24,
            height: Dimens.size14,
          ),
          Flexible(
            child: ShadowContainer(
              width: WidgetDisplayHelper.roleTextWidgetWidth(context),
              height: Dimens.size24,
            ),
          ),
        ],
      ),
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.white,
    );
  }
}
