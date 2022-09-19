import 'package:domain/src/mappers/base_mapper.dart';
import 'package:domain/src/repositories/trakt_api_network_repository.dart';
import 'package:domain/src/use_cases/base/out_use_case.dart';
import 'package:domain/src/models/movie_model/movie_anticipated.dart';

class FetchAnticipatedMoviesUseCase
    extends OutUseCase<Future<List<MovieAnticipated>>> {
  final TraktApiNetworkRepository networkRepository;
  final Mapper<Map<String, List<String>>, int> extractItemLimit;
  final Mapper<List, List<MovieAnticipated>> jsonToAnticipatedListMapper;

  FetchAnticipatedMoviesUseCase({
    required this.networkRepository,
    required this.extractItemLimit,
    required this.jsonToAnticipatedListMapper,
  });

  @override
  Future<List<MovieAnticipated>> call() async {
    final int limit = await _getPagesLimit();
    return _fetchAnticipatedMovies(limit);
  }

  Future<List<MovieAnticipated>> _fetchAnticipatedMovies(int limit) async {
    final response = await networkRepository.fetchAnticipatedMovies(
      limit: limit,
    );
    return jsonToAnticipatedListMapper(response.data);
  }

  Future<int> _getPagesLimit() async {
    final response = await networkRepository.fetchAnticipatedMovies();
    return extractItemLimit(response.headers);
  }
}
