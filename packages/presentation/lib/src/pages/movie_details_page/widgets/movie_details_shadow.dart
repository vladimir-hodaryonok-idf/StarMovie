import 'package:flutter/material.dart';
import 'package:presentation/src/pages/home_page/widgets/shadow_movie_item.dart';
import 'package:shimmer/shimmer.dart';

const double personLogo_w = 50;
const double personLogo_h = 50;
const double personImageBorder_r = personLogo_h / 2;
const double shadow_h_24 = 24;
const double shadow_h_14 = 14;
const double shadow_w_24 = 24;

class MovieDetailsShadow extends StatelessWidget {
  const MovieDetailsShadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final personNameTextShadow_w =
        MediaQuery.of(context).size.width * 0.55 - personLogo_w;
    final roleTextShadow_w = MediaQuery.of(context).size.width * 0.30;

    return Shimmer.fromColors(
      child: Row(
        children: [
          ShadowContainer(
            width: personLogo_w,
            height: personLogo_h,
            borderRadius: personImageBorder_r,
          ),
          ShadowContainer(
            width: personNameTextShadow_w,
            height: shadow_h_24,
          ),
          ShadowContainer(width: shadow_h_24, height: shadow_h_14),
          Flexible(
            child: ShadowContainer(
              width: roleTextShadow_w,
              height: shadow_h_24,
            ),
          ),
        ],
      ),
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.white,
    );
  }
}
