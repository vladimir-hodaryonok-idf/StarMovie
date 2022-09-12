class ResponseModel {
  final Map<String, List<String>> headers;
  final List<dynamic> data;

  ResponseModel({
    required this.headers,
    required this.data,
  });
}
