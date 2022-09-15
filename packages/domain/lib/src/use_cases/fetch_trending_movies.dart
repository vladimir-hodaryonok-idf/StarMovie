import 'package:domain/domain.dart';
import 'package:domain/src/mappers/base_mapper.dart';
import 'package:domain/src/request/trakt_api/trakt_api_movies.dart';
import 'package:domain/src/use_cases/base/out_use_case.dart';

class FetchTrendingMoviesUseCase
    extends OutUseCase<Future<List<MovieTrending>>> {
  final NetworkRepository networkRepository;
  final Mapper<dynamic, List<MovieTrending>> jsonToTrendingList;
  final Mapper<Map<String, List<String>>, int> extractItemLimit;

  FetchTrendingMoviesUseCase({
    required this.networkRepository,
    required this.jsonToTrendingList,
    required this.extractItemLimit,
  });

  @override
  Future<List<MovieTrending>> call() async {
    final int limit = await _getPagesLimit();
    return _fetchTrendingMovies(limit);
  }

  Future<List<MovieTrending>> _fetchTrendingMovies(int limit) async {
    final trendingRequest = TraktApiMovies.trending(limit: limit);
    final response = await networkRepository.fetchData(trendingRequest);
    return jsonToTrendingList(response.data);
  }

  Future<int> _getPagesLimit() async {
    final request = TraktApiMovies.trending();
    final response = await networkRepository.fetchData(request);
    return extractItemLimit(response.headers);
  }
}
