import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/pages/home_page/widgets/shadow_movie_item.dart';
import 'package:presentation/style/dimens.dart';
import 'package:shimmer/shimmer.dart';

class MovieDetailsShadow extends StatelessWidget {
  const MovieDetailsShadow({super.key});

  @override
  Widget build(BuildContext context) {
    final personNameTextShadow_w =
        MediaQuery.of(context).size.width.fiftyFivePercent - Dimens.size_50;
    final roleTextShadow_w = MediaQuery.of(context).size.width.thirtyPercent;

    return Shimmer.fromColors(
      child: Row(
        children: [
          ShadowContainer(
            width: Dimens.size_50,
            height: Dimens.size_50,
            borderRadius: Dimens.size_25,
          ),
          ShadowContainer(
            width: personNameTextShadow_w,
            height: Dimens.size_24,
          ),
          ShadowContainer(
            width: Dimens.size_24,
            height: Dimens.size_14,
          ),
          Flexible(
            child: ShadowContainer(
              width: roleTextShadow_w,
              height: Dimens.size_24,
            ),
          ),
        ],
      ),
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.white,
    );
  }
}
