import 'package:data/src/key_store/store.dart';
import 'package:data/src/request/tmdb_api/constants/query.dart';
import 'package:dio/dio.dart';

class TmdbApiInterceptor extends Interceptor {
  final ApiKeyStore apiKeyStore;

  TmdbApiInterceptor({required this.apiKeyStore});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters = {
      TmdbQueryKeys.tmdbApiKey: apiKeyStore.tmdbApiKey,
    };
    handler.next(options);
  }
}
