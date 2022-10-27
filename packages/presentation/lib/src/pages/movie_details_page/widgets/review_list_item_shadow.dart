import 'package:flutter/material.dart';
import 'package:presentation/src/pages/home_page/widgets/shadow_movie_item.dart';
import 'package:presentation/style/dimens.dart';
import 'package:shimmer/shimmer.dart';

class ReviewListItemShadow extends StatelessWidget {
  const ReviewListItemShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Column(
        children: [
          ShadowContainer(
            width: double.infinity,
            height: Dimens.size120,
            borderRadius: Dimens.size10,
            padding: Dimens.size18,
          ),
          Padding(
            padding: const EdgeInsets.only(left: Dimens.size18),
            child: Row(
              children: [
                ShadowContainer(
                  width: Dimens.size50,
                  height: Dimens.size50,
                  borderRadius: Dimens.size25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShadowContainer(
                      width: Dimens.size104,
                      height: Dimens.size10,
                      padding: Dimens.size10,
                    ),
                    ShadowContainer(
                      width: Dimens.size104,
                      height: Dimens.size10,
                      padding: Dimens.size10,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.white,
    );
  }
}
