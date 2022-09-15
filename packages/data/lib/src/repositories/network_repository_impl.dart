import 'package:data/src/remote/payloads/trakt_movies_payload.dart';
import 'package:data/src/remote/service/service.dart';
import 'package:data/src/request/api_request_representable.dart';
import 'package:data/src/request/trakt_api/trakt_api_movies.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class NetworkRepositoryImpl implements NetworkRepository {
  final ApiService<ServicePayload> traktService;

  NetworkRepositoryImpl({required this.traktService});

  Future<ResponseModel> _fetchData(APIRequestRepresentable request) async {
    final ServicePayload payload = _createPayload(request);
    final Response response = await traktService.request(request, payload);
    return ResponseModel(
      headers: response.headers.map,
      data: response.data,
    );
  }

  @override
  Future<ResponseModel> fetchAnticipatedMovies({int? limit}) {
    final anticipatedRequest = TraktApiMovies.anticipated(limit: limit);
    return _fetchData(anticipatedRequest);
  }

  @override
  Future<ResponseModel> fetchTrendingMovies({int? limit}) {
    final trendingRequest = TraktApiMovies.trending(limit: limit);
    return _fetchData(trendingRequest);
  }

  ServicePayload _createPayload(APIRequestRepresentable request) {
    return DioServicePayload(
      Options(
        method: request.method.string,
        headers: request.headers,
      ),
    );
  }
}
