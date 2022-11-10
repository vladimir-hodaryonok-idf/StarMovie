import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/style/dimens.dart';
import 'package:star_movie/di/init_dependencies.dart';
import 'package:star_movie/flavor_configurator/flavor_configurator.dart';
import 'package:window_size/window_size.dart';

Future<void> initApp(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  final flavorConfigurator = FlavorConfigurator(flavor: flavor);
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMinSize(Dimens.minWindowSize);
  }
  await Firebase.initializeApp();
  await FirebaseCrashlytics.instance
      .setCrashlyticsCollectionEnabled(kReleaseMode);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  await initDependencies(flavorConfigurator);
  runApp(
    StarMovieApp(
      config: await flavorConfigurator.configurePresentation(),
    ),
  );
}
