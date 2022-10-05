import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:star_movie/di/init_dependencies.dart';
import 'package:star_movie/flavor_configurator/flavor_configurator.dart';

Future<void> initApp(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  final flavorConfigurator = FlavorConfigurator(flavor: flavor);
  await initDependencies(flavorConfigurator);
  runApp(
    StarMovieApp(
      config: await flavorConfigurator.configurePresentation(),
    ),
  );
}
