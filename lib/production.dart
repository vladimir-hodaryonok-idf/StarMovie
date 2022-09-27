import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:star_movie/di/init_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const StarMovieApp());
}
