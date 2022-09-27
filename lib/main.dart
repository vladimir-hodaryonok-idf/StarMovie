import 'package:app_config/app_config.dart';
import 'package:app_config/config.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:star_movie/di/init_dependencies.dart';

Future<void> mainCommon(FlavorConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    AppConfig(
      data: config,
      child: const StarMovieApp(),
    ),
  );
}
