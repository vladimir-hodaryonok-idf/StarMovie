import 'dart:convert';
import 'package:data/data.dart';
import 'package:flutter/services.dart';
import 'package:presentation/presentation.dart';

enum Flavor { prod, sandBox }

class FlavorConfigurator {
  final Flavor flavor;

  const FlavorConfigurator({required this.flavor});

  Future<Map<String, dynamic>> _readJsonConfig() async {
    const sandBoxConfigPath = 'flavor_sandbox_config.json';
    const prodConfigPath = 'flavor_prod_config.json';
    final keysPath = _isProd ? prodConfigPath : sandBoxConfigPath;
    return rootBundle.loadStructuredData<Map<String, dynamic>>(
      keysPath,
      (keys) async => json.decode(keys),
    );
  }

  Future<DataConfig> configureData() async {
    Map<String, dynamic> jsonConfig = await _readJsonConfig();
    return DataConfig.fromJson(jsonConfig, flavor.name);
  }

  Future<PresentationConfig> configurePresentation() async {
    Map<String, dynamic> jsonConfig = await _readJsonConfig();
    return PresentationConfig.fromJson(jsonConfig);
  }

  bool get _isProd => flavor == Flavor.prod;
}
