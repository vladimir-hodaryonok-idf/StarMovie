import 'package:domain/domain.dart';
import 'package:domain/src/mappers/cast_and_image_list_mapper.dart';
import 'package:domain/src/mappers/duration_to_string.dart';
import 'package:domain/src/mappers/extract_header_value.dart';
import 'package:domain/src/mappers/json_to_anticipated_list.dart';
import 'package:domain/src/mappers/json_to_trending_list.dart';
import 'package:domain/src/mappers/list_to_genres_string.dart';
import 'package:domain/src/mappers/movie_id_to_image_url.dart';
import 'package:domain/src/mappers/movie_rating_to_stars_count.dart';
import 'package:domain/src/mappers/rating_to_string.dart';
import 'package:get_it/get_it.dart';

final inject = GetIt.I;

const movieRatingToStarsCount = 'movieRatingToStarsCount';
const durationToString = 'durationToString';
const movieIdToImage = 'movieIdToImage';
const omdbApiKey = 'omdbApiKeyName';
const listToGenresString = 'listToGenresString';
const ratingToString = 'ratingToString';

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
  inject.registerFactory<Mapper<List, List<MovieTrending>>>(
    () => JsonToTrendingList(),
  );
  inject.registerFactory<Mapper<Map<String, List<String>>, int>>(
    () => ExtractItemLimit(),
  );
  inject.registerFactory<Mapper<List, List<MovieAnticipated>>>(
    () => JsonToAnticipatedList(),
  );
  inject.registerFactory<Mapper<double, int>>(
    () => MovieRatingToStarsCountMapper(),
    instanceName: movieRatingToStarsCount,
  );
  inject.registerFactory<Mapper<int, String>>(
    () => DurationToStringMapper(),
    instanceName: durationToString,
  );
  inject.registerFactory<Mapper<String, String>>(
    () => MovieIdToImageUrlMapper(
      apiKey: inject.get(instanceName: omdbApiKey),
    ),
    instanceName: movieIdToImage,
  );
  inject.registerFactory<Mapper<List<String>, String>>(
    () => ListToGenresString(),
    instanceName: listToGenresString,
  );
  inject.registerFactory<Mapper<double, String>>(
    () => RatingToStringMapper(),
    instanceName: ratingToString,
  );
  inject.registerFactory<CastAndImagesListMapper>(
    () => CastAndImagesListMapper(),
  );
}
