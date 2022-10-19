import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/data.dart';
import 'package:data/src/di/tmdb_api_module.dart';
import 'package:data/src/di/trakt_api_module.dart';
import 'package:data/src/key_store/store.dart';
import 'package:data/src/remote/service/service.dart';
import 'package:data/src/services/analytics_service_impl.dart';
import 'package:data/src/repositories/auth_repository_impl.dart';
import 'package:data/src/repositories/tmdb_api_network_repository_impl.dart';
import 'package:data/src/repositories/trakt_api_network_repository_impl.dart';
import 'package:domain/domain.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'const/tmdb_api_names.dart';
import 'const/trakt_api_names.dart';
import 'key_store_loader/key_store_loader.dart';
import 'package:needle_di/needle_di.dart';
import 'local_module.dart';

final inject = Needle.instance;

Future<void> initDataDependencies() async {
  await initApiKeyStore();
  initNetworkModule();
  await initLocalModule();
}

Future<Map<String, dynamic>> loadKeys() async {
  const sandboxPath = 'keys_sandbox.json';
  const prodPath = 'keys_prod.json';
  final keysPath = inject.get<DataConfig>().isProd ? prodPath : sandboxPath;
  final keyStoreLoader = KeyStoreLoader(path: keysPath);
  return keyStoreLoader.load();
}

Future<void> initApiKeyStore() async {
  final keys = await loadKeys();
  inject.registerLazySingleton<ApiKeyStore>(
    () => ApiKeyStore(
      keys,
    ),
  );
  inject.registerFactory<String>(
    () => inject.get<ApiKeyStore>().omdbApiKey,
    instanceName: OmdbApiNameKey.omdbApiKey,
  );
}

void initNetworkModule() {
  initNetworkServices();
  initTraktApiNetworkRepository();
  initTmdbApiNetworkRepository();
  initAuthFireBaseRepository();
  initAnalyticsService();
}

void initAnalyticsService() {
  inject.registerSingleton<AnalyticsService>(
    instance: AnalyticsServiceImpl(FirebaseAnalytics.instance),
  );
}

void initAuthFireBaseRepository() {
  inject.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      firebaseAuth: FirebaseAuth.instance,
      firebaseFirestore: FirebaseFirestore.instance,
      facebookAuth: FacebookAuth.instance,
    ),
  );
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
