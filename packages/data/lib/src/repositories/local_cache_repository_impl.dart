import 'package:data/src/database/dao/movie_dao.dart';
import 'package:domain/domain.dart';

class LocalCacheRepositoryImpl implements LocalCacheRepository {
  final MovieTrendingDao trendingDao;

  const LocalCacheRepositoryImpl({required this.trendingDao});

  @override
  List<MovieAnticipated> getAnticipated() {
    // TODO: implement getAnticipated
    throw UnimplementedError();
  }

  @override
  List<MovieTrending> getTrending() {
    // TODO: implement getTrending
    throw UnimplementedError();
  }

  @override
  Future<void> saveAnticipatedIntoCache(List<MovieAnticipated> anticipated) {
    // TODO: implement saveAnticipatedIntoCache
    throw UnimplementedError();
  }

  @override
  Future<void> saveTrendingIntoCache(List<MovieTrending> trends) {
    trendingDao.insertMovieTrending(trends);
  }
}
