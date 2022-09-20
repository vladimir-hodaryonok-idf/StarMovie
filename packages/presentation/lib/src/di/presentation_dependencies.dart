import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/src/app/app_bloc.dart';
import 'package:presentation/src/navigation/app_navigator.dart';
import 'package:presentation/src/pages/home_page/bloc/home_bloc.dart';
import 'package:presentation/src/pages/home_page/mappers/anticipated_to_home_list.dart';
import 'package:presentation/src/pages/home_page/mappers/movie_to_home_page_movie.dart';
import 'package:presentation/src/pages/home_page/mappers/trending_to_home_list.dart';
import 'package:presentation/src/pages/movie_details_page/bloc/movie_details_bloc.dart';
import 'package:presentation/src/pages/movie_details_page/mappers/movie_to_movie_details.dart';
import 'package:presentation/src/pages/movie_details_page/mappers/peoples_to_crew_ui_list.dart';
import 'package:presentation/src/pages/splash_screen/bloc/splash_screen_bloc.dart';

final inject = GetIt.I;

void initPresentationModule() {
  initNavigatorModule();
  initUiLayerMappers();
  initBlocModule();
}

void initNavigatorModule() {
  inject.registerLazySingleton<AppNavigator>(() => AppNavigator());
  inject.registerFactory<AppBloc>(() => AppBloc());
}

void initUiLayerMappers() {
  inject.registerFactory<MovieToHomePageMovieMapper>(
    () => MovieToHomePageMovieMapper(
      movieIdToImage: inject.get(instanceName: movieIdToImage),
      movieRatingToStarsCount:
          inject.get(instanceName: movieRatingToStarsCount),
      durationToString: inject.get(instanceName: durationToString),
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
      durationToString: inject.get(instanceName: durationToString),
      movieIdToImage: inject.get(instanceName: movieIdToImage),
      movieRatingToStarsCount:
          inject.get(instanceName: movieRatingToStarsCount),
      listToGenres: inject.get(instanceName: listToGenresString),
      ratingToString: inject.get(instanceName: ratingToString),
    ),
  );
  inject.registerFactory<PeoplesToCrewUiMapper>(() => PeoplesToCrewUiMapper());
}

void initBlocModule() {
  inject.registerFactory<SplashScreenBloc>(
    () => SplashScreenBloc(
      inject.get<InitialApiCallUseCase>(),
    ),
  );
  inject.registerFactory<HomeBloc>(
    () => HomeBloc(
      inject.get<FetchTrendingMoviesUseCase>(),
      inject.get<FetchAnticipatedMoviesUseCase>(),
      inject.get<TrendingToHomeListMapper>(),
      inject.get<AnticipatedToHomeListMapper>(),
    ),
  );
  inject.registerFactory<MovieDetailsBloc>(
    () => MovieDetailsBloc(
        inject.get<FetchCrewAndCastUseCase>(),
        inject.get<MovieToMovieDetailsMapper>(),
        inject.get<PeoplesToCrewUiMapper>()),
  );
}
