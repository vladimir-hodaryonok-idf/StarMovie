class ListResponseModel {
  final Map<String, List<String>> headers;
  final dynamic data;

  ListResponseModel({
    required this.headers,
    required this.data,
  });
}
