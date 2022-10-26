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
  Future<void> updateOrSaveTrends(List<MovieTrending> trends) async {
    final fromApi = trends.map((e) => MovieDto.fromTrending(e)).toList();
    final fromDb = await movieDao.getTrendingList();
    return _updateOrSave(fromDb, fromApi);
  }

  @override
  Future<void> updateOrSaveAnticipated(
    List<MovieAnticipated> anticipated,
  ) async {
    final fromApi =
        anticipated.map((e) => MovieDto.fromAnticipated(e)).toList();
    final fromDb = await movieDao.getAnticipatedList();
    return _updateOrSave(fromDb, fromApi);
  }

  Future<void> _updateOrSave(
    List<MovieDto> fromDb,
    List<MovieDto> fromApi,
  ) {
    if (fromDb.isNotEmpty) {
      _update(fromDb, fromApi);
      return Future.value();
    }
    return movieDao.insertMovies(fromApi);
  }

  void _update(List<MovieDto> fromDb, List<MovieDto> fromApi) {
    final itemsToDelete =
        fromDb.where((element) => !fromApi.contains(element)).toList();
    if (itemsToDelete.isNotEmpty) {
      final itemsToAdd =
          fromApi.where((element) => !fromDb.contains(element)).toList();
      Future.wait([
        movieDao.deleteNotActualMovies(itemsToDelete),
        movieDao.insertMovies(itemsToAdd),
      ]);
    }
  }
}
