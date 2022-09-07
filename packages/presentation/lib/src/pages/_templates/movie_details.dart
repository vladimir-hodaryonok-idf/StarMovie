import 'package:flutter/material.dart';
import 'package:presentation/src/pages/home_page/widgets/movie_stars.dart';
import 'package:presentation/style/text_styles/styles.dart';
import 'package:presentation/utils/images_container.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            MovieCover(
              imageUrl: Assets.testImage,
            ),
            MovieInfo(
              parentsGuide: 'R',
              movieGenres: 'Action, Crime, Thriller',
              movieName: 'John Wick 3: Parabellum',
              movieDuration: '2hr 10m',
              movieRating: 4.6,
            )
          ],
        ),
      ),
    );
  }
}

class MovieCover extends StatelessWidget {
  const MovieCover({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 262,
          child: Image.asset(
            Assets.testImage,
            fit: BoxFit.fitWidth,
            alignment: Alignment.topLeft,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(104, 129, 104, 20),
          child: Image.asset(imageUrl),
        )
      ],
    );
  }
}

class MovieInfo extends StatelessWidget {
  const MovieInfo({
    Key? key,
    required this.parentsGuide,
    required this.movieGenres,
    required this.movieName,
    required this.movieDuration,
    required this.movieRating,
  }) : super(key: key);
  final String movieName;
  final String movieDuration;
  final String parentsGuide;
  final String movieGenres;
  final double movieRating;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            movieName,
            style: sfProSemiBold24px,
          ),
        ),
        Text(
          '$movieDuration | $parentsGuide',
          style: sfProSemiRegular16px50opacity,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            movieGenres,
            style: sfProSemiRegular16px50opacity,
          ),
        ),
        Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$movieRating/5',
              style: sfProSemiRegular30px,
            ),
            MovieStars(
              fullStarsCount: movieRating.round(),
              isBigStar: true,
            ),
          ],
        )
      ],
    );
  }
}
