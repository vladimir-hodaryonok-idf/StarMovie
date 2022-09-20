import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/utils/images_container.dart';
import 'package:presentation/style/dimens.dart' as D;

const maxFullStars = 5;

class MovieStars extends StatelessWidget {
  const MovieStars({
    Key? key,
    required this.fullStarsCount,
    required this.isBigStar,
  }) : super(key: key);
  final int fullStarsCount;
  final bool isBigStar;

  int get emptyStarCount => maxFullStars - fullStarsCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: D.padding_16,
        bottom: D.padding_8,
      ),
      child: Container(
        height: isBigStar ? D.bigStarContainer_h : D.smallStarContainer_h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...generateStars(stars: fullStarsCount, isFull: true),
            ...generateStars(stars: emptyStarCount, isFull: false),
          ],
        ),
      ),
    );
  }

  List<Widget> generateStars({required int stars, required bool isFull}) {
    return List.generate(
      stars,
      (_) => Padding(
        padding: const EdgeInsets.all(D.padding_2),
        child: SvgPicture.asset(
          isFull ? AssetsImages.fullStar : AssetsImages.emptyStar,
          height: isBigStar ? D.bigStarSize : D.smallStarSize,
          width: isBigStar ? D.bigStarSize : D.smallStarSize,
        ),
      ),
    );
  }
}
