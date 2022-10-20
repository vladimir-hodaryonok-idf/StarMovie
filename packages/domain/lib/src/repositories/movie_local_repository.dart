import 'package:domain/domain.dart';

abstract class MovieLocalCacheRepository {
  Future<void> saveTrendingIntoCache(List<MovieTrending> trends);

  Future<void> saveAnticipatedIntoCache(List<MovieAnticipated> anticipated);

  Future<bool> isCachedTrendsActual(List<int> idList);

  Future<List<MovieTrending>> getTrending();

  Future<List<MovieAnticipated>> getAnticipated();

  Future<bool> isCachedAnticipatedActual(List<int> idList);
}
