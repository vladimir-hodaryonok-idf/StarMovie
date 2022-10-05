import 'package:domain/domain.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:presentation/src/analitics/service.dart';
import 'package:presentation/src/app/app_bloc.dart';
import 'package:presentation/src/navigation/app_navigator.dart';
import 'package:presentation/src/pages/home_page/bloc/home_bloc.dart';
import 'package:presentation/src/pages/home_page/mappers/anticipated_to_home_list.dart';
import 'package:presentation/src/pages/home_page/mappers/movie_to_home_page_movie.dart';
import 'package:presentation/src/pages/home_page/mappers/trending_to_home_list.dart';
import 'package:presentation/src/pages/login_page/bloc/login_bloc.dart';
import 'package:presentation/src/pages/movie_details_page/bloc/movie_details_bloc.dart';
import 'package:presentation/src/pages/movie_details_page/mappers/movie_to_movie_details.dart';
import 'package:presentation/src/pages/movie_details_page/mappers/peoples_to_crew_ui_list.dart';
import 'package:presentation/src/pages/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:needle_di/needle_di.dart';

final inject = Needle.instance;

void initPresentationModule() {
  initNavigatorModule();
  initUiLayerMappers();
  initAnalytics();
  initBlocModule();
}

void initAnalytics() {
  inject.registerSingleton(
    instance: Analytics(FirebaseAnalytics.instance),
  );
}

void initNavigatorModule() {
  inject.registerLazySingleton<AppNavigator>(() => AppNavigator());
  inject.registerFactory<AppBloc>(() => AppBloc());
}

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

  inject.registerFactory<LoginBloc>(
    () => LoginBloc(
      inject.get(),
      inject.get(),
      inject.get(),
      inject.get(),
    ),
  );
}
