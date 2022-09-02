import 'package:get_it/get_it.dart';
import 'package:presentation/src/app/app_bloc.dart';
import 'package:presentation/src/navigation/app_navigator.dart';

final inject = GetIt.I;

void initPresentationModule() {
  inject.registerLazySingleton<AppNavigator>(() => AppNavigator());
  inject.registerFactory<AppBloc>(() => AppBloc());
}
