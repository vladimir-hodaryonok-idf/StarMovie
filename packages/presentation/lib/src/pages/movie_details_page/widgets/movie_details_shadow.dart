import 'package:flutter/material.dart';
import 'package:presentation/src/pages/home_page/widgets/shadow_movie_item.dart';
import 'package:shimmer/shimmer.dart';
import 'package:presentation/style/dimens.dart' as D;

class MovieDetailsShadow extends StatelessWidget {
  const MovieDetailsShadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Row(
        children: [
          ShadowContainer(
            width: D.personImage_w,
            height: D.personImage_h,
            borderRadius: D.personImageBorder_r,
          ),
          ShadowContainer(
            width: D.fiftyFivePercentsOfWidth(context) - D.personImage_w,
            height: D.shadow_h_24,
          ),
          ShadowContainer(width: D.shadow_h_24, height: D.shadow_h_14),
          Flexible(
            child: ShadowContainer(
              width: D.thirtyPercentsOfWidth(context),
              height: D.shadow_h_24,
            ),
          ),
        ],
      ),
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.white,
    );
  }
}
