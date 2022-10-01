const _prod = 'prod';

class DataConfig {
  final String baseUrl;
  final String flavor;

  const DataConfig(this.baseUrl, this.flavor);

  factory DataConfig.fromJson(
    Map<String, dynamic> json,
    String flavor,
  ) {
    switch (flavor) {
      case _prod:
        return DataConfig(
          json['prodUrl'],
          flavor,
        );
      default:
        return DataConfig(
          json['sandBoxUrl'],
          flavor,
        );
    }
  }

  bool get isProd => _prod == flavor;
}
