import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/const/app.dart';
import 'package:presentation/style/dimens.dart';
import 'package:presentation/style/text_styles/styles.dart';
import 'package:presentation/utils/images_container.dart';

class MovieShortInfo extends StatelessWidget {
  const MovieShortInfo({
    required this.movieGenres,
    required this.movieName,
    required this.parentsGuide,
    required this.duration,
    Key? key,
  });

  final String movieName;
  final String movieGenres;
  final String parentsGuide;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: Dimens.padding_8),
            child: Text(
              movieName,
              style: sfProSemiBold16px,
              maxLines: C.movieNameMaxLines,
              softWrap: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: Dimens.padding_8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  movieGenres,
                  style: sfProSemiMedium12px50opacity,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: Dimens.padding_8,
                    right: Dimens.padding_8,
                  ),
                  child: SvgPicture.asset(AssetsImages.ellipse),
                ),
                Text(
                  '$duration | $parentsGuide',
                  style: sfProSemiMedium12px50opacity,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
