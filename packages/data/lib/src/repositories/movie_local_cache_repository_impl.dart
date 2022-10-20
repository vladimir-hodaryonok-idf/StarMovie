import 'package:data/src/database/dao/movie_dao.dart';
import 'package:data/src/database/dto/movie_anticipated_dto.dart';
import 'package:data/src/database/dto/movie_trending_dto.dart';
import 'package:domain/domain.dart';

class MovieLocalCacheRepositoryImpl implements MovieLocalCacheRepository {
  final MovieDao movieDao;

  const MovieLocalCacheRepositoryImpl({required this.movieDao});

  @override
  Future<List<MovieAnticipated>> getAnticipated() async {
    final List<MovieAnticipatedDto> cachedList =
        await movieDao.getAnticipatedList();
    return cachedList.map((e) => e.toMovieAnticipated()).toList();
  }

  @override
  Future<List<MovieTrending>> getTrending() async {
    final List<MovieTrendingDto> cachedList = await movieDao.getTrendingList();
    return cachedList.map((e) => e.toMovieTrending()).toList();
  }

  @override
  Future<void> saveAnticipatedIntoCache(
      List<MovieAnticipated> anticipated) async {
    await movieDao.clearAnticipated();
    final List<MovieAnticipatedDto> toCacheList =
        anticipated.map((e) => MovieAnticipatedDto.fromAnticipated(e)).toList();
    await movieDao.insertAnticipated(toCacheList);
  }

  @override
  Future<void> saveTrendingIntoCache(List<MovieTrending> trends) async {
    await movieDao.clearTrending();
    final List<MovieTrendingDto> toCacheList =
        trends.map((e) => MovieTrendingDto.fromTrending(e)).toList();
    await movieDao.insertTrending(toCacheList);
  }

  @override
  Future<bool> isCachedTrendsActual(List<int> idList) async {
    final List<MovieTrendingDto> actualMovies =
        await movieDao.compareTrendingListById(idList);
    return actualMovies.length == idList.length ? true : false;
  }

  @override
  Future<bool> isCachedAnticipatedActual(List<int> idList) async{
    final List<MovieAnticipatedDto> actualMovies =
        await movieDao.compareAnticipatedListById(idList);
    return actualMovies.length == idList.length ? true : false;
  }
}
