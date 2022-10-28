import 'package:domain/src/mappers/extract_date.dart';
import 'package:domain/src/mappers/extract_header_value.dart';
import 'package:domain/src/mappers/json_to_trending_list.dart';
import 'package:domain/src/models/data_wrapper/movies_wrapper.dart';
import 'package:domain/src/models/movie_model/movie_trending.dart';
import 'package:domain/src/repositories/date_repository.dart';
import 'package:domain/src/repositories/movie_local_repository.dart';
import 'package:domain/src/repositories/trakt_api_network_repository.dart';
import 'package:domain/src/use_cases/base/out_use_case.dart';
import 'package:domain/src/utils/utility_class.dart';
import 'package:domain/src/utils/utility_extensions.dart';

class FetchTrendingMoviesUseCase
    implements OutUseCase<Future<List<MovieTrending>>> {
  final TraktApiNetworkRepository networkRepository;
  final DateRepository dateRepository;
  final MovieLocalCacheRepository localCacheRepository;
  final JsonToTrendingListMapper jsonToTrendingListMapper;
  final ExtractItemLimitMapper extractItemLimit;
  final ExtractDateMapper extractDate;

  const FetchTrendingMoviesUseCase({
    required this.networkRepository,
    required this.dateRepository,
    required this.localCacheRepository,
    required this.jsonToTrendingListMapper,
    required this.extractItemLimit,
    required this.extractDate,
  });

  @override
  Future<List<MovieTrending>> call() async {
    final lastRequestDate = await dateRepository.getTrendingLastRequestDate();
    if (lastRequestDate.isApiRequestAllowed) {
      return _fetchThenCache();
    }
    return localCacheRepository.getTrending();
  }

  Future<List<MovieTrending>> _fetchThenCache() async {
    final int limit = await _getPagesLimit();
    final trends = await _fetchTrendingMovies(limit);
    await _updateOrSaveTrends(trends);
    return trends;
  }

  Future<void> _updateOrSaveTrends(List<MovieTrending> apiTrends) async {
    final cachedTrends = await localCacheRepository.getTrending();
    if (cachedTrends.isNotEmpty) {
      final dataWrapper =
          MoviesWrapper(dbList: cachedTrends, apiList: apiTrends);
      final compareResult = MoviesUtility.findItemsToAddAndDelete(dataWrapper);
      _handleDiffs(compareResult);
    }
    return localCacheRepository.addTrendsMovies(apiTrends);
  }

  void _handleDiffs(ListCompareResult<MovieTrending>? diffs) {
    if (diffs != null) {
      Future.wait([
        localCacheRepository.addTrendsMovies(diffs.itemsToAdd),
        localCacheRepository.deleteTrends(diffs.itemsToDelete),
      ]);
    }
  }

  Future<List<MovieTrending>> _fetchTrendingMovies(int limit) async {
    final response = await networkRepository.fetchTrendingMovies(
      limit: limit,
    );
    return jsonToTrendingListMapper(response.data);
  }

  Future<int> _getPagesLimit() async {
    final response = await networkRepository.fetchTrendingMovies();
    _extractDateFromHeaders(response.headers);
    return extractItemLimit(response.headers);
  }

  void _extractDateFromHeaders(Map<String, List<String>> headers) {
    final currentDate = extractDate(headers);
    if (currentDate != null) {
      dateRepository.saveTrendingLastUpdateFromApiDate(currentDate);
    }
  }
}
