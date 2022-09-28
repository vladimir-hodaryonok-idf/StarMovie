import 'package:data/src/key_store/store.dart';
import 'package:data/src/request/tmdb_api/constants/query.dart';
import 'package:dio/dio.dart';

class TmdbApiInterceptor implements Interceptor {
  final ApiKeyStore apiKeyStore;

  const TmdbApiInterceptor({required this.apiKeyStore});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.queryParameters = {
      TmdbQueryKeys.tmdbApiKey: apiKeyStore.tmdbApiKey,
    };
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) =>
      handler.next(err);

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) =>
      handler.next(response);
}
