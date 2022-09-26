import 'package:data/src/di/const/connection_time_out.dart';
import 'package:data/src/remote/interceptors/tmdb_api_interceptor.dart';
import 'package:data/src/remote/service/service.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:data/src/di/const/base_url.dart';

import 'const/tmdb_api_names.dart';

void initTmdbApiModule() {
  initTmdbApiBaseOptions();
  initTmdbApiInterceptors();
  initTmdbApiDio();
  initTmdbApiService();
}

void initTmdbApiService() {
  inject.registerFactory<ApiService>(
    () => DioService(
      inject.get<Dio>(
        instanceName: TmdbApiNames.tmdbApiDioName,
      ),
    ),
    instanceName: TmdbApiNames.tmdbApiDioServiceName,
  );
}

void initTmdbApiDio() {
  inject.registerFactory<Dio>(
    () => Dio(
      inject.get(
        instanceName: TmdbApiNames.tmdbApiBaseOptionsName,
      ),
    )..interceptors.addAll([
        inject.get<PrettyDioLogger>(),
        inject.get<TmdbApiInterceptor>(),
      ]),
    instanceName: TmdbApiNames.tmdbApiDioName,
  );
}

void initTmdbApiInterceptors() {
  inject.registerFactory<TmdbApiInterceptor>(
    () => TmdbApiInterceptor(
      apiKeyStore: inject.get(),
    ),
  );
}

void initTmdbApiBaseOptions() {
  inject.registerFactory<BaseOptions>(
    () => BaseOptions(
      baseUrl: BaseUrl.tmdbApi,
      connectTimeout: ConnectionTimeOuts.connectTimeout,
      sendTimeout: ConnectionTimeOuts.sendTimeout,
      receiveTimeout: ConnectionTimeOuts.receiveTimeout,
    ),
    instanceName: TmdbApiNames.tmdbApiBaseOptionsName,
  );
}
