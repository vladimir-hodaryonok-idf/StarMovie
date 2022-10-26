import 'package:domain/domain.dart';

abstract class MovieLocalCacheRepository {
  Future<void> updateOrSaveTrends(List<MovieTrending> trends);

  Future<void> updateOrSaveAnticipated(List<MovieAnticipated> anticipated);

  Future<List<MovieTrending>> getTrending();

  Future<List<MovieAnticipated>> getAnticipated();
}
