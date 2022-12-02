import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/pages/cast_and_crew_page/bloc/crew_and_cast_bloc.dart';
import 'package:presentation/src/pages/home_page/bloc/home_bloc.dart';
import 'package:presentation/src/pages/home_page/mappers/anticipated_to_home_list.dart';
import 'package:presentation/src/pages/home_page/mappers/trending_to_home_list.dart';
import 'package:presentation/src/pages/login_page/bloc/login_bloc.dart';
import 'package:presentation/src/pages/movie_details_page/bloc/movie_details_bloc.dart';
import 'package:presentation/src/pages/movie_details_page/mappers/movie_to_movie_details.dart';
import 'package:presentation/src/pages/movie_details_page/mappers/peoples_to_crew_ui_list.dart';
import 'package:presentation/src/pages/movie_details_page/mappers/reviews_to_reviews_ui.dart';
import 'package:presentation/src/pages/splash_screen/bloc/splash_screen_bloc.dart';

void initBlocModule() {
  inject.registerFactory(() => GlobalKey<FormState>());

  inject.registerFactory<SplashScreenBloc>(
    () => SplashScreenBloc(
      inject.get(),
      inject.get(),
    ),
  );
  inject.registerFactory<HomeBloc>(
    () => HomeBloc(
      inject.get<FetchTrendingMoviesUseCase>(),
      inject.get<FetchAnticipatedMoviesUseCase>(),
      inject.get<TrendingToHomeListMapper>(),
      inject.get<AnticipatedToHomeListMapper>(),
      inject.get<LogButtonUseCase>(),
    ),
  );
  inject.registerFactory<MovieDetailsBloc>(
    () => MovieDetailsBloc(
      inject.get<FetchCrewAndCastUseCase>(),
      inject.get<MovieToMovieDetailsMapper>(),
      inject.get<PeoplesToCrewUiMapper>(),
      inject.get<LogButtonUseCase>(),
      inject.get<FetchReviewsUseCase>(),
      inject.get<ReviewsToReviewsUiMapper>(),
    ),
  );

  inject.registerFactory<LoginBloc>(
    () => LoginBloc(
      inject.get(),
      inject.get(),
      inject.get(),
      inject.get(),
      inject.get(),
      inject.get(),
      inject.get(),
    ),
  );

  inject.registerFactory<CrewAndCastBloc>(() => CrewAndCastBloc());
}
