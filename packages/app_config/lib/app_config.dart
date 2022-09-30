library app_config;
import 'package:needle_di/needle_di.dart';
import 'package:flutter/material.dart';
import 'config.dart';

class AppConfig extends InheritedWidget {
  final String title;

  AppConfig({
    required FlavorConfig data,
    required super.child,
    super.key,
  }) : title = data.appTitle {
    Needle.instance.registerLazySingleton<FlavorConfig>(() => data);
  }

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: AppConfig);
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
