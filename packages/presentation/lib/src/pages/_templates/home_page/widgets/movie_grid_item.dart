import 'package:flutter/material.dart';
import 'package:presentation/src/pages/_templates/home_page/widgets/movie_short_info.dart';
import 'package:presentation/src/pages/_templates/home_page/widgets/movie_stars.dart';
import 'package:presentation/utils/images_container.dart';

class MovieGridItem extends StatelessWidget {
  const MovieGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Image.asset(
            Assets.testImage,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          MovieStars(
            fullStarsCount: 4,
            isBigStar: false,
          ),
          MovieShortInfo(
            movieGenres: 'Action',
            movieName: 'John Wick',
            parentsGuide: 'R',
          ),
        ],
      ),
    );
  }
}
