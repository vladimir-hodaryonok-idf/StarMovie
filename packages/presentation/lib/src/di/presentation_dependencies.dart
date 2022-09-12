import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/src/app/app_bloc.dart';
import 'package:presentation/src/navigation/app_navigator.dart';
import 'package:presentation/src/pages/home_page/bloc/home_bloc.dart';
import 'package:presentation/src/pages/movie_details_page/bloc/movie_details_bloc.dart';
import 'package:presentation/src/pages/splash_screen/bloc/splash_screen_bloc.dart';

final inject = GetIt.I;

void initPresentationModule() {
  initNavigatorModule();
  initBlocModule();
}

void initNavigatorModule() {
  inject.registerLazySingleton<AppNavigator>(() => AppNavigator());
  inject.registerFactory<AppBloc>(() => AppBloc());
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
    ),
  );
  inject.registerFactory<MovieDetailsBloc>(() => MovieDetailsBloc());
}
