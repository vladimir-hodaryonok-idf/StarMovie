import 'package:data/src/di/tmdb_api_module.dart';
import 'package:data/src/di/trakt_api_module.dart';
import 'package:data/src/key_store/store.dart';
import 'package:data/src/remote/service/service.dart';
import 'package:data/src/repositories/tmdb_api_network_repository_impl.dart';
import 'package:data/src/repositories/trakt_api_network_repository_impl.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'const/tmdb_api_names.dart';
import 'const/trakt_api_names.dart';
import 'key_store_loader/key_store_loader.dart';

final inject = GetIt.I;
const keysPath = 'keys.json';

Future<void> initDataDependencies() async {
  initApiKeyStore(await keys());
  initNetworkModule();
  initLocalModule();
}

Future<Map<String, dynamic>> keys() async {
  final keyStoreLoader = KeyStoreLoader(path: keysPath);
  return keyStoreLoader.load();
}

void initApiKeyStore(Map<String, dynamic> apiKeys) {
  inject.registerLazySingleton<ApiKeyStore>(
    () => ApiKeyStore(
      apiKeys,
      isProd: inject.get<FlavorConfig>().isProd,
    ),
  );
  inject.registerFactory<String>(
    () => inject.get<ApiKeyStore>().omdbApiKey,
    instanceName: OmdbApiNameKey.omdbApiKey,
  );
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
      tmdbService: inject.get<ApiService>(
        instanceName: TmdbApiNames.tmdbApiDioServiceName,
      ),
    ),
  );
}

void initTraktApiNetworkRepository() {
  inject.registerLazySingleton<TraktApiNetworkRepository>(
    () => TraktApiNetworkRepositoryImpl(
      traktService: inject.get<ApiService>(
        instanceName: TraktApiNames.traktApiDioServiceName,
      ),
    ),
  );
}
