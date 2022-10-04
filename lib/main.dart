import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:star_movie/di/init_dependencies.dart';
import 'package:star_movie/flavor_configurator/flavor_configurator.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

Future<void> initApp(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initDependencies(flavor);

  runApp(
    StarMovieApp(
      config: await FlavorConfigurator.configurePresentation(flavor),
    ),
  );
}
