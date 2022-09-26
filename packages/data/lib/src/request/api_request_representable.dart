abstract class HTTPMethod<M> {}

abstract class DioMethods<String> implements HTTPMethod<String> {
  static const get = 'GET';

  static const post = 'POST';

  static const delete = 'DELETE';

  static const patch = 'PATCH';

  static const put = 'PUT';
}

abstract class APIRequestRepresentable<T extends dynamic> {
  String get url;

  String? get baseUrl;

  String? get path;

  T get method;

  Map<String, String>? get headers;

  Map<String, dynamic>? get query;

  Object? get body;
}
