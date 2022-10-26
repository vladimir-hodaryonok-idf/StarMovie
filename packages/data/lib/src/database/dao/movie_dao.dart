import 'package:data/src/database/dto/movie_dto.dart';
import 'package:floor/floor.dart';

@dao
abstract class MovieDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> insertMovies(List<MovieDto> movies);

  @delete
  Future<void> deleteNotActualMovies(List<MovieDto> movieList);

  @Query(
      'SELECT * FROM MovieDto WHERE listCount IS NOT NULL ORDER BY listCount DESC')
  Future<List<MovieDto>> getAnticipatedList();

  @Query(
      'SELECT * FROM MovieDto WHERE watchers IS NOT NULL ORDER BY watchers DESC')
  Future<List<MovieDto>> getTrendingList();
}
