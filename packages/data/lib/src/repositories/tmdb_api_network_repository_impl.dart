import 'package:data/src/remote/payloads/dio_service_payload.dart';
import 'package:data/src/remote/service/service.dart';
import 'package:data/src/request/tmdb_api/tmdb_api_path_factory.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class TmdbApiNetworkRepositoryImpl implements TmdbApiNetworkRepository {
  final ApiService<ServicePayload> tmdbService;

  const TmdbApiNetworkRepositoryImpl({
    required this.tmdbService,
  });

  @override
  Future<CastAndCrewImages> fetchImage(int id) async {
    final Response response = await tmdbService.getRequest(
      path: TmdbApiPathFactory.getCrewAndCastImagesPath(id: id),
    );
    return CastAndCrewImages.fromJson(response.data);
  }
}
