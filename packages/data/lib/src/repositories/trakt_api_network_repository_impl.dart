import 'package:data/src/remote/payloads/trakt_movies_payload.dart';
import 'package:data/src/remote/service/service.dart';
import 'package:data/src/request/api_request_representable.dart';
import 'package:data/src/request/trakt_api/trakt_api_movies.dart';
import 'package:data/src/request/trakt_api/trakt_api_peoples.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class TraktApiNetworkRepositoryImpl implements TraktApiNetworkRepository {
  final ApiService<ServicePayload> traktService;

  TraktApiNetworkRepositoryImpl({required this.traktService});

  Future<ListResponseModel> _fetchData(APIRequestRepresentable request) async {
    final ServicePayload payload = _createPayload(request);
    final Response response = await traktService.request(request, payload);
    return ListResponseModel(
      headers: response.headers.map,
      data: response.data,
    );
  }

  @override
  Future<ListResponseModel> fetchAnticipatedMovies({int? limit}) {
    final anticipatedRequest = TraktApiMovies.anticipated(limit: limit);
    return _fetchData(anticipatedRequest);
  }

  @override
  Future<ListResponseModel> fetchTrendingMovies({int? limit}) {
    final trendingRequest = TraktApiMovies.trending(limit: limit);
    return _fetchData(trendingRequest);
  }

  @override
  Future<ListResponseModel> fetchCrewAndCast(int id) {
    final request = TraktApiPeoples.castAndCrew(id);
    return _fetchData(request);
  }

  ServicePayload _createPayload(APIRequestRepresentable request) {
    return DioServicePayload(
      Options(
        method: request.method,
        headers: request.headers,
      ),
    );
  }
}
