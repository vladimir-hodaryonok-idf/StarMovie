import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';
import 'package:star_movie/flavor_configurator/flavor_configurator.dart';
import 'package:get_it/get_it.dart';

final inject = GetIt.I;

Future<void> initDependencies(Flavor flavor) async {
  await initConfig(flavor);
  initPresentationModule();
  initDomainDependencies();
  await initDataDependencies();
}

Future<void> initConfig(Flavor flavor) async =>
    inject.registerSingleton(await FlavorConfigurator.configureData(flavor));
