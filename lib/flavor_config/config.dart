import 'package:flutter/material.dart';
import 'package:star_movie/flavor_config/values.dart';
import 'package:get_it/get_it.dart';

enum Flavor {
  prod,
  sandBox,
}

// todo unused enum?
class FlavorConfig {
  final String baseUrl;
  final String appTitle;
  final Flavor flavor;

  const FlavorConfig._({
    required this.baseUrl,
    required this.appTitle,
    required this.flavor,
  });

  const FlavorConfig.prod()
      : this._(
          baseUrl: FlavorValues.prodUrl,
          appTitle: FlavorValues.prodTitle,
          flavor: Flavor.prod,
        );

  const FlavorConfig.sandBox()
      : this._(
          baseUrl: FlavorValues.sandBoxUrl,
          appTitle: FlavorValues.sandBoxTitle,
          flavor: Flavor.sandBox,
        );

  bool get isProd => flavor == Flavor.prod;

  bool get isSandBox => flavor == Flavor.sandBox;
}

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
