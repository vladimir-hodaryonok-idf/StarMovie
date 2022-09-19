import 'package:data/src/di/const/connection_time_out.dart';
import 'package:data/src/di/const/tmdb_api_names.dart';
import 'package:data/src/remote/interceptors/tmdb_api_interceptor.dart';
import 'package:data/src/remote/service/service.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:data/src/di/const/base_url.dart';

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
        instanceName: tmdbApiDioName,
      ),
    ),
    instanceName: tmdbApiDioServiceName,
  );
}

void initTmdbApiDio() {
  inject.registerFactory<Dio>(
    () => Dio(
      inject.get(
        instanceName: tmdbApiBaseOptionsName,
      ),
    )..interceptors.addAll([
        inject.get<PrettyDioLogger>(),
        inject.get<TmdbApiInterceptor>(),
      ]),
    instanceName: tmdbApiDioName,
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
    instanceName: tmdbApiBaseOptionsName,
  );
}
