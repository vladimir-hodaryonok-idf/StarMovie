import 'package:domain/domain.dart';
import 'package:presentation/src/pages/home_page/mappers/movie_to_home_page_movie.dart';
import 'package:presentation/src/pages/home_page/model/home_page_movie.dart';

class TrendingToHomeListMapper
    extends Mapper<List<MovieTrending>, List<HomePageMovie>> {
  final MovieToHomePageMovieMapper movieToHomePageMovieMapper;

  TrendingToHomeListMapper({required this.movieToHomePageMovieMapper});

  @override
  List<HomePageMovie> call(List<MovieTrending> trending) => trending
      .map(
        (e) => movieToHomePageMovieMapper(e.movie),
      )
      .toList();
}
