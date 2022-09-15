import 'package:domain/domain.dart';

class MovieDetails {
  final String title;
  final String overview;
  final String durationAndCertification;
  final String genres;
  final String image;
  final int stars;
  final String rating;
  final int id;

  MovieDetails(
    this.title,
    this.overview,
    this.durationAndCertification,
    this.genres,
    this.image,
    this.stars,
    this.rating,
    this.id,
  );

  factory MovieDetails.fromMovie(Movie movie) => MovieDetails(
        movie.title.stringOrEmpty,
        movie.overview.stringOrEmpty,
        movie.runtime.toTimeString + ' | ' + movie.certification.stringOrEmpty,
        movie.genres.strings,
        movie.image,
        movie.stars,
        movie.rating.stringCompareWithFive,
        movie.ids?.trakt ?? 0,
      );
}
