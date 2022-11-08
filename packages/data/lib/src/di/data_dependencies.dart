import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/src/config_model/config_data.dart';
import 'package:data/src/di/tmdb_api_module.dart';
import 'package:data/src/di/trakt_api_module.dart';
import 'package:data/src/key_store/store.dart';
import 'package:data/src/remote/service/dio_service.dart';
import 'package:data/src/remote/service/facebook_auth_service.dart';
import 'package:data/src/remote/service/firebase_auth_service.dart';
import 'package:data/src/remote/service/firebase_firerstore_service.dart';
import 'package:data/src/remote/service/google_auth_service.dart';
import 'package:data/src/repositories/app_version_repsitory_impl.dart';
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
  initAppVersionRepository();
}

void initAppVersionRepository() {
  inject.registerFactory<AppVersionRepository>(
    () => AppVersionRepositoryImpl(
      inject.get(),
      inject.get(),
    ),
  );
}

void initAuthFireBaseRepository() {
  inject.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      firebaseAuth: inject.get(),
      firebaseFirestore: inject.get(),
      facebookAuth: inject.get(),
      googleAuthService: GoogleAuthServiceImpl(),
    ),
  );
}

void initNetworkServices() {
  initTraktApiModule();
  initTmdbApiModule();
  initFirebaseFirestore();
  initAnalyticsService();
  initFacebookAuthService();
  initFirebaseAuthService();
}

void initFirebaseAuthService() {
  inject.registerSingleton<FirebaseAuth>(instance: FirebaseAuth.instance);
  inject.registerSingleton<FirebaseAuthService>(
    instance: FirebaseAuthServiceImpl(
      inject.get(),
    ),
  );
}

void initFacebookAuthService() {
  inject.registerSingleton<FacebookAuth>(instance: FacebookAuth.instance);
  inject.registerSingleton<FacebookAuthService>(
    instance: FacebookAuthServiceImpl(
      inject.get(),
    ),
  );
}

void initAnalyticsService() {
  inject.registerSingleton<AnalyticsService>(
    instance: AnalyticsServiceImpl(FirebaseAnalytics.instance),
  );
}

void initFirebaseFirestore() {
  inject.registerSingleton<FireStoreService>(
    instance: FireStoreServiceImpl(FirebaseFirestore.instance),
  );
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
