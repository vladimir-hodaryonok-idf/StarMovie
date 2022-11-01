import 'package:flutter/material.dart';
import 'package:presentation/const/app.dart';
import 'package:presentation/style/dimens.dart';
import 'package:presentation/style/text_styles/styles.dart';

class MovieShortInfo extends StatelessWidget {
  const MovieShortInfo({
    required this.movieGenres,
    required this.movieName,
    required this.parentsGuide,
    required this.duration,
    super.key,
  });

  final String movieName;
  final String movieGenres;
  final String parentsGuide;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: Dimens.size8),
            alignment: Alignment.centerLeft,
            child: Text(
              movieName,
              style: sfProSemiBold16px,
              maxLines: AppConst.movieShortInfoLines,
              softWrap: true,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: Dimens.size8),
            alignment: Alignment.centerLeft,
            child: Text(
              '$movieGenres ${String.fromCharCode(
                AppConst.blackCircleCharCode,
              )} $duration | $parentsGuide',
              style: sfProSemiMedium12px50opacity,
              maxLines: AppConst.movieShortInfoLines,
              softWrap: true,
            ),
          )
        ],
      ),
    );
  }
}
