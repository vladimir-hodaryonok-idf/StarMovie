import 'package:data/src/di/trakt_api_module.dart';
import 'package:data/src/remote/service/service.dart';
import 'package:data/src/repositories/network_repository_impl.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'const/trakt_api_names.dart';

final inject = GetIt.I;

void initDataDependencies() {
  initNetworkModule();
  initLocalModule();
}

void initLocalModule() {
}

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
      traktService: inject.get<ApiService>(instanceName: traktApiDioServiceName),
    ),
  );
}
