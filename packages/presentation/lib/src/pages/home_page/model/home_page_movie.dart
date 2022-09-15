import 'package:domain/domain.dart';

class HomePageMovie {
  final String title;
  final String genre;
  final String certification;
  final String image;
  final int stars;
  final String duration;

  HomePageMovie(
    this.title,
    this.genre,
    this.certification,
    this.image,
    this.stars,
    this.duration,
  );

  factory HomePageMovie.fromDomainMovie(Movie movie) {
    return HomePageMovie(
      movie.title.stringOrEmpty,
      movie.genres.firstOrEmpty.capitalize(),
      movie.certification.stringOrEmpty,
      movie.image,
      movie.stars,
      movie.runtime.timeFormat,
    );
  }
}
