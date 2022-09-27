import 'package:app_config/const/flavor_const.dart';

enum Flavor { prod, sandbox }

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
          baseUrl: FlavorConstants.prodUrl,
          appTitle: FlavorConstants.prodTitle,
          flavor: Flavor.prod,
        );

  const FlavorConfig.sandBox()
      : this._(
          baseUrl: FlavorConstants.sandBoxUrl,
          appTitle: FlavorConstants.sandBoxTitle,
          flavor: Flavor.sandbox,
        );

  bool get isProd => flavor == Flavor.prod;
}
