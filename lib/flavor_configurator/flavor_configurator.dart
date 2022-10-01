import 'dart:convert';
import 'package:data/data.dart';
import 'package:flutter/services.dart';
import 'package:presentation/presentation.dart';

enum Flavor { prod, sandBox }

class FlavorConfigurator {
  const FlavorConfigurator._();

  static Future<Map<String, dynamic>> _readJsonConfig() async {
    const keysPath = 'flavor_config.json';
    return rootBundle.loadStructuredData<Map<String, dynamic>>(
      keysPath,
      (keys) async => json.decode(keys),
    );
  }

  static Future<DataConfig> configureData(Flavor flavor) async {
    Map<String, dynamic> jsonConfig = await _readJsonConfig();
    return DataConfig.fromJson(jsonConfig, flavor.name);
  }

  static Future<PresentationConfig> configurePresentation(Flavor flavor) async {
    Map<String, dynamic> jsonConfig = await _readJsonConfig();
    return PresentationConfig.fromJson(jsonConfig, flavor.name);
  }
}
