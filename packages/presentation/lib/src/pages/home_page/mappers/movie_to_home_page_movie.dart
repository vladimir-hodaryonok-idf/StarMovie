import 'package:domain/domain.dart';
import 'package:presentation/src/pages/home_page/model/home_page_movie.dart';

class MovieToHomePageMovieMapper implements Mapper<Movie, HomePageMovie> {
  final DurationToStringMapper durationToString;
  final MovieIdToImageUrlMapper movieIdToImage;
  final MovieRatingToStarsCountMapper movieRatingToStarsCount;

  const MovieToHomePageMovieMapper({
    required this.durationToString,
    required this.movieIdToImage,
    required this.movieRatingToStarsCount,
  });

  @override
  HomePageMovie call(Movie movie) => HomePageMovie(
        movie.title.stringOrEmpty,
        movie.genres.firstOrEmpty.capitalize(),
        movie.certification.stringOrEmpty,
        movie.ids?.imdb == null ? '' : movieIdToImage(movie.ids!.imdb!),
        movie.rating == null ? 0 : movieRatingToStarsCount(movie.rating!),
        movie.runtime == null ? '0' : durationToString(movie.runtime!),
      );
}
