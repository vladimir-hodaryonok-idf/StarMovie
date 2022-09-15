import 'package:domain/src/mappers/base_mapper.dart';
import 'package:domain/src/repositories/network_repository.dart';
import 'package:domain/src/use_cases/base/out_use_case.dart';
import 'package:domain/src/models/movie_model/movie_anticipated.dart';

class FetchAnticipatedMoviesUseCase
    extends OutUseCase<Future<List<MovieAnticipated>>> {
  final NetworkRepository networkRepository;
  final Mapper<Map<String, List<String>>, int> extractItemLimitMapper;
  final Mapper<List, List<MovieAnticipated>> jsonToAnticipatedList;

  FetchAnticipatedMoviesUseCase({
    required this.networkRepository,
    required this.extractItemLimitMapper,
    required this.jsonToAnticipatedList,
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
    return jsonToAnticipatedList(response.data);
  }

  Future<int> _getPagesLimit() async {
    final response = await networkRepository.fetchAnticipatedMovies();
    return extractItemLimitMapper(response.headers);
  }
}
