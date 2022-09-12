import 'package:domain/src/mappers/base_mapper.dart';
import 'package:domain/src/repositories/network_repository.dart';
import 'package:domain/src/request/trakt_api/trakt_api_movies.dart';
import 'package:domain/src/usecases/base/out_use_case.dart';
import 'package:domain/src/models/movie_model/movie_anticipated.dart';

class FetchAnticipatedMoviesUseCase
    extends OutUseCase<Future<List<MovieAnticipated>>> {
  final NetworkRepository networkRepository;
  final Mapper<Map<String, List<String>>, int> extractItemLimit;
  final Mapper<dynamic, List<MovieAnticipated>> jsonToAnticipatedList;

  FetchAnticipatedMoviesUseCase({
    required this.networkRepository,
    required this.extractItemLimit,
    required this.jsonToAnticipatedList,
  });

  @override
  Future<List<MovieAnticipated>> call() async {
    final int limit = await _getPagesLimit();
    return _fetchAnticipatedMovies(limit);
  }

  Future<List<MovieAnticipated>> _fetchAnticipatedMovies(int limit) async {
    final trendingRequest = TraktApiMovies.anticipated(limit: limit);
    final response = await networkRepository.fetchData(trendingRequest);
    return jsonToAnticipatedList(response.data);
  }

  Future<int> _getPagesLimit() async {
    final request = TraktApiMovies.anticipated();
    final response = await networkRepository.fetchData(request);
    return extractItemLimit(response.headers);
  }
}
