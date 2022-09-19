import 'package:data/src/key_store/store.dart';
import 'package:data/src/request/trakt_api/constants/headers.dart';
import 'package:dio/dio.dart';

class TraktApiInterceptor extends Interceptor {
  final ApiKeyStore apiKeyStore;

  TraktApiInterceptor({required this.apiKeyStore});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers = {
      TraktApiHeadersKeys.apiKey: apiKeyStore.traktApiKey,
    };
    handler.next(options);
  }
}
