import 'package:domain/domain.dart';

class HomePageMovie {
  final String title;
  final String genre;
  final String certification;
  final String image;
  final int stars;

  HomePageMovie(
    this.title,
    this.genre,
    this.certification,
    this.image,
    this.stars,
  );

  factory HomePageMovie.fromDomainMovie(Movie movie) {
    return HomePageMovie(
      movie.title.stringOrEmpty,
      movie.genres.firstOrEmpty.capitalize(),
      movie.certification.stringOrEmpty,
      movie.image,
      movie.stars,
    );
  }
}
