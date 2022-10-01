class ApiKeyStore {
  final Map<String, dynamic> _keys;
  final bool isProd;

  const ApiKeyStore(
    this.isProd,
    this._keys,
  );

  String get traktApiKey =>
      isProd ? _keys['traktApiKey'] ?? '' : _keys['sandBoxApiKey'] ?? '';

  String get omdbApiKey => _keys['omdbApiKey'] ?? '';

  String get tmdbApiKey => _keys['tmdbApiKey'] ?? '';
}
