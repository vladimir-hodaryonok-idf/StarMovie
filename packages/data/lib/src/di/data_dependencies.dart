import 'package:data/src/di/const/tmdb_api_names.dart';
import 'package:data/src/di/tmdb_api_module.dart';
import 'package:data/src/di/trakt_api_module.dart';
import 'package:data/src/remote/service/service.dart';
import 'package:data/src/repositories/tmdb_api_network_repository_impl.dart';
import 'package:data/src/repositories/trakt_api_network_repository_impl.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'const/trakt_api_names.dart';

final inject = GetIt.I;

void initDataDependencies() {
  initNetworkModule();
  initLocalModule();
}

void initLocalModule() {}

void initNetworkModule() {
  initNetworkServices();
  initTraktApiNetworkRepository();
  initTmdbApiNetworkRepository();
}

void initNetworkServices() {
  initTraktApiModule();
  initTmdbApiModule();
}

void initTmdbApiNetworkRepository() {
  inject.registerLazySingleton<TmdbApiNetworkRepository>(
    () => TmdbApiNetworkRepositoryImpl(
      tmdbService: inject.get<ApiService>(instanceName: tmdbApiDioServiceName),
    ),
  );
}

void initTraktApiNetworkRepository() {
  inject.registerLazySingleton<TraktApiNetworkRepository>(
    () => TraktApiNetworkRepositoryImpl(
      traktService:
          inject.get<ApiService>(instanceName: traktApiDioServiceName),
    ),
  );
}
