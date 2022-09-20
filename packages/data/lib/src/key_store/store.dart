class ApiKeyStore {
  final Map<String, dynamic> _keys;

  ApiKeyStore(this._keys);

  String get traktApiKey => _keys['traktApiKey'] ?? '';

  String get omdbApiKey => _keys['omdbApiKey'] ?? '';

  String get tmdbApiKey => _keys['tmdbApiKey'] ?? '';
}
