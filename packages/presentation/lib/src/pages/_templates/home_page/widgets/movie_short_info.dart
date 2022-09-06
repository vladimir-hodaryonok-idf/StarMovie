import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/style/text_styles/styles.dart';
import 'package:presentation/utils/images_container.dart';

class MovieShortInfo extends StatelessWidget {
  const MovieShortInfo({
    Key? key,
    required this.movieGenres,
    required this.movieName,
    required this.parentsGuide,
  }) : super(key: key);
  final String movieName;
  final String movieGenres;
  final String parentsGuide;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              movieName,
              style: sfProSemiBold16px,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  movieGenres,
                  style: sfProSemiMedium12px50opacity,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: SvgPicture.asset(Assets.ellipse),
                ),
                Text(
                  '| $parentsGuide',
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
