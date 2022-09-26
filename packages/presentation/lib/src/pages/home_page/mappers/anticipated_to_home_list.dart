import 'package:domain/domain.dart';
import 'package:presentation/src/pages/home_page/mappers/movie_to_home_page_movie.dart';
import 'package:presentation/src/pages/home_page/model/home_page_movie.dart';

class AnticipatedToHomeListMapper
    implements Mapper<List<MovieAnticipated>, List<HomePageMovie>> {
  final MovieToHomePageMovieMapper movieToHomePageMovieMapper;

  const AnticipatedToHomeListMapper({required this.movieToHomePageMovieMapper});

  @override
  List<HomePageMovie> call(List<MovieAnticipated> anticipated) => anticipated
      .map(
        (e) => movieToHomePageMovieMapper(e.movie),
      )
      .toList();
}
