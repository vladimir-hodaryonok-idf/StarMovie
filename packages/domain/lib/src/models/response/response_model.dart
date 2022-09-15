class ResponseModel {
  final Map<String, List<String>> headers;
  final dynamic data;

  ResponseModel({
    required this.headers,
    required this.data,
  });
}
