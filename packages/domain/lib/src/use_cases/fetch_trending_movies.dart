import 'package:domain/src/mappers/extract_date.dart';
import 'package:domain/src/mappers/extract_header_value.dart';
import 'package:domain/src/mappers/is_api_request_allowed.dart';
import 'package:domain/src/mappers/json_to_trending_list.dart';
import 'package:domain/src/models/movie_model/movie_trending.dart';
import 'package:domain/src/repositories/date_repository.dart';
import 'package:domain/src/repositories/movie_local_repository.dart';
import 'package:domain/src/repositories/trakt_api_network_repository.dart';
import 'package:domain/src/use_cases/base/out_use_case.dart';

class FetchTrendingMoviesUseCase
    implements OutUseCase<Future<List<MovieTrending>>> {
  final TraktApiNetworkRepository networkRepository;
  final DatePreferencesRepository dateRepository;
  final MovieLocalCacheRepository localCacheRepository;
  final JsonToTrendingListMapper jsonToTrendingListMapper;
  final ExtractItemLimitMapper extractItemLimit;
  final ExtractDateMapper extractDate;
  final IsApiRequestAllowedMapper isApiRequestAllowed;

  const FetchTrendingMoviesUseCase({
    required this.networkRepository,
    required this.dateRepository,
    required this.localCacheRepository,
    required this.jsonToTrendingListMapper,
    required this.extractItemLimit,
    required this.extractDate,
    required this.isApiRequestAllowed,
  });

  @override
  Future<List<MovieTrending>> call() async {
    final lastRequestDate = dateRepository.getTrendingLastRequestDate();
    if (isApiRequestAllowed(lastRequestDate)) {
      return _fetchThenCache();
    }
    return localCacheRepository.getTrending();
  }

  Future<List<MovieTrending>> _fetchThenCache() async {
    final int limit = await _getPagesLimit();
    final trends = await _fetchTrendingMovies(limit);
    final isCacheActual = await _compareWithCache(trends);
    if(isCacheActual){
      return trends;
    }
    await localCacheRepository.saveTrendingIntoCache(trends);
    return trends;
  }

  Future<bool> _compareWithCache(List<MovieTrending> trends){
    final idList = trends.map((e) => e.movie.ids?.trakt ?? -1).toList();
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
