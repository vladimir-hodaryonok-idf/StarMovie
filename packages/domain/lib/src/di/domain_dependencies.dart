import 'package:domain/src/usecases/initial_api_call.dart';
import 'package:get_it/get_it.dart';

final inject = GetIt.I;

void initDomainDependencies() {
  initUseCases();
}

void initUseCases() {
  inject.registerFactory<InitialApiCallUseCase>(() => InitialApiCallUseCase());
}
