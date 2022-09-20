import 'package:flutter/material.dart';
import 'package:presentation/src/pages/home_page/widgets/movie_stars.dart';
import 'package:presentation/src/pages/movie_details_page/model/movie_details.dart';
import 'package:presentation/style/text_styles/styles.dart';
import 'package:presentation/style/dimens.dart' as D;

class MovieInfo extends StatelessWidget {
  const MovieInfo({
    Key? key,
    required this.details,
  }) : super(key: key);
  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(D.padding_10),
          child: Text(
            details.title,
            style: sfProSemiBold24px,
          ),
        ),
        Text(
          details.durationAndCertification,
          style: sfProSemiRegular16px50opacity,
        ),
        Padding(
          padding: const EdgeInsets.all(D.padding_10),
          child: Text(
            details.genres,
            style: sfProSemiRegular16px50opacity,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: D.padding_15),
              child: Text(
                details.rating,
                style: sfProSemiRegular30px,
              ),
            ),
            MovieStars(
              fullStarsCount: details.stars,
              isBigStar: true,
            ),
          ],
        )
      ],
    );
  }
}
