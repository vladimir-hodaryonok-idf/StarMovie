import 'package:get_it/get_it.dart';
import 'package:presentation/src/app/app_bloc.dart';
import 'package:presentation/src/navigation/app_navigator.dart';
import 'package:presentation/src/pages/home_page/bloc/home_bloc.dart';
import 'package:presentation/src/pages/splash_screen/bloc/splash_screen_bloc.dart';

final inject = GetIt.I;

void initPresentationModule() {
  inject.registerLazySingleton<AppNavigator>(() => AppNavigator());
  inject.registerFactory<AppBloc>(() => AppBloc());
  inject.registerFactory<SplashScreenBloc>(() => SplashScreenBloc());
  inject.registerFactory<HomeBloc>(() => HomeBloc());
}
