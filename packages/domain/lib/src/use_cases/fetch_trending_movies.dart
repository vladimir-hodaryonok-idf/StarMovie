import 'package:domain/src/mappers/extract_date.dart';
import 'package:domain/src/mappers/extract_header_value.dart';
import 'package:domain/src/mappers/json_to_trending_list.dart';
import 'package:domain/src/models/movie_model/movie_trending.dart';
import 'package:domain/src/repositories/date_repository.dart';
import 'package:domain/src/repositories/movie_local_repository.dart';
import 'package:domain/src/repositories/people_local_repository.dart';
import 'package:domain/src/repositories/trakt_api_network_repository.dart';
import 'package:domain/src/use_cases/base/out_use_case.dart';
import 'package:domain/src/utils/utility_extensions.dart';

class FetchTrendingMoviesUseCase
    implements OutUseCase<Future<List<MovieTrending>>> {
  final TraktApiNetworkRepository networkRepository;
  final DatePreferencesRepository dateRepository;
  final PeopleLocalRepository peopleLocalRepository;
  final MovieLocalCacheRepository localCacheRepository;
  final JsonToTrendingListMapper jsonToTrendingListMapper;
  final ExtractItemLimitMapper extractItemLimit;
  final ExtractDateMapper extractDate;

  const FetchTrendingMoviesUseCase({
    required this.networkRepository,
    required this.dateRepository,
    required this.peopleLocalRepository,
    required this.localCacheRepository,
    required this.jsonToTrendingListMapper,
    required this.extractItemLimit,
    required this.extractDate,
  });

  @override
  Future<List<MovieTrending>> call() async {
    final lastRequestDate = dateRepository.getTrendingLastRequestDate();
    if (lastRequestDate.isApiRequestAllowed) {
      return _fetchThenCache();
    }
    return localCacheRepository.getTrending();
  }

  Future<List<MovieTrending>> _fetchThenCache() async {
    final int limit = await _getPagesLimit();
    final trends = await _fetchTrendingMovies(limit);
    final isCacheActual = await _compareWithCacheAndDeleteRedundant(trends);
    if (isCacheActual) {
      return trends;
    }
    await localCacheRepository.saveTrendingIntoCache(trends);
    return trends;
  }

  Future<bool> _compareWithCacheAndDeleteRedundant(
      List<MovieTrending> trends) async {
    final idList = trends.map((e) => e.movie.ids?.trakt ?? -1).toList();
    await peopleLocalRepository.deleteUnnecessaryCastById(idList);
    return localCacheRepository.isCachedTrendsActual(idList);
  }

  Future<List<MovieTrending>> _fetchTrendingMovies(int limit) async {
    final response = await networkRepository.fetchTrendingMovies(
      limit: limit,
    );
    return jsonToTrendingListMapper(response.data);
  }

  Future<int> _getPagesLimit() async {
    final response = await networkRepository.fetchTrendingMovies();
    _saveRequestDate(response.headers);
    return extractItemLimit(response.headers);
  }

  void _saveRequestDate(Map<String, List<String>> headers) {
    final currentDate = extractDate(headers);
    if (currentDate != null) {
      dateRepository.saveTrendingLastUpdateFromApiDate(currentDate);
    }
  }
}
