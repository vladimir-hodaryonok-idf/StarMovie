import 'package:data/data.dart';
import 'package:data/src/di/const/trakt_api_names.dart';
import 'package:data/src/remote/interceptors/trakt_api_interceptor.dart';
import 'package:data/src/remote/service/dio_service.dart';
import 'package:data/src/di/const/connection_time_out.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

void initTraktApiModule() {
  initTractApiBaseOptions();
  initTraktApiInterceptors();
  initTractApiDio();
  initTraktApiService();
}

void initTraktApiService() {
  inject.registerFactory<ApiService>(
    () => DioService(
      inject.get<Dio>(instanceName: TraktApiNames.traktApiDioName),
    ),
    instanceName: TraktApiNames.traktApiDioServiceName,
  );
}

void initTractApiDio() {
  inject.registerFactory<Dio>(
    () => Dio(
      inject.get<BaseOptions>(
        instanceName: TraktApiNames.traktApiBaseOptionsName,
      ),
    )..interceptors.addAll([
        inject.get<PrettyDioLogger>(),
        inject.get<TraktApiInterceptor>(),
      ]),
    instanceName: TraktApiNames.traktApiDioName,
  );
}

void initTraktApiInterceptors() {
  inject.registerFactory<PrettyDioLogger>(() => PrettyDioLogger());
  inject.registerFactory<TraktApiInterceptor>(
    () => TraktApiInterceptor(
      apiKeyStore: inject.get(),
    ),
  );
}

void initTractApiBaseOptions() {
  inject.registerFactory<BaseOptions>(
    () => BaseOptions(
      baseUrl: inject.get<DataConfig>().baseUrl,
      connectTimeout: ConnectionTimeOuts.connectTimeout,
      sendTimeout: ConnectionTimeOuts.sendTimeout,
      receiveTimeout: ConnectionTimeOuts.receiveTimeout,
    ),
    instanceName: TraktApiNames.traktApiBaseOptionsName,
  );
}
