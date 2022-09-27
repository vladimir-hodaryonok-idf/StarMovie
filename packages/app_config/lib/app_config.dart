library app_config;

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'config.dart';

class AppConfig extends InheritedWidget {
  final String title;

  AppConfig({
    required FlavorConfig data,
    required super.child,
    super.key,
  }) : title = data.appTitle {
    GetIt.I.registerSingleton<FlavorConfig>(data);
  }

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: AppConfig);
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
