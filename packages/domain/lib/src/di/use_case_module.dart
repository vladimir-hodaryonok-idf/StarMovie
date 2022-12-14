import 'package:domain/domain.dart';
import 'package:package_info_plus/package_info_plus.dart';

void initUseCases() async {
  final packageInfo = await PackageInfo.fromPlatform();

  inject.registerFactory<PackageInfo>(() => packageInfo);

  inject.registerFactory(
    () => CheckAppVersionUseCase(
      inject.get(),
      inject.get(),
      inject.get()
    ),
  );
  inject.registerFactory(
    () => FetchTrendingMoviesUseCase(
      networkRepository: inject.get(),
      jsonToTrendingListMapper: inject.get(),
      extractItemLimit: inject.get(),
      dateRepository: inject.get(),
      localCacheRepository: inject.get(),
      extractDate: inject.get(),
    ),
  );
  inject.registerFactory(
    () => FetchAnticipatedMoviesUseCase(
      networkRepository: inject.get(),
      extractItemLimit: inject.get(),
      jsonToAnticipatedListMapper: inject.get(),
      localCacheRepository: inject.get(),
      dateRepository: inject.get(),
      extractDate: inject.get(),
    ),
  );
  inject.registerFactory(
    () => FetchCrewAndCastUseCase(
      traktApiNetworkRepository: inject.get(),
      tmdbApiNetworkRepository: inject.get(),
      castAndImagesMapper: inject.get(),
      peopleLocalRepository: inject.get(),
      castAndCrewToListMapper:  inject.get(),
    ),
  );
  inject.registerFactory(
    () => LoginWithEmailAndPassUseCase(
      authRepository: inject.get(),
      preferences: inject.get(),
    ),
  );
  inject.registerFactory<LoginGoogleUseCase>(
    () => LoginGoogleUseCase(
      preferences: inject.get(),
      authRepository: inject.get(),
    ),
  );
  inject.registerFactory<LoginFaceBookUseCase>(
    () => LoginFaceBookUseCase(
      preferences: inject.get(),
      authRepository: inject.get(),
    ),
  );
  inject.registerFactory(() => LogButtonUseCase(inject.get()));
  inject.registerFactory(() => LogPageUseCase(inject.get()));
  inject.registerFactory(() => FetchReviewsUseCase(inject.get()));
  inject.registerFactory(() => UpdateAppUseCase());
}
