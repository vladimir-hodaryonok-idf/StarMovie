import 'package:presentation/src/app/app_bloc.dart';
import 'package:presentation/src/di/presentation_dependencies.dart';
import 'package:presentation/src/navigation/app_navigator.dart';

void initNavigatorModule() {
  inject.registerLazySingleton<AppNavigator>(() => AppNavigator());
  inject.registerFactory<AppBloc>(
        () => AppBloc(
      inject.get(),
      inject.get(),
    ),
  );
}