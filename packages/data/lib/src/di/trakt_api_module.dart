import 'package:data/src/remote/service/service.dart';
import 'package:data/src/di/const/base_url.dart';
import 'package:data/src/di/const/connection_time_out.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:data/src/di/const/trakt_api_names.dart';

void initTraktApiModule() {
  initTractApiBaseOptions();
  initInterceptors();
  initTractApiDio();
  initTraktApiService();
}

void initTraktApiService() {
  inject.registerFactory<ApiService>(
    () => DioService(
      inject.get<Dio>(instanceName: traktApiDioName),
    ),
    instanceName: traktApiDioServiceName,
  );
}

void initTractApiDio() {
  inject.registerFactory<Dio>(
    () => Dio(inject.get<BaseOptions>(
      instanceName: traktApiBaseOptionsName,
    ))
      ..interceptors.add(
        inject.get<Interceptor>(),
      ),
    instanceName: traktApiDioName,
  );
}

void initInterceptors() {
  inject.registerFactory<Interceptor>(() => PrettyDioLogger());
}

void initTractApiBaseOptions() {
  inject.registerFactory<BaseOptions>(
    () => BaseOptions(
      baseUrl: BaseUrl.traktApi,
      connectTimeout: ConnectionTimeOuts.connectTimeout,
      sendTimeout: ConnectionTimeOuts.sendTimeout,
      receiveTimeout: ConnectionTimeOuts.receiveTimeout,
    ),
    instanceName: traktApiBaseOptionsName,
  );
}
