const _prod = 'prod';

class DataConfig {
  final String baseUrl;
  final String flavor;

  const DataConfig(
    this.baseUrl,
    this.flavor,
  );

  factory DataConfig.fromJson(
    Map<String, dynamic> json,
    String flavor,
  ) =>
      DataConfig(
        json['url'],
        flavor,
      );

  bool get isProd => _prod == flavor;
}
