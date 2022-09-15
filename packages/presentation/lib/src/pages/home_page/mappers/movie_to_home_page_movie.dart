import 'package:domain/domain.dart';
import 'package:presentation/src/pages/home_page/model/home_page_movie.dart';

class MovieToHomePageMovieMapper extends Mapper<Movie, HomePageMovie> {
  final Mapper<int?, String> durationToString;
  final Mapper<String?, String> movieIdToImage;
  final Mapper<double?, int> movieRatingToStarsCount;

  MovieToHomePageMovieMapper({
    required this.durationToString,
    required this.movieIdToImage,
    required this.movieRatingToStarsCount,
  });

  @override
  HomePageMovie call(Movie movie) => HomePageMovie(
        movie.title.stringOrEmpty,
        movie.genres.firstOrEmpty.capitalize(),
        movie.certification.stringOrEmpty,
        movieIdToImage(movie.ids?.imdb),
        movieRatingToStarsCount(movie.rating),
        durationToString(movie.runtime),
      );
}
