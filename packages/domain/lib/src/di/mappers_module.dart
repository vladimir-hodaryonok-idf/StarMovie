import 'package:domain/domain.dart';
import 'package:domain/src/mappers/cast_and_crew_to_list_mapper.dart';
import 'package:domain/src/mappers/cast_and_image_list_mapper.dart';
import 'package:domain/src/mappers/extract_date.dart';
import 'package:domain/src/mappers/extract_header_value.dart';
import 'package:domain/src/mappers/json_to_anticipated_list.dart';
import 'package:domain/src/mappers/json_to_trending_list.dart';

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
  inject.registerFactory<ValidateLoginFormUseCase>(
    () => ValidateLoginFormUseCase(),
  );

  inject.registerFactory<ExtractDateMapper>(
    () => ExtractDateMapper(),
  );

  inject.registerFactory<VersionToIntMapper>(
    () => VersionToIntMapper(),
  );
  inject.registerFactory<CastAndCrewToListMapper>(
    () => CastAndCrewToListMapper(),
  );
}
