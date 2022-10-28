import 'package:data/src/database/dao/movie_dao.dart';
import 'package:data/src/database/dto/movie_dto.dart';
import 'package:domain/domain.dart';

class MovieLocalCacheRepositoryImpl implements MovieLocalCacheRepository {
  final MovieDao movieDao;

  const MovieLocalCacheRepositoryImpl({required this.movieDao});

  @override
  Future<List<MovieAnticipated>> getAnticipated() async {
    final List<MovieDto> cachedList = await movieDao.getAnticipatedList();
    return cachedList.map((e) => e.toMovieAnticipated()).toList();
  }

  @override
  Future<List<MovieTrending>> getTrending() async {
    final List<MovieDto> cachedList = await movieDao.getTrendingList();
    return cachedList.map((e) => e.toMovieTrending()).toList();
  }

  @override
  Future<void> addAnticipatedMovies(List<MovieAnticipated> movies) {
    final toDb = movies.map((e) => MovieDto.fromAnticipated(e)).toList();
    return movieDao.insertMovies(toDb);
  }

  @override
  Future<void> addTrendsMovies(List<MovieTrending> movies) {
    final toDb = movies.map((e) => MovieDto.fromTrending(e)).toList();
    return movieDao.insertMovies(toDb);
  }

  @override
  Future<void> deleteAnticipated(List<MovieAnticipated> movies) {
    final toDelete = movies.map((e) => MovieDto.fromAnticipated(e)).toList();
    return movieDao.deleteNotActualMovies(toDelete);
  }

  @override
  Future<void> deleteTrends(List<MovieTrending> movies) {
    final toDelete = movies.map((e) => MovieDto.fromTrending(e)).toList();
    return movieDao.deleteNotActualMovies(toDelete);
  }
}
