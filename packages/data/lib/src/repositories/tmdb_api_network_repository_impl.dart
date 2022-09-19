import 'package:data/src/remote/payloads/trakt_movies_payload.dart';
import 'package:data/src/remote/service/service.dart';
import 'package:data/src/request/api_request_representable.dart';
import 'package:data/src/request/tmdb_api/tmdb_crew_and_cast_images.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class TmdbApiNetworkRepositoryImpl implements TmdbApiNetworkRepository {
  final ApiService<ServicePayload> tmdbService;

  TmdbApiNetworkRepositoryImpl({
    required this.tmdbService,
  });

  @override
  Future<CastAndCrewImages> fetchImage(int id) async {
    final request = TmdbCrewAndCastImages.byId(id);
    final ServicePayload payload = _createPayload(request);
    final Response response = await tmdbService.request(request, payload);
    return CastAndCrewImages.fromJson(response.data);
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
