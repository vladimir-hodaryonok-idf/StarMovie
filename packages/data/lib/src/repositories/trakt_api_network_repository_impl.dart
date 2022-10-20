import 'package:data/src/remote/payloads/dio_service_payload.dart';
import 'package:data/src/remote/service/service.dart';
import 'package:data/src/request/trakt_api/tract_api_query_factory.dart';
import 'package:data/src/request/trakt_api/trakt_api_path_factory.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class TraktApiNetworkRepositoryImpl implements TraktApiNetworkRepository {
  final ApiService<ServicePayload> traktService;

  const TraktApiNetworkRepositoryImpl({required this.traktService});

  Future<ListResponseModel> _fetchData({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    final Response response = await traktService.getRequest(
      path: path,
      query: query,
    );
    return ListResponseModel(
      headers: response.headers.map,
      data: (response.data as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );
  }

  @override
  Future<ListResponseModel> fetchAnticipatedMovies({int? limit}) {
    return _fetchData(
      path: TraktApiPathFactory.getAnticipatedPath(),
      query:
          TraktApiQueryFactory.generateMoviesQueryFullWithLimit(limit: limit),
    );
  }

  @override
  Future<ListResponseModel> fetchTrendingMovies({int? limit}) {
    return _fetchData(
      path: TraktApiPathFactory.getTrendingPath(),
      query:
          TraktApiQueryFactory.generateMoviesQueryFullWithLimit(limit: limit),
    );
  }

  @override
  Future<List<Cast>> fetchCrewAndCast(int id) async {
    final Response response = await traktService.getRequest(
      path: TraktApiPathFactory.getCastAndCrewPath(id),
    );
    return CrewAndCast.fromJson(response.data).cast ?? List.empty();
  }
}
