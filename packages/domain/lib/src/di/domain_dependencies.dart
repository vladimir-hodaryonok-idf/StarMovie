import 'package:domain/domain.dart';
import 'package:domain/src/mappers/base_mapper.dart';
import 'package:domain/src/mappers/extract_header_value.dart';
import 'package:domain/src/mappers/json_to_anticipated_list.dart';
import 'package:domain/src/mappers/json_to_trending_list.dart';
import 'package:get_it/get_it.dart';

final inject = GetIt.I;

void initDomainDependencies() {
  initMappers();
  initUseCases();
}

void initUseCases() {
  inject.registerFactory(() => InitialApiCallUseCase());
  inject.registerFactory(
    () => FetchTrendingMoviesUseCase(
      networkRepository: inject.get(),
      jsonToTrendingList: inject.get(),
      extractItemLimit: inject.get(),
    ),
  );
  inject.registerFactory(
    () => FetchAnticipatedMoviesUseCase(
      networkRepository: inject.get(),
      extractItemLimit: inject.get(),
      jsonToAnticipatedList: inject.get(),
    ),
  );
  inject.registerFactory(
    () => FetchCrewAndCastUseCase(
      networkRepository: inject.get(),
    ),
  );
}

void initMappers() {
  inject.registerFactory<Mapper<dynamic, List<MovieTrending>>>(
    () => JsonToTrendingList(),
  );
  inject.registerFactory<Mapper<Map<String, List<String>>, int>>(
    () => ExtractItemLimit(),
  );
  inject.registerFactory<Mapper<dynamic, List<MovieAnticipated>>>(
    () => JsonToAnticipatedList(),
  );
}
