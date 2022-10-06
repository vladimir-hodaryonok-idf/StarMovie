import 'package:domain/domain.dart';
import 'package:domain/src/mappers/cast_and_image_list_mapper.dart';
import 'package:domain/src/mappers/extract_header_value.dart';
import 'package:domain/src/mappers/json_to_anticipated_list.dart';
import 'package:domain/src/mappers/json_to_trending_list.dart';
import 'package:needle_di/needle_di.dart';

final inject = Needle.instance;

void initDomainDependencies() {
  initMappers();
  initUseCases();
  initPlugins();
}

void initPlugins() {
  inject.registerFactory<ShareMovie>(() => ShareMovie());
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
      castAndImagesMapper: inject.get(),
    ),
  );
  inject.registerFactory(
    () => LoginWithEmailAndPassUseCase(
      authRepository: inject.get(),
      preferences: inject.get(),
    ),
  );
  inject.registerFactory<LoginGoogleUseCase>(
    () => LoginGoogleUseCase(
      preferences: inject.get(),
      authRepository: inject.get(),
    ),
  );
  inject.registerFactory<LoginFaceBookUseCase>(
    () => LoginFaceBookUseCase(
      preferences: inject.get(),
      authRepository: inject.get(),
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
      apiKey: inject.get(instanceName: OmdbApiNameKey.omdbApiKey),
    ),
  );
  inject.registerFactory<ListToGenresStringMapper>(
    () => ListToGenresStringMapper(),
  );

  inject.registerFactory<CastAndImagesMapper>(() => CastAndImagesMapper());

  inject.registerFactory<RatingToStringMapper>(() => RatingToStringMapper());
}
