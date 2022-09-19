import 'package:domain/domain.dart';
import 'package:presentation/src/pages/movie_details_page/model/movie_details.dart';

class MovieToMovieDetailsMapper extends Mapper<Movie, MovieDetails> {
  final Mapper<int, String> durationToString;
  final Mapper<String, String> movieIdToImage;
  final Mapper<double, int> movieRatingToStarsCount;
  final Mapper<List<String>, String> listToGenres;
  final Mapper<double, String> ratingToString;

  MovieToMovieDetailsMapper({
    required this.durationToString,
    required this.movieIdToImage,
    required this.movieRatingToStarsCount,
    required this.listToGenres,
    required this.ratingToString,
  });

  @override
  MovieDetails call(Movie movie) => MovieDetails(
        movie.title.stringOrEmpty,
        movie.overview.stringOrEmpty,
        movie.runtime == null
            ? ''
            : durationToString(movie.runtime!) +
                movie.certification.stringOrEmpty,
        movie.genres == null ? '' : listToGenres(movie.genres!),
        movie.ids?.imdb == null ? '' : movieIdToImage(movie.ids!.imdb!),
        movie.rating == null ? 0 : movieRatingToStarsCount(movie.rating!),
        movie.rating == null ? '' : ratingToString(movie.rating!),
        movie.ids?.trakt ?? 0,
      );
}
