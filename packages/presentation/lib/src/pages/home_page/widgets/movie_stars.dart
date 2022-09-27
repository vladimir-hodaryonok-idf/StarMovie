import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/utils/images_container.dart';
import 'package:presentation/style/dimens.dart';

const _maxFullStars = 5;

class MovieStars extends StatelessWidget {
  const MovieStars({
    required this.fullStarsCount,
    required this.isBigStar,
    Key? key,
  });

  final int fullStarsCount;
  final bool isBigStar;

  int get emptyStarCount => _maxFullStars - fullStarsCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: Dimens.padding_16,
        bottom: Dimens.padding_8,
      ),
      height: isBigStar ? Dimens.height_30 : Dimens.height_14,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...generateStars(
            stars: fullStarsCount,
            isFull: true,
          ),
          ...generateStars(
            stars: emptyStarCount,
            isFull: false,
          ),
        ],
      ),
    );
  }

  List<Widget> generateStars({
    required int stars,
    required bool isFull,
  }) {
    return List.generate(
      stars,
      (_) => Padding(
        padding: const EdgeInsets.all(Dimens.padding_2),
        child: SvgPicture.asset(
          isFull ? AssetsImages.fullStar : AssetsImages.emptyStar,
          height: isBigStar ? Dimens.height_20 : Dimens.height_14,
          width: isBigStar ? Dimens.width_20 : Dimens.width_14,
        ),
      ),
    );
  }
}
