import 'package:data/src/remote/payloads/trakt_movies_payload.dart';
import 'package:data/src/remote/service/service.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class NetworkRepositoryImpl implements NetworkRepository {
  final ApiService<ServicePayload> traktService;

  NetworkRepositoryImpl({required this.traktService});

  @override
  Future<ResponseModel> fetchData(APIRequestRepresentable request) async {
    final ServicePayload payload = _createPayload(request);
    final Response response = await traktService.request(request, payload);
    return ResponseModel(
      headers: response.headers.map,
      data: response.data,
    );
  }

  ServicePayload _createPayload(APIRequestRepresentable request) {
    return TraktMoviesPayload(
      Options(
        method: request.method.string,
        headers: request.headers,
      ),
    );
  }
}
