import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';
import 'package:star_movie/flavor_configurator/flavor_configurator.dart';
import 'package:needle_di/needle_di.dart';

final inject = Needle.instance;

Future<void> initDependencies(FlavorConfigurator flavorConfigurator) async {
  await initConfig(flavorConfigurator);
  initPresentationModule();
  initDomainDependencies();
  await initDataDependencies();
}

Future<void> initConfig(FlavorConfigurator flavorConfigurator) async => inject
    .registerSingleton(instance: await flavorConfigurator.configureData());
