import 'package:data/src/database/dto/movie_anticipated_dto.dart';
import 'package:data/src/database/dto/movie_trending_dto.dart';
import 'package:floor/floor.dart';

@dao
abstract class MovieDao {
  @Query('SELECT * FROM MovieTrendingDto ORDER BY watchers DESC')
  Future<List<MovieTrendingDto>> getTrendingList();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> insertTrending(List<MovieTrendingDto> movies);

  @Query(
      'SELECT * FROM MovieTrendingDto WHERE trakt in (:idList) ORDER BY watchers DESC')
  Future<List<MovieTrendingDto>> compareTrendingListById(List<int> idList);

  @Query('DELETE FROM MovieTrendingDto')
  Future<void> clearTrending();

  @Query('SELECT * FROM MovieAnticipatedDto ORDER BY listCount DESC')
  Future<List<MovieAnticipatedDto>> getAnticipatedList();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> insertAnticipated(List<MovieAnticipatedDto> movies);

  @Query(
      'SELECT * FROM MovieAnticipatedDto WHERE trakt in (:idList) ORDER BY listCount DESC')
  Future<List<MovieAnticipatedDto>> compareAnticipatedListById(List<int> idList);

  @Query('DELETE FROM MovieAnticipatedDto')
  Future<void> clearAnticipated();
}
