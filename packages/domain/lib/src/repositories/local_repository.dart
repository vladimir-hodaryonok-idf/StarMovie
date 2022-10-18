import 'package:domain/domain.dart';

abstract class LocalCacheRepository{
  Future<void> saveTrendingIntoCache(List<MovieTrending> trends);
  Future<void> saveAnticipatedIntoCache(List<MovieAnticipated> anticipated);
  List<MovieTrending> getTrending();
  List<MovieAnticipated> getAnticipated();
}