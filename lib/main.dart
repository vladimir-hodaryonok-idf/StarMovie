import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:star_movie/di/init_dependencies.dart';

void main() {
  initDependencies();
  runApp(const StarMovieApp());
}
