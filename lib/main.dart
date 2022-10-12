import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:star_movie/di/init_dependencies.dart';
import 'package:star_movie/flavor_configurator/flavor_configurator.dart';
import 'firebase_options.dart';

Future<void> initApp(Flavor flavor) async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final flavorConfigurator = FlavorConfigurator(flavor: flavor);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    await initDependencies(flavorConfigurator);
    runApp(
      StarMovieApp(
        config: await flavorConfigurator.configurePresentation(),
      ),
    );
  },
      (error, stack) =>
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
}
