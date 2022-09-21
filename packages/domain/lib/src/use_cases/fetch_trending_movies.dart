import 'package:domain/domain.dart';
import 'package:domain/src/use_cases/base/out_use_case.dart';

class FetchTrendingMoviesUseCase
    extends OutUseCase<Future<List<MovieTrending>>> {
  final NetworkRepository networkRepository;
  final Mapper<List, List<MovieTrending>> jsonToTrendingListMapper;
  final Mapper<Map<String, List<String>>, int> extractItemLimit;

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
