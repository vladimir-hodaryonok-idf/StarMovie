import 'package:domain/domain.dart';
import 'package:domain/src/mappers/cast_and_image_list_mapper.dart';
import 'package:domain/src/mappers/extract_header_value.dart';
import 'package:domain/src/mappers/json_to_anticipated_list.dart';
import 'package:domain/src/mappers/json_to_trending_list.dart';
import 'package:get_it/get_it.dart';

final inject = GetIt.I;

const omdbApiKey = 'omdbApiKeyName';

void initDomainDependencies() {
  initMappers();
  initUseCases();
}

void initUseCases() {
  inject.registerFactory(() => InitialApiCallUseCase());
  inject.registerFactory(
    () => FetchTrendingMoviesUseCase(
      networkRepository: inject.get(),
      jsonToTrendingListMapper: inject.get(),
      extractItemLimit: inject.get(),
    ),
  );
  inject.registerFactory(
    () => FetchAnticipatedMoviesUseCase(
      networkRepository: inject.get(),
      extractItemLimit: inject.get(),
      jsonToAnticipatedListMapper: inject.get(),
    ),
  );
  inject.registerFactory(
    () => FetchCrewAndCastUseCase(
      traktApiNetworkRepository: inject.get(),
      tmdbApiNetworkRepository: inject.get(),
      castAndImagesListMapper: inject.get(),
    ),
  );
}

void initMappers() {
  inject.registerFactory<JsonToTrendingListMapper>(
    () => JsonToTrendingListMapper(),
  );
  inject.registerFactory<ExtractItemLimitMapper>(
    () => ExtractItemLimitMapper(),
  );
  inject.registerFactory<JsonToAnticipatedList>(
    () => JsonToAnticipatedList(),
  );
  inject.registerFactory<MovieRatingToStarsCountMapper>(
    () => MovieRatingToStarsCountMapper(),
  );
  inject.registerFactory<DurationToStringMapper>(
    () => DurationToStringMapper(),
  );
  inject.registerFactory<MovieIdToImageUrlMapper>(
    () => MovieIdToImageUrlMapper(
      apiKey: inject.get(instanceName: omdbApiKey),
    ),
  );
  inject.registerFactory<ListToGenresStringMapper>(
    () => ListToGenresStringMapper(),
  );

  inject.registerFactory<CastAndImagesListMapper>(
    () => CastAndImagesListMapper(),
  );
}
