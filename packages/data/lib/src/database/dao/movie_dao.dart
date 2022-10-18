import 'package:data/src/database/dto/MovieTrendingDto.dart';
import 'package:floor/floor.dart';

@dao
abstract class MovieTrendingDao{
  @insert
  Future<List<int>> insertMovieTrending(List<MovieTrendingDto> movies);
}