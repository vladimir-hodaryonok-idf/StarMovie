import 'package:data/src/database/dao/date_dao.dart';
import 'package:data/src/database/dao/movie_dao.dart';
import 'package:data/src/database/dao/people_dao.dart';
import 'package:data/src/database/database.dart';
import 'package:data/src/database/migrations/migrations.dart';
import 'package:data/src/repositories/people_local_repository_impl.dart';
import 'package:domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:data/src/repositories/date_repository_impl.dart';
import 'package:data/src/repositories/movie_local_cache_repository_impl.dart';
import 'package:data/src/repositories/preferences_local_repository_impl.dart';
import 'package:needle_di/needle_di.dart';

final inject = Needle.instance;

Future<void> initLocalModule() async {
  final database = await $FloorMovieDatabase
      .databaseBuilder('app_database.db')
      .addMigrations([Migrations.migration1to2]).build();
  inject.registerSingleton(instance: database);
  inject.registerFactory<MovieDao>(() => database.movieDao);
  inject.registerFactory<PeopleDao>(() => database.peopleDao);
  inject.registerFactory<DateDao>(() => database.dateDao);
  inject.registerSingleton(instance: await SharedPreferences.getInstance());
  inject.registerLazySingleton<PreferencesLocalRepository>(
    () => PreferencesLocalRepositoryImpl(sharedPreferences: inject.get()),
  );
  inject.registerLazySingleton<DateRepository>(
    () => DateRepositoryImpl(dateDao: inject.get()),
  );
  inject.registerLazySingleton<MovieLocalCacheRepository>(
    () => MovieLocalCacheRepositoryImpl(movieDao: inject.get<MovieDao>()),
  );
  inject.registerLazySingleton<PeopleLocalRepository>(
    () => PeopleLocalRepositoryImpl(peopleDao: inject.get<PeopleDao>()),
  );
}
