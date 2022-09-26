import 'package:domain/domain.dart';
import 'package:domain/src/mappers/extract_header_value.dart';
import 'package:domain/src/mappers/json_to_trending_list.dart';
import 'package:domain/src/use_cases/base/out_use_case.dart';

class FetchTrendingMoviesUseCase
    extends OutUseCase<Future<List<MovieTrending>>> {
  final TraktApiNetworkRepository networkRepository;
  final JsonToTrendingListMapper jsonToTrendingListMapper;
  final ExtractItemLimitMapper extractItemLimit;

  FetchTrendingMoviesUseCase({
    required this.networkRepository,
    required this.jsonToTrendingListMapper,
    required this.extractItemLimit,
  });

  @override
  Future<List<MovieTrending>> call() async {
    final int limit = await _getPagesLimit();
    return _fetchTrendingMovies(limit);
  }

  Future<List<MovieTrending>> _fetchTrendingMovies(int limit) async {
    final response = await networkRepository.fetchTrendingMovies(
      limit: limit,
    );
    return jsonToTrendingListMapper(response.data);
  }

  Future<int> _getPagesLimit() async {
    final response = await networkRepository.fetchTrendingMovies();
    return extractItemLimit(response.headers);
  }
}
