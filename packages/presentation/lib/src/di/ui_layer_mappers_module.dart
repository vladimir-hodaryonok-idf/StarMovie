import 'package:presentation/src/di/presentation_dependencies.dart';
import 'package:presentation/src/pages/home_page/mappers/movie_to_home_page_movie.dart';
import 'package:presentation/src/pages/home_page/mappers/trending_to_home_list.dart';
import 'package:presentation/src/pages/login_page/mappers/result_to_localized.dart';
import 'package:presentation/src/pages/home_page/mappers/anticipated_to_home_list.dart';
import 'package:presentation/src/pages/movie_details_page/mappers/movie_to_movie_details.dart';
import 'package:presentation/src/pages/movie_details_page/mappers/peoples_to_crew_ui_list.dart';
import 'package:presentation/src/pages/movie_details_page/mappers/reviews_to_reviews_ui.dart';

void initUiLayerMappers() {
  inject.registerFactory<MovieToHomePageMovieMapper>(
    () => MovieToHomePageMovieMapper(
      movieIdToImage: inject.get(),
      movieRatingToStarsCount: inject.get(),
      durationToString: inject.get(),
    ),
  );

  inject.registerFactory<TrendingToHomeListMapper>(
    () => TrendingToHomeListMapper(
      movieToHomePageMovieMapper: inject.get(),
    ),
  );

  inject.registerFactory<AnticipatedToHomeListMapper>(
    () => AnticipatedToHomeListMapper(
      movieToHomePageMovieMapper: inject.get(),
    ),
  );
  inject.registerFactory(
    () => MovieToMovieDetailsMapper(
      durationToString: inject.get(),
      movieIdToImage: inject.get(),
      movieRatingToStarsCount: inject.get(),
      listToGenres: inject.get(),
      ratingToString: inject.get(),
    ),
  );
  inject.registerFactory<PeoplesToCrewUiMapper>(() => PeoplesToCrewUiMapper());
  inject.registerFactory<ResultToLocalizedMapper>(
    () => ResultToLocalizedMapper(),
  );
  inject.registerFactory<ReviewsToReviewsUiMapper>(
    () => ReviewsToReviewsUiMapper(inject.get()),
  );
}
