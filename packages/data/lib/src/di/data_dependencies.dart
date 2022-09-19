import 'package:data/src/di/trakt_api_module.dart';
import 'package:data/src/key_store/store.dart';
import 'package:data/src/remote/service/service.dart';
import 'package:data/src/repositories/network_repository_impl.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
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
  inject.registerLazySingleton<ApiKeyStore>(() => ApiKeyStore(apiKeys));
  inject.registerFactory<String>(
    () => inject.get<ApiKeyStore>().omdbApiKey,
    instanceName: omdbApiKey,
  );
}

void initLocalModule() {}

void initNetworkModule() {
  initNetworkServices();
  initNetworkRepository();
}

void initNetworkServices() {
  initTraktApiModule();
}

void initNetworkRepository() {
  inject.registerLazySingleton<NetworkRepository>(
    () => NetworkRepositoryImpl(
      traktService:
          inject.get<ApiService>(instanceName: traktApiDioServiceName),
    ),
  );
}
