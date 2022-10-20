import 'package:domain/src/mappers/extract_date.dart';
import 'package:domain/src/mappers/extract_header_value.dart';
import 'package:domain/src/mappers/is_api_request_allowed.dart';
import 'package:domain/src/models/movie_model/movie_anticipated.dart';
import 'package:domain/src/repositories/date_repository.dart';
import 'package:domain/src/repositories/movie_local_repository.dart';
import 'package:domain/src/repositories/trakt_api_network_repository.dart';
import 'package:domain/src/use_cases/base/out_use_case.dart';
import 'package:domain/src/mappers/json_to_anticipated_list.dart';

class FetchAnticipatedMoviesUseCase
    implements OutUseCase<Future<List<MovieAnticipated>>> {
  final TraktApiNetworkRepository networkRepository;
  final DatePreferencesRepository dateRepository;
  final MovieLocalCacheRepository localCacheRepository;
  final ExtractItemLimitMapper extractItemLimit;
  final JsonToAnticipatedList jsonToAnticipatedListMapper;
  final ExtractDateMapper extractDate;
  final IsApiRequestAllowedMapper isApiRequestAllowed;

  const FetchAnticipatedMoviesUseCase({
    required this.networkRepository,
    required this.extractItemLimit,
    required this.jsonToAnticipatedListMapper,
    required this.localCacheRepository,
    required this.dateRepository,
    required this.extractDate,
    required this.isApiRequestAllowed,
  });

  @override
  Future<List<MovieAnticipated>> call() async {
    final lastRequestDate = dateRepository.getAnticipatedLastUpdateDate();
    if(isApiRequestAllowed(lastRequestDate)){
      return _fetchThenCache();
    }
    return localCacheRepository.getAnticipated();
  }

  Future<List<MovieAnticipated>> _fetchThenCache() async {
    final int limit = await _getPagesLimit();
    final anticipated = await _fetchAnticipatedMovies(limit);
    final isCacheActual = await _compareWithCache(anticipated);
    if(isCacheActual){
      return anticipated;
    }
    await localCacheRepository.saveAnticipatedIntoCache(anticipated);
    return anticipated;
  }

  Future<bool> _compareWithCache(List<MovieAnticipated> trends){
    final idList = trends.map((e) => e.movie.ids?.trakt ?? -1).toList();
    return localCacheRepository.isCachedAnticipatedActual(idList);
  }

  Future<List<MovieAnticipated>> _fetchAnticipatedMovies(int limit) async {
    final response = await networkRepository.fetchAnticipatedMovies(
      limit: limit,
    );
    return jsonToAnticipatedListMapper(response.data);
  }

  Future<int> _getPagesLimit() async {
    final response = await networkRepository.fetchAnticipatedMovies();
    _saveRequestDate(response.headers);
    return extractItemLimit(response.headers);
  }

  void _saveRequestDate(Map<String, List<String>> headers) {
    final currentDate = extractDate(headers);
    if (currentDate != null) {
      dateRepository.saveAnticipatedLastUpdateFromApiDate(currentDate);
    }
  }
}
