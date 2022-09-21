import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/utils/images_container.dart';

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
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Container(
        height: isBigStar ? 30 : 14,
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
        padding: const EdgeInsets.all(2.0),
        child: SvgPicture.asset(
          isFull ? AssetsImages.fullStar : AssetsImages.emptyStar,
          height: isBigStar ? 20 : 14,
          width: isBigStar ? 20 : 14,
        ),
      ),
    );
  }
}
