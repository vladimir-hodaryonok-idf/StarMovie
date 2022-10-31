import 'package:domain/domain.dart';

abstract class MovieLocalCacheRepository {
  Future<void> deleteTrends(List<MovieTrending> movies);

  Future<void> deleteAnticipated(List<MovieAnticipated> movies);

  Future<void> addTrendsMovies(List<MovieTrending> movies);

  Future<void> addAnticipatedMovies(List<MovieAnticipated> movies);

  Future<List<MovieTrending>> getTrending();

  Future<List<MovieAnticipated>> getAnticipated();
}
