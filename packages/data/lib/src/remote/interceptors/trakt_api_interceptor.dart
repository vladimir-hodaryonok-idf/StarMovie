import 'package:data/src/key_store/store.dart';
import 'package:data/src/request/trakt_api/constants/headers.dart';
import 'package:dio/dio.dart';

class TraktApiInterceptor implements Interceptor {
  final ApiKeyStore apiKeyStore;

  const TraktApiInterceptor({required this.apiKeyStore});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers = {
      TraktApiHeadersKeys.apiKey: apiKeyStore.traktApiKey,
    };
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) =>
      handler.next(err);

  @override
  void onResponse(
          Response<dynamic> response, ResponseInterceptorHandler handler) =>
      handler.next(response);
}
