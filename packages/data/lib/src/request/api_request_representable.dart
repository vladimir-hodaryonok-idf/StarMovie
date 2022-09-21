abstract class HTTPMethod<M> {}

abstract class DioMethods implements HTTPMethod<String> {
  static const String get = 'GET';

  static const String post = 'POST';

  static const String delete = 'DELETE';

  static const String patch = 'PATCH';

  static const String put = 'PUT';
}

abstract class APIRequestRepresentable<T extends HTTPMethod> {
  String get url;

  String? get baseUrl;

  String? get path;

  dynamic get method;

  Map<String, String>? get headers;

  Map<String, dynamic>? get query;

  dynamic get body;
}
